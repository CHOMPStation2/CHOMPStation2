import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  Box,
  Button,
  ColorBox,
  LabeledList,
  NoticeBox,
  Section,
} from 'tgui-core/components';

type Data = {
  screenstate: string;
  beakerchems: { name: string; displayname: string }[];
  seedname: string;
  health: number;
  plantcolor: string;
  fruitcolor: string;
  chems: { name: string; displayname: string }[];
};

export const PrecisionEditor = (props) => {
  const { data } = useBackend<Data>();
  // Extract `health` and `color` variables from the `data` object.
  const { screenstate } = data;
  return (
    <Window>
      <Window.Content scrollable>
        <Section title="Seed status">
          {screenstate === 'main' && <SeedStatus />}
          {screenstate === 'colors' && <ColorEditor />}
          {screenstate === 'reagents' && <BiochemEditor />}
        </Section>
      </Window.Content>
    </Window>
  );
};

const SeedStatus = (props) => {
  const { act, data } = useBackend<Data>();
  const { health, plantcolor, fruitcolor, chems, seedname } = data;

  return (
    <LabeledList>
      {chems ? (
        <>
          <LabeledList.Item label="Name">{seedname}</LabeledList.Item>
          {health < 100 ? (
            <LabeledList.Item label="Genetic Integrity">
              {100 - health + '%'}
            </LabeledList.Item>
          ) : (
            <LabeledList.Item label="Genetic Integrity">
              {'UNVIABLE'}
            </LabeledList.Item>
          )}

          <LabeledList.Item label="Plant Color">{plantcolor}</LabeledList.Item>
          <LabeledList.Item label="Fruit Color">{fruitcolor}</LabeledList.Item>
          <LabeledList.Divider size={2} />
          <LabeledList.Item label="Chems produced in fruit (click to splice out)">
            {chems.map((item) => (
              <Button
                fluid
                key={item.displayname}
                onClick={() => act('prune', { gene_name: item.name })}
              >
                {item.displayname}
              </Button>
            ))}
          </LabeledList.Item>
          <Button onClick={() => act('change_focus', { window: 'colors' })}>
            Edit Colors
          </Button>
          <Button onClick={() => act('change_focus', { window: 'reagents' })}>
            Add Reagents
          </Button>
          <LabeledList.Divider size={2} />
          <Button onClick={() => act('eject')}>Eject Seed</Button>
        </>
      ) : (
        <LabeledList.Item label="Waiting">
          {'There is currently no seed loaded.'}
        </LabeledList.Item>
      )}
    </LabeledList>
  );
};

const ColorEditor = (props) => {
  const { act, data } = useBackend<Data>();
  const { plantcolor, fruitcolor } = data;

  return (
    <LabeledList>
      <LabeledList.Item label="Plant Color">{plantcolor}</LabeledList.Item>
      <ColorBox color={plantcolor} />
      <LabeledList.Item label="Fruit Color">{fruitcolor}</LabeledList.Item>
      <ColorBox color={fruitcolor} />
      <Button onClick={() => act('change_color', { option: 0 })}>
        Change plant color
      </Button>
      <Button onClick={() => act('change_color', { option: 1 })}>
        Change fruit color
      </Button>
      <LabeledList.Divider size={2} />
      <Button onClick={() => act('change_focus', { window: 'main' })}>
        Return
      </Button>
    </LabeledList>
  );
};

const BiochemEditor = (props) => {
  const { act, data } = useBackend<Data>();
  const { beakerchems, health } = data;

  return (
    <LabeledList>
      {health < 100 ? (
        <LabeledList.Item label="Genetic Integrity">
          {100 - health + '%'}
        </LabeledList.Item>
      ) : (
        <LabeledList.Item label="Genetic Integrity">
          {'UNVIABLE'}
        </LabeledList.Item>
      )}
      <NoticeBox info width={19} height={9} ml={1}>
        {
          'Available chems to choose are based on the reagents stored in the beaker. '
        }
        {
          ' A minimum of 100 units of reagent is required to generate a viable sequence. '
        }
        {'The chosen reagent will be consumed in the process.'}
        <Box bold mt={1}>
          {'This process severely damages genetic integrity.'}
        </Box>
      </NoticeBox>
      <Box width={20} opacity={0.5} ml={1} mt={6} mb={2}>
        {'Plant will produce 1 additional unit for every 25 units beyond 100'}
        {' (modified by potency)'}
      </Box>
      {beakerchems ? (
        <>
          {health < 100 ? (
            <LabeledList.Item label="Available reagents">
              {beakerchems.map((item) => (
                <Button
                  key={item.displayname}
                  fluid
                  onClick={() => act('add_chem', { target_chem: item.name })}
                >
                  {item.displayname}
                </Button>
              ))}
            </LabeledList.Item>
          ) : (
            <NoticeBox warning>
              {'WARNING: Genetic integrity of seed is too poor to proceed.'}
            </NoticeBox>
          )}

          <Button onClick={() => act('eject_beaker')}>Eject Beaker</Button>
        </>
      ) : (
        <LabeledList.Item label="Waiting">
          {'There is currently no beaker loaded.'}
        </LabeledList.Item>
      )}

      <Button onClick={() => act('change_focus', { window: 'main' })}>
        Return
      </Button>
    </LabeledList>
  );
};
