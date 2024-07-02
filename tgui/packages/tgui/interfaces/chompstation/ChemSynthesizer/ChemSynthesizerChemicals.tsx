import { useBackend } from '../../../backend';
import { Box, Button, Flex, Section } from '../../../components';
import { BeakerContents } from '../.././common/BeakerContents';
import { Data } from './types';

export const ChemSynthesizerChemicals = (props) => {
  const { act, data } = useBackend<Data>();
  const {
    busy,
    chemicals = [],
    rxn_vessel = [],
    catalyst,
    catalystCurrentVolume,
    catalystMaxVolume,
    catalyst_reagents = [],
  } = data;

  const flexFillers: boolean[] = [];
  for (let i = 0; i < (chemicals.length + 1) % 3; i++) {
    flexFillers.push(true);
  }
  return (
    <Flex direction="column">
      <Section title="Cartridge Reagents" flexGrow>
        <Flex direction="row" wrap="wrap" height="100%" align="flex-start">
          {chemicals.map((c, i) => (
            <Flex.Item key={i} grow="1" m={0.2} basis="40%" height="20px">
              <Button
                icon="arrow-circle-down"
                width="100%"
                height="100%"
                align="flex-start"
                disabled={1}
              >
                {c.title + ' (' + c.amount + ')'}
              </Button>
            </Flex.Item>
          ))}
          {flexFillers.map((_, i) => (
            <Flex.Item key={i} grow="1" basis="25%" height="20px" />
          ))}
        </Flex>
      </Section>
      <Section title="Reaction Vessel">
        {rxn_vessel.length > 0 ? (
          <BeakerContents beakerLoaded beakerContents={rxn_vessel} />
        ) : (
          <Box color="label">Vessel is empty.</Box>
        )}
      </Section>
      <Section
        title="Catalyst"
        flex="content"
        minHeight="25%"
        buttons={
          <Box>
            {!!catalyst && (
              <Box inline color="label" mr={2}>
                {catalystCurrentVolume} / {catalystMaxVolume} units
              </Box>
            )}
            <Button
              icon="eject"
              disabled={!catalyst || !!busy}
              onClick={() => act('eject_catalyst')}
            >
              Eject
            </Button>
          </Box>
        }
      >
        <BeakerContents
          beakerLoaded={catalyst}
          beakerContents={catalyst_reagents}
        />
      </Section>
    </Flex>
  );
};
