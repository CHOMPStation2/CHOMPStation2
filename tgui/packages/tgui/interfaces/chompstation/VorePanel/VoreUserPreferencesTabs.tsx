import { BooleanLike } from 'common/react';
import { capitalize } from 'common/string';

import { useBackend } from '../../../backend';
import { Box, Button, Flex, NumberInput, Section } from '../../../components';
import { localPrefs, selectedData } from './types';
import { VoreUserPreferenceItem } from './VoreUserPreferenceItem';

export const VoreUserPreferencesMechanical = (props: {
  show_pictures: BooleanLike;
  icon_overflow: BooleanLike;
  preferences: localPrefs;
}) => {
  const { act } = useBackend();
  const { show_pictures, icon_overflow, preferences } = props;

  return (
    <Section
      title="Mechanical Preferences"
      buttons={
        <Button
          icon="eye"
          selected={show_pictures}
          tooltip={
            'Allows to toggle if belly contents are shown as icons or in list format. ' +
            (show_pictures
              ? 'Contents shown as pictures.'
              : 'Contents shown as lists.') +
            (show_pictures && icon_overflow
              ? 'Temporarily disabled. Stomach contents above limits.'
              : '')
          }
          backgroundColor={show_pictures && icon_overflow ? 'orange' : ''}
          onClick={() => act('show_pictures')}
        >
          Contents Preference: {show_pictures ? 'Show Pictures' : 'Show List'}
        </Button>
      }
    >
      <Flex spacing={1} wrap="wrap" justify="center">
        <Flex.Item basis="33%">
          <VoreUserPreferenceItem
            spec={preferences.steppref}
            tooltipPosition="right"
          />
        </Flex.Item>
        <Flex.Item basis="33%" grow={1}>
          <VoreUserPreferenceItem
            spec={preferences.pickuppref}
            tooltipPosition="top"
          />
        </Flex.Item>
        <Flex.Item basis="33%">
          <VoreUserPreferenceItem
            spec={preferences.resize}
            tooltipPosition="left"
          />
        </Flex.Item>
        <Flex.Item basis="33%">
          <VoreUserPreferenceItem
            spec={preferences.feed}
            tooltipPosition="right"
          />
        </Flex.Item>
        <Flex.Item basis="33%" grow={1}>
          <VoreUserPreferenceItem
            spec={preferences.liquid_receive}
            tooltipPosition="top"
          />
        </Flex.Item>
        <Flex.Item basis="33%">
          <VoreUserPreferenceItem
            spec={preferences.liquid_give}
            tooltipPosition="left"
          />
        </Flex.Item>
        <Flex.Item basis="33%">
          <VoreUserPreferenceItem
            spec={preferences.noisy}
            tooltipPosition="right"
          />
        </Flex.Item>
        <Flex.Item basis="33%" grow={1}>
          <VoreUserPreferenceItem
            spec={preferences.noisy_full}
            tooltipPosition="top"
          />
        </Flex.Item>
        <Flex.Item basis="33%">
          <VoreUserPreferenceItem
            spec={preferences.eating_privacy_global}
            tooltipPosition="left"
          />
        </Flex.Item>
        <Flex.Item basis="33%">
          <VoreUserPreferenceItem
            spec={preferences.vore_fx}
            tooltipPosition="right"
          />
        </Flex.Item>
        <Flex.Item basis="33%" grow={1}>
          <VoreUserPreferenceItem
            spec={preferences.spontaneous_tf}
            tooltipPosition="top"
          />
        </Flex.Item>
        <Flex.Item basis="33%">
          <VoreUserPreferenceItem
            spec={preferences.mind_transfer}
            tooltipPosition="top"
          />
        </Flex.Item>
      </Flex>
    </Section>
  );
};

