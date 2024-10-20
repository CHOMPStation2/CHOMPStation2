import { useBackend } from '../../backend';
import {
  Button,
  Flex,
  LabeledList,
  NoticeBox,
  Section,
  Stack,
  Table,
  Tabs,
} from '../../components';
import { Window } from '../../layouts';

type Data = {
  beakerLoaded: boolean;
  beakerContainsBlood: boolean;
  beakerContainsVirus: boolean;
  resistances: string[];
  selectedStrainIndex: number;
  strains: Strain[];
  synthesisCooldown: boolean;
};

type Strain = {
  commonName: string;
  description: string;
  diseaseAgent: string;
  bloodDNA: string;
  bloodType: string;
  possibleTreatments: string;
  transmissionRoute: string;
  isAdvanced: boolean;
  symptoms: Symptom[];
};

type Symptom = {
  name: string;
  stealth: number;
  resistance: number;
  stageSpeed: number;
  transmissibility: number;
};

export const PanDEMIC = () => {
  const { data } = useBackend<Data>();
  const {
    beakerLoaded,
    beakerContainsBlood,
    beakerContainsVirus,
    resistances,
  } = data;

  let emptyPlaceholder: JSX.Element | null = null;
  if (!beakerLoaded) {
    emptyPlaceholder = <>No container loaded.</>;
  } else if (!beakerContainsBlood) {
    emptyPlaceholder = <>No blood sample found in the loaded container.</>;
  } else if (beakerContainsBlood && !beakerContainsVirus) {
    emptyPlaceholder = <>No disease detected in provided blood sample.</>;
  }

  return (
    <Window width={575} height={510}>
      <Window.Content>
        <Stack fill vertical>
          {emptyPlaceholder && !beakerContainsVirus ? (
            <Section
              title="Container Information"
              buttons={<CommonCultureActions />}
            >
              <NoticeBox>{emptyPlaceholder}</NoticeBox>
            </Section>
          ) : (
            <CultureInformationSection />
          )}
          {resistances.length > 0 && <ResistancesSection />}
        </Stack>
      </Window.Content>
    </Window>
  );
};

const CommonCultureActions = () => {
  const { act, data } = useBackend<Data>();
  const { beakerLoaded } = data;
  return (
    <>
      <Button
        icon="eject"
        disabled={!beakerLoaded}
        onClick={() => act('eject_beaker')}
      >
        Eject
      </Button>
      <Button.Confirm
        icon="trash-alt"
        confirmIcon="eraser"
        disabled={!beakerLoaded}
        onClick={() => act('destroy_eject_beaker')}
      >
        Destroy
      </Button.Confirm>
    </>
  );
};

const CultureInformationSection = () => {
  const { act, data } = useBackend<Data>();
  const { selectedStrainIndex, strains } = data;

  if (strains.length === 0) {
    return (
      <Section title="Container Information" buttons={<CommonCultureActions />}>
        <NoticeBox>No disease detected in provided blood sample.</NoticeBox>
      </Section>
    );
  }

  const selectedStrain = strains[selectedStrainIndex - 1];

  return (
    <Stack.Item grow>
      <Section
        title="Culture Information"
        fill
        buttons={<CommonCultureActions />}
      >
        <Flex direction="column" style={{ height: '100%' }}>
          <Flex.Item>
            <Tabs>
              {strains.map((strain, i) => (
                <Tabs.Tab
                  key={i}
                  icon="virus"
                  selected={selectedStrainIndex - 1 === i}
                  onClick={() => act('switch_strain', { strain_index: i + 1 })}
                >
                  {strain.commonName ?? 'Unknown'}
                </Tabs.Tab>
              ))}
            </Tabs>
          </Flex.Item>
          <Flex.Item grow>
            <StrainInformationSection
              strain={selectedStrain}
              strainIndex={selectedStrainIndex}
            />
            {selectedStrain && selectedStrain.symptoms.length > 0 && (
              <StrainSymptomsSection strain={selectedStrain} />
            )}
          </Flex.Item>
        </Flex>
      </Section>
    </Stack.Item>
  );
};

