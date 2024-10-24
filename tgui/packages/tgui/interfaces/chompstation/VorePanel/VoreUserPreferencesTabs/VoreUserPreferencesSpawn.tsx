import { BooleanLike } from 'common/react';
import { useBackend } from 'tgui/backend';
import { Box, Button, Flex, NumberInput, Section } from 'tgui/components';

import { localPrefs } from '../types';
import { VoreUserPreferenceItem } from '../VoreUserPreferenceItem';

export const VoreUserPreferencesSpawn = (props: {
  latejoin_vore: BooleanLike;
  no_spawnpred_warning_time: number;
  no_spawnpred_warning_save: BooleanLike;
  latejoin_prey: BooleanLike;
  no_spawnprey_warning_time: number;
  no_spawnprey_warning_save: BooleanLike;
  preferences: localPrefs;
}) => {
  const { act } = useBackend();
  const {
    latejoin_vore,
    no_spawnpred_warning_time,
    no_spawnpred_warning_save,
    latejoin_prey,
    no_spawnprey_warning_time,
    no_spawnprey_warning_save,
    preferences,
  } = props;

  return (
    <Section
      title="Spawn Preferences"
      buttons={
        <Box nowrap>
          <VoreUserPreferenceItem
            spec={preferences.spawnbelly}
            tooltipPosition="top"
          />
          <VoreUserPreferenceItem
            spec={preferences.spawnprey}
            tooltipPosition="top"
          />
        </Box>
      }
    >
      <Flex spacing={1} wrap="wrap" justify="center">
        {latejoin_vore ? (
          <>
            <Flex.Item basis="33%">
              <VoreUserPreferenceItem
                spec={preferences.no_spawnpred_warning}
                tooltipPosition="top"
              />
            </Flex.Item>
            <Flex.Item basis="12%">
              <NumberInput
                fluid
                value={no_spawnpred_warning_time}
                minValue={0}
                maxValue={30}
                unit="s"
                step={5}
                stepPixelSize={20}
                onChange={(value) =>
                  act('adjust_no_latejoin_vore_warning_time', {
                    new_pred_time: value,
                  })
                }
              />
            </Flex.Item>
            <Flex.Item basis="5%">
              <Button
                fluid
                backgroundColor={no_spawnpred_warning_save ? 'green' : ''}
                tooltip="Toggles vore spawnpoint auto accept persistency."
                tooltipPosition="top"
                onClick={() => act('toggle_no_latejoin_vore_warning_persists')}
              >
                P
              </Button>
            </Flex.Item>
          </>
        ) : (
          ''
        )}
        {latejoin_prey ? (
          <>
            <Flex.Item basis="33%">
              <VoreUserPreferenceItem
                spec={preferences.no_spawnprey_warning}
                tooltipPosition="top"
              />
            </Flex.Item>
            <Flex.Item basis="12%">
              <NumberInput
                fluid
                value={no_spawnprey_warning_time}
                minValue={0}
                maxValue={30}
                unit="s"
                step={5}
                stepPixelSize={20}
                onChange={(value) =>
                  act('adjust_no_latejoin_prey_warning_time', {
                    new_prey_time: value,
                  })
                }
              />
            </Flex.Item>
            <Flex.Item basis="5%">
              <Button
                fluid
                backgroundColor={no_spawnprey_warning_save ? 'green' : ''}
                tooltip="Toggles preyspawn auto accept persistency."
                tooltipPosition="top"
                onClick={() => act('toggle_no_latejoin_prey_warning_persists')}
              >
                P
              </Button>
            </Flex.Item>
          </>
        ) : (
          ''
        )}
      </Flex>
    </Section>
  );
};