export const VoreUserPreferencesDevouring = (props: {
  devourable: BooleanLike;
  digestModeToColor: Record<string, string | undefined>;
  selective_active: string;
  preferences: localPrefs;
}) => {
  const { act } = useBackend();
  const { devourable, digestModeToColor, selective_active, preferences } =
    props;

  return (
    <Section
      title="Devouring Preferences"
      buttons={
        <Box nowrap>
          <VoreUserPreferenceItem
            spec={preferences.devour}
            tooltipPosition="top"
          />
        </Box>
      }
    >
      {devourable ? (
        <Flex spacing={1} wrap="wrap" justify="center">
          <Flex.Item basis="33%">
            <VoreUserPreferenceItem
              spec={preferences.healbelly}
              tooltipPosition="right"
            />
          </Flex.Item>
          <Flex.Item basis="33%" grow={1}>
            <VoreUserPreferenceItem
              spec={preferences.digestion}
              tooltipPosition="top"
            />
          </Flex.Item>
          <Flex.Item basis="33%">
            <VoreUserPreferenceItem
              spec={preferences.absorbable}
              tooltipPosition="left"
            />
          </Flex.Item>
          <Flex.Item basis="33%">
            <Button
              fluid
              backgroundColor={digestModeToColor[selective_active]}
              tooltip="Allows to set the personal belly mode preference for selective bellies."
              tooltipPosition="right"
              onClick={() => act('switch_selective_mode_pref')}
            >
              {'Selective Mode Preference: ' + capitalize(selective_active)}
            </Button>
          </Flex.Item>
          <Flex.Item basis="33%" grow={1}>
            <VoreUserPreferenceItem
              spec={preferences.mobvore}
              tooltipPosition="top"
            />
          </Flex.Item>
          <Flex.Item basis="33%">
            <VoreUserPreferenceItem
              spec={preferences.autotransferable}
              tooltipPosition="left"
            />
          </Flex.Item>
          <Flex.Item basis="33%">
            <VoreUserPreferenceItem
              spec={preferences.strippref}
              tooltipPosition="right"
            />
          </Flex.Item>
          <Flex.Item basis="33%" grow={1}>
            <VoreUserPreferenceItem
              spec={preferences.liquid_apply}
              tooltipPosition="top"
            />
          </Flex.Item>
          <Flex.Item basis="33%">
            <VoreUserPreferenceItem
              spec={preferences.remains}
              tooltipPosition="left"
            />
          </Flex.Item>
          <Flex.Item basis="33%">
            <VoreUserPreferenceItem
              spec={preferences.toggle_digest_pain}
              tooltipPosition="right"
            />
          </Flex.Item>
        </Flex>
      ) : (
        ''
      )}
    </Section>
  );
};

export const VoreUserPreferencesSpontaneous = (props: {
  can_be_drop_prey: BooleanLike;
  can_be_drop_pred: BooleanLike;
  preferences: localPrefs;
}) => {
  const { can_be_drop_prey, can_be_drop_pred, preferences } = props;

  return (
    <Section
      title="Spontaneous Preferences"
      buttons={
        <Box nowrap>
          <VoreUserPreferenceItem
            spec={preferences.dropnom_prey}
            tooltipPosition="top"
          />
          <VoreUserPreferenceItem
            spec={preferences.dropnom_pred}
            tooltipPosition="top"
          />
        </Box>
      }
    >
      {can_be_drop_prey || can_be_drop_pred ? (
        <Flex spacing={1} wrap="wrap" justify="center">
          <Flex.Item basis="33%">
            <VoreUserPreferenceItem
              spec={preferences.toggle_drop_vore}
              tooltipPosition="right"
            />
          </Flex.Item>
          <Flex.Item basis="33%" grow={1}>
            <VoreUserPreferenceItem
              spec={preferences.toggle_slip_vore}
              tooltipPosition="top"
            />
          </Flex.Item>
          <Flex.Item basis="33%">
            <VoreUserPreferenceItem
              spec={preferences.toggle_stumble_vore}
              tooltipPosition="left"
            />
          </Flex.Item>
          <Flex.Item basis="33%">
            <VoreUserPreferenceItem
              spec={preferences.toggle_throw_vore}
              tooltipPosition="right"
            />
          </Flex.Item>
          <Flex.Item basis="33%" grow={1}>
            <VoreUserPreferenceItem
              spec={preferences.toggle_food_vore}
              tooltipPosition="top"
            />
          </Flex.Item>
          <Flex.Item basis="33%">
            <VoreUserPreferenceItem
              spec={preferences.toggle_phase_vore}
              tooltipPosition="left"
            />
          </Flex.Item>
        </Flex>
      ) : (
        ''
      )}
    </Section>
  );
};

