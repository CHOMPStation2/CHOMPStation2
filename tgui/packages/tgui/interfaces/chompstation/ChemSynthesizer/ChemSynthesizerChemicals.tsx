import { useBackend } from 'tgui/backend';
import { BeakerContents } from 'tgui/interfaces/common/BeakerContents';
import { Box, Button, Section, Stack } from 'tgui-core/components';

import type { Data } from './types';

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
    <Stack direction="column">
      <Section title="Cartridge Reagents" flexGrow>
        <Stack direction="row" wrap="wrap" height="100%" align="flex-start">
          {chemicals.map((c, i) => (
            <Stack.Item key={i} grow m={0.2} basis="40%" height="20px">
              <Button
                icon="arrow-circle-down"
                width="100%"
                height="100%"
                align="flex-start"
                disabled={1}
              >
                {c.title + ' (' + c.amount + ')'}
              </Button>
            </Stack.Item>
          ))}
          {flexFillers.map((_, i) => (
            <Stack.Item key={i} grow basis="25%" height="20px" />
          ))}
        </Stack>
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
        minHeight="25%"
        buttons={
          <Stack>
            {!!catalyst && (
              <Stack.Item>
                <Box inline color="label" mr={2}>
                  {catalystCurrentVolume} / {catalystMaxVolume} units
                </Box>
              </Stack.Item>
            )}
            <Stack.Item>
              <Button
                icon="eject"
                disabled={!catalyst || !!busy}
                onClick={() => act('eject_catalyst')}
              >
                Eject
              </Button>
            </Stack.Item>
          </Stack>
        }
      >
        <BeakerContents
          beakerLoaded={catalyst}
          beakerContents={catalyst_reagents}
        />
      </Section>
    </Stack>
  );
};