const StrainInformationSection = ({
  strain,
  strainIndex,
}: {
  strain: Strain | undefined;
  strainIndex: number;
}) => {
  const { act, data } = useBackend<Data>();
  const synthesisCooldown = data.synthesisCooldown;

  return (
    <Flex.Item>
      <Section
        title="Strain Information"
        buttons={
          <>
            <Button
              icon={synthesisCooldown ? 'spinner' : 'clone'}
              iconSpin={synthesisCooldown}
              disabled={synthesisCooldown}
              onClick={() => act('clone_strain', { strain_index: strainIndex })}
            >
              Clone
            </Button>
            <CommonCultureActions />
          </>
        }
      >
        {strain ? (
          <StrainInformation strain={strain} strainIndex={strainIndex} />
        ) : (
          <NoticeBox>No strain information available.</NoticeBox>
        )}
      </Section>
    </Flex.Item>
  );
};

const StrainSymptomsSection = ({ strain }: { strain: Strain }) => {
  const symptoms = strain.symptoms;

  return (
    <Flex.Item grow>
      <Section title="Infection Symptoms" fill>
        <Table>
          <Table.Row header>
            <Table.Cell>Name</Table.Cell>
            <Table.Cell>Stealth</Table.Cell>
            <Table.Cell>Resistance</Table.Cell>
            <Table.Cell>Stage Speed</Table.Cell>
            <Table.Cell>Transmissibility</Table.Cell>
          </Table.Row>
          {symptoms.map((symptom, index) => (
            <Table.Row key={index}>
              <Table.Cell>{symptom.name}</Table.Cell>
              <Table.Cell>{symptom.stealth}</Table.Cell>
              <Table.Cell>{symptom.resistance}</Table.Cell>
              <Table.Cell>{symptom.stageSpeed}</Table.Cell>
              <Table.Cell>{symptom.transmissibility}</Table.Cell>
            </Table.Row>
          ))}
        </Table>
      </Section>
    </Flex.Item>
  );
};

const StrainInformation = ({
  strain,
  strainIndex,
}: {
  strain: Strain;
  strainIndex: number;
}) => {
  const { act, data } = useBackend<Data>();
  const { beakerContainsVirus } = data;
  const {
    commonName,
    description,
    diseaseAgent,
    bloodDNA,
    bloodType,
    possibleTreatments,
    transmissionRoute,
    isAdvanced,
  } = strain;

  return (
    <LabeledList>
      <LabeledList.Item label="Common Name">
        <Flex align="center">
          {commonName ?? 'Unknown'}
          {isAdvanced && (
            <Button
              icon="pen"
              onClick={() => act('name_strain', { strain_index: strainIndex })}
              style={{ marginLeft: 'auto' }}
            >
              Name Disease
            </Button>
          )}
        </Flex>
      </LabeledList.Item>
      {description && (
        <LabeledList.Item label="Description">{description}</LabeledList.Item>
      )}
      <LabeledList.Item label="Disease Agent">{diseaseAgent}</LabeledList.Item>
      <LabeledList.Item label="Blood DNA">
        {bloodDNA || 'Undetectable'}
      </LabeledList.Item>
      <LabeledList.Item label="Blood Type">
        {bloodType || 'Undetectable'}
      </LabeledList.Item>
      <LabeledList.Item label="Spread Vector">
        {transmissionRoute || 'None'}
      </LabeledList.Item>
      <LabeledList.Item label="Possible Cures">
        {possibleTreatments || 'None'}
      </LabeledList.Item>
    </LabeledList>
  );
};

const ResistancesSection = () => {
  const { act, data } = useBackend<Data>();
  const { resistances, synthesisCooldown } = data;
  const vaccineIcons = ['flask', 'vial', 'eye-dropper'];

  return (
    <Stack.Item>
      <Section title="Antibodies" fill>
        <Stack direction="row" wrap>
          {resistances.map((resistance, index) => (
            <Stack.Item key={index}>
              <Button
                icon={vaccineIcons[index % vaccineIcons.length]}
                disabled={synthesisCooldown}
                onClick={() =>
                  act('clone_vaccine', { resistance_index: index + 1 })
                }
              />
              {resistance}
            </Stack.Item>
          ))}
        </Stack>
      </Section>
    </Stack.Item>
  );
};