export const VoreUserPreferencesSoulcatcher = (props: {
  soulcatcher_allow_capture: BooleanLike;
  preferences: localPrefs;
}) => {
  const { soulcatcher_allow_capture, preferences } = props;

  return (
    <Section
      title="Soulcatcher Preferences"
      buttons={
        <Box nowrap>
          <VoreUserPreferenceItem
            spec={preferences.soulcatcher}
            tooltipPosition="top"
          />
        </Box>
      }
    >
      {soulcatcher_allow_capture ? (
        <Flex spacing={1} wrap="wrap" justify="center">
          <Flex.Item basis="33%">
            <VoreUserPreferenceItem
              spec={preferences.soulcatcher_transfer}
              tooltipPosition="right"
            />
          </Flex.Item>
          <Flex.Item basis="33%">
            <VoreUserPreferenceItem
              spec={preferences.soulcatcher_delete}
              tooltipPosition="top"
            />
          </Flex.Item>
        </Flex>
      ) : (
        ''
      )}
    </Section>
  );
};

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
                onChange={(e, value) =>
                  act('adjust_no_latejoin_vore_warning_time', {
                    new_pred_time: value,
                  })
                }
              >
                T
              </NumberInput>
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
                onChange={(e, value) =>
                  act('adjust_no_latejoin_prey_warning_time', {
                    new_prey_time: value,
                  })
                }
              >
                T
              </NumberInput>
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

export const VoreUserPreferencesAesthetic = (props: {
  belly_rub_target: string | null;
  selected: selectedData;
  preferences: localPrefs;
}) => {
  const { act } = useBackend();
  const { belly_rub_target, selected, preferences } = props;

  return (
    <Section title="Aesthetic Preferences">
      <Flex spacing={1} wrap="wrap" justify="center">
        <Flex.Item basis="50%" grow={1}>
          <Button fluid icon="grin-tongue" onClick={() => act('setflavor')}>
            Set Taste
          </Button>
        </Flex.Item>
        <Flex.Item basis="50%">
          <Button fluid icon="wind" onClick={() => act('setsmell')}>
            Set Smell
          </Button>
        </Flex.Item>
        <Flex.Item basis="50%" grow={1}>
          <Button
            onClick={() =>
              act('set_attribute', { attribute: 'b_msgs', msgtype: 'en' })
            }
            icon="flask"
            fluid
          >
            Set Nutrition Examine Message
          </Button>
        </Flex.Item>
        <Flex.Item basis="50%">
          <Button
            onClick={() =>
              act('set_attribute', { attribute: 'b_msgs', msgtype: 'ew' })
            }
            icon="weight-hanging"
            fluid
          >
            Set Weight Examine Message
          </Button>
        </Flex.Item>
        <Flex.Item basis="50%" grow={1}>
          <VoreUserPreferenceItem spec={preferences.examine_nutrition} />
        </Flex.Item>
        <Flex.Item basis="50%">
          <VoreUserPreferenceItem spec={preferences.examine_weight} />
        </Flex.Item>
        <Flex.Item basis="50%" grow={1}>
          <Button fluid onClick={() => act('set_vs_color')} icon="palette">
            Vore Sprite Color
          </Button>
        </Flex.Item>
        <Flex.Item basis="50%">
          <Button fluid onClick={() => act('set_belly_rub')} icon="crosshairs">
            {'Belly Rub Target: ' +
              (belly_rub_target
                ? belly_rub_target
                : 'Current Active (' + selected.belly_name + ')')}
          </Button>
        </Flex.Item>
      </Flex>
    </Section>
  );
};
