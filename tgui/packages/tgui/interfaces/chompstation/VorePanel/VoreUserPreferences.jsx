import { capitalize } from 'common/string';

import { useBackend } from '../../../backend';
import {
  Box,
  Button,
  Divider,
  Flex,
  NumberInput,
  Section,
} from '../../../components';
import { digestModeToColor } from './constants';
import { VoreUserPreferenceItem } from './VoreUserPreferenceItem';

export const VoreUserPreferences = (props) => {
  const { act, data } = useBackend();

  const {
    digestable,
    absorbable,
    devourable,
    allowmobvore,
    feeding,
    permit_healbelly,
    can_be_drop_prey,
    can_be_drop_pred,
    drop_vore,
    slip_vore,
    stumble_vore,
    throw_vore,
    phase_vore,
    food_vore,
    latejoin_vore,
    latejoin_prey,
    noisy,
    noisy_full,
    resizable,
    step_mechanics_active,
    show_vore_fx,
    digest_leave_remains,
    pickup_mechanics_active,
    allow_spontaneous_tf,
    eating_privacy_global,
    strip_mechanics_active,
    autotransferable,
    liq_rec,
    liq_giv,
    liq_apply,
    no_spawnpred_warning,
    no_spawnprey_warning,
    no_spawnpred_warning_time,
    no_spawnprey_warning_time,
    no_spawnpred_warning_save,
    no_spawnprey_warning_save,
    nutrition_message_visible,
    weight_message_visible,
    selective_active,
  } = data.prefs;

  const { show_pictures, overflow } = data;

  const preferences = {
    digestion: {
      action: 'toggle_digest',
      test: digestable,
      tooltip: {
        main: "This button is for those who don't like being digested. It can make you undigestable.",
        enable: 'Click here to allow digestion.',
        disable: 'Click here to prevent digestion.',
      },
      content: {
        enabled: 'Digestion Allowed',
        disabled: 'No Digestion',
      },
    },
    absorbable: {
      action: 'toggle_absorbable',
      test: absorbable,
      tooltip: {
        main: "This button allows preds to know whether you prefer or don't prefer to be absorbed.",
        enable: 'Click here to allow being absorbed.',
        disable: 'Click here to disallow being absorbed.',
      },
      content: {
        enabled: 'Absorption Allowed',
        disabled: 'No Absorption',
      },
    },
    devour: {
      action: 'toggle_devour',
      test: devourable,
      fluid: false,
      tooltip: {
        main: 'This button is to toggle your ability to be devoured by others.',
        enable: 'Click here to allow being devoured.',
        disable: 'Click here to prevent being devoured.',
      },
      content: {
        enabled: 'Devouring Allowed',
        disabled: 'No Devouring',
      },
    },
    mobvore: {
      action: 'toggle_mobvore',
      test: allowmobvore,
      tooltip: {
        main: "This button is for those who don't like being eaten by mobs.",
        enable: 'Click here to allow being eaten by mobs.',
        disable: 'Click here to prevent being eaten by mobs.',
      },
      content: {
        enabled: 'Mobs eating you allowed',
        disabled: 'No Mobs eating you',
      },
    },
    feed: {
      action: 'toggle_feed',
      test: feeding,
      tooltip: {
        main: 'This button is to toggle your ability to be fed to or by others vorishly.',
        enable: 'Click here to allow being fed to/by other people.',
        disable: 'Click here to prevent being fed to/by other people.',
      },
      content: {
        enabled: 'Feeding Allowed',
        disabled: 'No Feeding',
      },
    },
    healbelly: {
      action: 'toggle_healbelly',
      test: permit_healbelly,
      tooltip: {
        main: "This button is for those who don't like healbelly used on them as a mechanic.",
        enable: 'Click here to allow being heal-bellied.',
        disable: 'Click here to prevent being heal-bellied.',
      },
      content: {
        enabled: 'Heal-bellies Allowed',
        disabled: 'No Heal-bellies',
      },
    },
    dropnom_prey: {
      action: 'toggle_dropnom_prey',
      test: can_be_drop_prey,
      fluid: false,
      tooltip: {
        main:
          'This toggle is for spontaneous, environment related vore' +
          ' as prey, including drop-noms, teleporters, etc.',
        enable: 'Click here to allow being spontaneous prey.',
        disable: 'Click here to prevent being spontaneous prey.',
      },
      content: {
        enabled: 'Spontaneous Prey Enabled',
        disabled: 'Spontaneous Prey Disabled',
      },
    },
    dropnom_pred: {
      action: 'toggle_dropnom_pred',
      test: can_be_drop_pred,
      fluid: false,
      tooltip: {
        main:
          'This toggle is for spontaneous, environment related vore' +
          ' as a predator, including drop-noms, teleporters, etc.',
        enable: 'Click here to allow being spontaneous pred.',
        disable: 'Click here to prevent being spontaneous pred.',
      },
      content: {
        enabled: 'Spontaneous Pred Enabled',
        disabled: 'Spontaneous Pred Disabled',
      },
    },
    toggle_drop_vore: {
      action: 'toggle_drop_vore',
      test: drop_vore,
      tooltip: {
        main:
          'Allows for dropnom spontaneous vore to occur. ' +
          'Note, you still need spontaneous vore pred and/or prey enabled.',
        enable: 'Click here to allow for dropnoms.',
        disable: 'Click here to disable dropnoms.',
      },
      content: {
        enabled: 'Drop Noms Enabled',
        disabled: 'Drop Noms Disabled',
      },
    },
    toggle_slip_vore: {
      action: 'toggle_slip_vore',
      test: slip_vore,
      tooltip: {
        main:
          'Allows for slip related spontaneous vore to occur. ' +
          'Note, you still need spontaneous vore pred and/or prey enabled.',
        enable: 'Click here to allow for slip vore.',
        disable: 'Click here to disable slip vore.',
      },
      content: {
        enabled: 'Slip Vore Enabled',
        disabled: 'Slip Vore Disabled',
      },
    },
    toggle_stumble_vore: {
      action: 'toggle_stumble_vore',
      test: stumble_vore,
      tooltip: {
        main:
          'Allows for stumble related spontaneous vore to occur. ' +
          ' Note, you still need spontaneous vore pred and/or prey enabled.',
        enable: 'Click here to allow for stumble vore.',
        disable: 'Click here to disable stumble vore.',
      },
      content: {
        enabled: 'Stumble Vore Enabled',
        disabled: 'Stumble Vore Disabled',
      },
    },
    toggle_throw_vore: {
      action: 'toggle_throw_vore',
      test: throw_vore,
      tooltip: {
        main:
          'Allows for throw related spontaneous vore to occur. ' +
          ' Note, you still need spontaneous vore pred and/or prey enabled.',
        enable: 'Click here to allow for throw vore.',
        disable: 'Click here to disable throw vore.',
      },
      content: {
        enabled: 'Throw Vore Enabled',
        disabled: 'Throw Vore Disabled',
      },
    },
    toggle_phase_vore: {
      action: 'toggle_phase_vore',
      test: phase_vore,
      tooltip: {
        main:
          'Allows for phasing related spontaneous vore to occur. ' +
          ' Note, you still need spontaneous vore pred and/or prey enabled.',
        enable: 'Click here to allow for phase vore.',
        disable: 'Click here to disable phase vore.',
      },
      content: {
        enabled: 'Phase Vore Enabled',
        disabled: 'Phase Vore Disabled',
      },
    },
    toggle_food_vore: {
      action: 'toggle_food_vore',
      test: food_vore,
      tooltip: {
        main:
          'Allows for food related spontaneous vore to occur. ' +
          ' Note, you still need spontaneous vore pred and/or prey enabled.',
        enable: 'Click here to allow for food vore.',
        disable: 'Click here to disable food vore.',
      },
      content: {
        enabled: 'Food Vore Enabled',
        disabled: 'Food Vore Disabled',
      },
    },
    spawnbelly: {
      action: 'toggle_latejoin_vore',
      test: latejoin_vore,
      fluid: false,
      tooltip: {
        main: 'Toggle late join vore spawnpoint.',
        enable: 'Click here to turn on vorish spawnpoint.',
        disable: 'Click here to turn off vorish spawnpoint.',
      },
      content: {
        enabled: 'Vore Spawn Pred Enabled',
        disabled: 'Vore Spawn Pred Disabled',
      },
    },
    spawnprey: {
      action: 'toggle_latejoin_prey',
      test: latejoin_prey,
      fluid: false,
      tooltip: {
        main: 'Toggle late join preds spawning on you.',
        enable: 'Click here to turn on preds spawning around you.',
        disable: 'Click here to turn off preds spawning around you.',
      },
      content: {
        enabled: 'Vore Spawn Prey Enabled',
        disabled: 'Vore Spawn Prey Disabled',
      },
    },
    noisy: {
      action: 'toggle_noisy',
      test: noisy,
      tooltip: {
        main: 'Toggle audible hunger noises.',
        enable: 'Click here to turn on hunger noises.',
        disable: 'Click here to turn off hunger noises.',
      },
      content: {
        enabled: 'Hunger Noises Enabled',
        disabled: 'Hunger Noises Disabled',
      },
    },
    noisy_full: {
      action: 'toggle_noisy_full',
      test: noisy_full,
      tooltip: {
        main: 'Toggle belching while full.',
        enable: 'Click here to turn on belching while full.',
        disable: 'Click here to turn off belching while full.',
      },
      content: {
        enabled: 'Belching Enabled',
        disabled: 'Belching Disabled',
      },
    },
    resize: {
      action: 'toggle_resize',
      test: resizable,
      tooltip: {
        main: 'This button is to toggle your ability to be resized by others.',
        enable: 'Click here to allow being resized.',
        disable: 'Click here to prevent being resized.',
      },
      content: {
        enabled: 'Resizing Allowed',
        disabled: 'No Resizing',
      },
    },
    steppref: {
      action: 'toggle_steppref',
      test: step_mechanics_active,
      tooltip: {
        main: '',
        enable:
          'You will not participate in step mechanics.' +
          ' Click to enable step mechanics.',
        disable:
          'This setting controls whether or not you participate in size-based step mechanics.' +
          ' Includes both stepping on others, as well as getting stepped on. Click to disable step mechanics.',
      },
      content: {
        enabled: 'Step Mechanics Enabled',
        disabled: 'Step Mechanics Disabled',
      },
    },
    vore_fx: {
      action: 'toggle_fx',
      test: show_vore_fx,
      tooltip: {
        main: '',
        enable:
          'Regardless of Predator Setting, you will not see their FX settings.' +
          ' Click this to enable showing FX.',
        disable:
          'This setting controls whether or not a pred is allowed to mess with your HUD and fullscreen overlays.' +
          ' Click to disable all FX.',
      },
      content: {
        enabled: 'Show Vore FX',
        disabled: 'Do Not Show Vore FX',
      },
    },
    remains: {
      action: 'toggle_leaveremains',
      test: digest_leave_remains,
      tooltip: {
        main: '',
        enable:
          'Regardless of Predator Setting, you will not leave remains behind.' +
          ' Click this to allow leaving remains.',
        disable:
          'Your Predator must have this setting enabled in their belly modes to allow remains to show up,' +
          ' if they do not, they will not leave your remains behind, even with this on. Click to disable remains.',
      },
      content: {
        enabled: 'Allow Leaving Remains',
        disabled: 'Do Not Allow Leaving Remains',
      },
    },
    pickuppref: {
      action: 'toggle_pickuppref',
      test: pickup_mechanics_active,
      tooltip: {
        main: '',
        enable:
          'You will not participate in pick-up mechanics.' +
          ' Click this to allow picking up/being picked up.',
        disable:
          'Allows macros to pick you up into their hands, and you to pick up micros.' +
          ' Click to disable pick-up mechanics.',
      },
      content: {
        enabled: 'Pick-up Mechanics Enabled',
        disabled: 'Pick-up Mechanics Disabled',
      },
    },
    spontaneous_tf: {
      action: 'toggle_allow_spontaneous_tf',
      test: allow_spontaneous_tf,
      tooltip: {
        main:
          'This toggle is for spontaneous or environment related transformation' +
          ' as a victim, such as via chemicals.',
        enable: 'Click here to allow being spontaneously transformed.',
        disable: 'Click here to disable being spontaneously transformed.',
      },
      content: {
        enabled: 'Spontaneous TF Enabled',
        disabled: 'Spontaneous TF Disabled',
      },
    },
    examine_nutrition: {
      action: 'toggle_nutrition_ex',
      test: nutrition_message_visible,
      tooltip: {
        main: '',
        enable: 'Click here to enable nutrition messages.',
        disable: 'Click here to disable nutrition messages.',
      },
      content: {
        enabled: 'Examine Nutrition Messages Active',
        disabled: 'Examine Nutrition Messages Inactive',
      },
    },
    examine_weight: {
      action: 'toggle_weight_ex',
      test: weight_message_visible,
      tooltip: {
        main: '',
        enable: 'Click here to enable weight messages.',
        disable: 'Click here to disable weight messages.',
      },
      content: {
        enabled: 'Examine Weight Messages Active',
        disabled: 'Examine Weight Messages Inactive',
      },
    },
    strippref: {
      action: 'toggle_strippref',
      test: strip_mechanics_active,
      tooltip: {
        main: '',
        enable:
          'Regardless of Predator Setting, you will not be stripped inside their bellies.' +
          ' Click this to allow stripping.',
        disable:
          'Your Predator must have this setting enabled in their belly modes to allow stripping your gear,' +
          ' if they do not, they will not strip your gear, even with this on. Click to disable stripping.',
      },
      content: {
        enabled: 'Allow Worn Item Stripping',
        disabled: 'Do Not Allow Worn Item Stripping',
      },
    },
    eating_privacy_global: {
      action: 'toggle_global_privacy',
      test: eating_privacy_global,
      tooltip: {
        main:
          'Sets default belly behaviour for vorebellies for announcing' +
          ' ingesting or expelling prey' +
          ' Overwritten by belly-specific preferences if set.',
        enable: ' Click here to turn your messages subtle',
        disable: ' Click here to turn your  messages loud',
      },
      content: {
        enabled: 'Global Vore Privacy: Subtle',
        disabled: 'Global Vore Privacy: Loud',
      },
    },
    autotransferable: {
      action: 'toggle_autotransferable',
      test: autotransferable,
      tooltip: {
        main: 'This button is for allowing or preventing belly auto-transfer mechanics from moving you.',
        enable: 'Click here to allow autotransfer.',
        disable: 'Click here to prevent autotransfer.',
      },
      content: {
        enabled: 'Auto-Transfer Allowed',
        disabled: 'Do Not Allow Auto-Transfer',
      },
    },
    liquid_receive: {
      action: 'toggle_liq_rec',
      test: liq_rec,
      tooltip: {
        main: 'This button is for allowing or preventing others from giving you liquids from their vore organs.',
        enable: 'Click here to allow receiving liquids.',
        disable: 'Click here to prevent receiving liquids.',
      },
      content: {
        enabled: 'Receiving Liquids Allowed',
        disabled: 'Do Not Allow Receiving Liquids',
      },
    },
    liquid_give: {
      action: 'toggle_liq_giv',
      test: liq_giv,
      tooltip: {
        main: 'This button is for allowing or preventing others from taking liquids from your vore organs.',
        enable: 'Click here to allow taking liquids.',
        disable: 'Click here to prevent taking liquids.',
      },
      content: {
        enabled: 'Taking Liquids Allowed',
        disabled: 'Do Not Allow Taking Liquids',
      },
    },
    liquid_apply: {
      action: 'toggle_liq_apply',
      test: liq_apply,
      tooltip: {
        main: 'This button is for allowing or preventing vorgans from applying liquids to you.',
        enable: 'Click here to allow the application of liquids.',
        disable: 'Click here to prevent the application of liquids.',
      },
      content: {
        enabled: 'Applying Liquids Allowed',
        disabled: 'Do Not Allow Applying Liquids',
      },
    },
    no_spawnpred_warning: {
      action: 'toggle_no_latejoin_vore_warning',
      test: no_spawnpred_warning,
      tooltip: {
        main:
          'This button is to disable the vore spawnpoint confirmations ' +
          (no_spawnpred_warning_save
            ? '(round persistent).'
            : '(no round persistence).'),
        enable:
          'Click here to auto accept spawnpoint confirmations after ' +
          String(no_spawnpred_warning_time) +
          ' seconds.',
        disable:
          'Click here to no longer auto accept spawnpoint confirmations after ' +
          String(no_spawnpred_warning_time) +
          ' seconds.',
      },
      back_color: {
        enabled: no_spawnpred_warning_save ? 'green' : '#8B8000',
        disabled: '',
      },
      content: {
        enabled: 'Vore Spawn Pred Auto Accept Enabled',
        disabled: 'Vore Spawn Pred Auto Accept Disabled',
      },
    },
    no_spawnprey_warning: {
      action: 'toggle_no_latejoin_prey_warning',
      test: no_spawnprey_warning,
      tooltip: {
        main:
          'This button is to disable the pred spawning on you confirmations ' +
          (no_spawnprey_warning_save
            ? '(round persistent).'
            : '(no round persistence).'),
        enable:
          'Click here to auto accept pred spawn confirmations after ' +
          String(no_spawnprey_warning_time) +
          ' seconds.',
        disable:
          'Click here to no longer auto accept pred spawn confirmations after ' +
          String(no_spawnprey_warning_time) +
          ' seconds.',
      },
      back_color: {
        enabled: no_spawnprey_warning_save ? 'green' : '#8B8000',
        disabled: '',
      },
      content: {
        enabled: 'Vore Spawn Prey Auto Accept Enabled',
        disabled: 'Vore Spawn Prey Auto Accept Disabled',
      },
    },
  };

  return (
    <Box nowrap>
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
              (show_pictures && overflow
                ? 'Temporarily disabled. Stomach contents above limits.'
                : '')
            }
            backgroundColor={show_pictures && overflow ? 'orange' : ''}
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
          <Flex.Item basis="33%">
            <VoreUserPreferenceItem
              spec={preferences.spontaneous_tf}
              tooltipPosition="top"
            />
          </Flex.Item>
        </Flex>
      </Section>
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
                content={
                  'Selective Mode Preference: ' + capitalize(selective_active)
                }
                backgroundColor={digestModeToColor[selective_active]}
                tooltip="Allows to set the personal belly mode preference for selective bellies."
                tooltipPosition="right"
                onClick={() => act('switch_selective_mode_pref')}
              />
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
          </Flex>
        ) : (
          ''
        )}
      </Section>
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
                  content={'P'}
                  backgroundColor={no_spawnpred_warning_save ? 'green' : ''}
                  tooltip="Toggles vore spawnpoint auto accept persistency."
                  tooltipPosition="top"
                  onClick={() =>
                    act('toggle_no_latejoin_vore_warning_persists')
                  }
                />
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
                  content={'P'}
                  backgroundColor={no_spawnprey_warning_save ? 'green' : ''}
                  tooltip="Toggles preyspawn auto accept persistency."
                  tooltipPosition="top"
                  onClick={() =>
                    act('toggle_no_latejoin_prey_warning_persists')
                  }
                />
              </Flex.Item>
            </>
          ) : (
            ''
          )}
        </Flex>
      </Section>
      <Section title="Aesthetic Preferences">
        <Flex spacing={1} wrap="wrap" justify="center">
          <Flex.Item basis="50%" grow={1}>
            <Button
              fluid
              content="Set Taste"
              icon="grin-tongue"
              onClick={() => act('setflavor')}
            />
          </Flex.Item>
          <Flex.Item basis="50%">
            <Button
              fluid
              content="Set Smell"
              icon="wind"
              onClick={() => act('setsmell')}
            />
          </Flex.Item>
          <Flex.Item basis="50%" grow={1}>
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_msgs', msgtype: 'en' })
              }
              content="Set Nutrition Examine Message"
              icon="flask"
              fluid
            />
          </Flex.Item>
          <Flex.Item basis="50%">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_msgs', msgtype: 'ew' })
              }
              content="Set Weight Examine Message"
              icon="weight-hanging"
              fluid
            />
          </Flex.Item>
          <Flex.Item basis="50%" grow={1}>
            <VoreUserPreferenceItem spec={preferences.examine_nutrition} />
          </Flex.Item>
          <Flex.Item basis="50%">
            <VoreUserPreferenceItem spec={preferences.examine_weight} />
          </Flex.Item>
          <Flex.Item basis="50%">
            <Button
              fluid
              content="Vore Sprite Color"
              onClick={() => act('set_vs_color')}
            />
          </Flex.Item>
        </Flex>
      </Section>
      <Divider />
      <Section>
        <Flex spacing={1}>
          <Flex.Item basis="50%">
            <Button
              fluid
              content="Save Prefs"
              icon="save"
              onClick={() => act('saveprefs')}
            />
          </Flex.Item>
          <Flex.Item basis="50%" grow={1}>
            <Button
              fluid
              content="Reload Prefs"
              icon="undo"
              onClick={() => act('reloadprefs')}
            />
          </Flex.Item>
        </Flex>
      </Section>
    </Box>
  );
};
