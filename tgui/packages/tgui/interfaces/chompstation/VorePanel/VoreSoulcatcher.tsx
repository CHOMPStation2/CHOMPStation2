import { toFixed } from 'common/math';
import { BooleanLike } from 'common/react';

import { useBackend } from '../../../backend';
import {
  Box,
  Button,
  Dropdown,
  Flex,
  LabeledList,
  Section,
  Slider,
  Stack,
} from '../../../components';

export const VoreSoulcatcher = (props) => {
  const { act, data } = useBackend<Data>();

  type Data = {
    soulcatcher: {
      active: BooleanLike;
      caught_souls: DropdownEntry[];
      selected_sfx: string;
      selected_soul: string;
      interior_design: string;
      catch_self: BooleanLike;
      catch_prey: BooleanLike;
      ext_hearing: BooleanLike;
      ext_vision: BooleanLike;
      mind_backups: BooleanLike;
      ar_projecting: BooleanLike;
      show_vore_sfx: BooleanLike;
    };
    abilities: {
      nutrition: number;
      current_size: number;
      minimum_size: number;
      maximum_size: number;
      resize_cost: number;
    };
    our_bellies: Partial<belly> & {
      map(arg0: (belly: belly) => DropdownEntry): DropdownEntry[];
    };
  };

  type belly = {
    selected: BooleanLike;
    name: string;
    ref: string;
    digest_mode: string;
    contents: number;
  };

  type DropdownEntry = {
    displayText: string;
    value: string;
  };
  const { our_bellies } = data;

  const getBellies = our_bellies.map((belly) => {
    return { ...belly, displayText: belly.name, value: belly.ref };
  });

  const {
    active,
    caught_souls,
    selected_soul,
    interior_design,
    catch_self,
    catch_prey,
    ext_hearing,
    ext_vision,
    mind_backups,
    ar_projecting,
    selected_sfx,
    show_vore_sfx,
  } = data.soulcatcher;

  const { nutrition, current_size, minimum_size, maximum_size, resize_cost } =
    data.abilities;

  function is_enabled(nutri: number, cost: number): boolean {
    return nutri >= cost;
  }

  return (
    <>
      <Section
        title="Soulcatcher"
        buttons={
          <Button
            onClick={() => act('soulcatcher_toggle')}
            icon={active ? 'toggle-on' : 'toggle-off'}
            tooltip={
              (active ? 'Disables' : 'Enables') +
              ' the ability to capture souls upon vore death.'
            }
            selected={active}
          >
            {active ? 'Soulcatcher On' : 'Soulcatcher Off'}
          </Button>
        }
      >
        {active ? (
          <LabeledList>
            <LabeledList.Item label="Captured Souls">
              <Stack inline align="center">
                <Stack.Item>
                  <Dropdown
                    width="200px"
                    selected={selected_soul}
                    options={caught_souls}
                    onSelected={(value) =>
                      act('soulcatcher_select', {
                        selected_soul: value,
                      })
                    }
                  />
                </Stack.Item>
                <Stack.Item>
                  <Box>{caught_souls.length}</Box>
                </Stack.Item>
              </Stack>
            </LabeledList.Item>
            {!!selected_soul && (
              <LabeledList.Item label="Soul Options">
                <Box>
                  <Button
                    icon="key"
                    tooltip="Release the currently selected soul as ghosts."
                    onClick={() => act('soulcatcher_release')}
                    selected
                  >
                    Release
                  </Button>
                  <Button
                    icon="right-left"
                    tooltip="Tansfer the currently selected soul into a held or nearby Sleevemate or MMI."
                    onClick={() => act('soulcatcher_transfer')}
                  >
                    Transfer
                  </Button>
                  <Button.Confirm
                    icon="skull"
                    tooltip="Delete the currently selected soul if preferences align or release it."
                    color="red"
                    confirmIcon="triangle-exclamation"
                    onClick={() => act('soulcatcher_delete')}
                  >
                    Delete
                  </Button.Confirm>
                </Box>
              </LabeledList.Item>
            )}
            <LabeledList.Item label="Global Options">
              <Box>
                <Button.Confirm
                  icon="tornado"
                  tooltip="Release all captured souls as ghosts."
                  confirmColor="green"
                  confirmIcon="triangle-exclamation"
                  onClick={() => act('soulcatcher_release_all')}
                >
                  Release Souls
                </Button.Confirm>
                <Button.Confirm
                  icon="eraser"
                  tooltip="Delete all captured souls if preferences align or release them."
                  color="red"
                  confirmIcon="triangle-exclamation"
                  onClick={() => act('soulcatcher_erase_all')}
                >
                  Erase Souls
                </Button.Confirm>
              </Box>
            </LabeledList.Item>
            <LabeledList.Item label="Global Settings">
              <Box>
                <Button
                  icon="circle-user"
                  tooltip={
                    (catch_self ? 'Allow' : 'Disallow') +
                    ' your own soulcatcher to capture your own soul upon vore death.'
                  }
                  color={catch_self ? 'green' : 'red'}
                  onClick={() => act('toggle_self_catching')}
                >
                  Catch User
                </Button>
                <Button
                  icon="person"
                  tooltip={
                    (catch_prey ? 'Allow' : 'Disallow') +
                    ' your own soulcatcher to capture prey souls upon vore death.'
                  }
                  color={catch_prey ? 'green' : 'red'}
                  onClick={() => act('toggle_prey_catching')}
                >
                  Catch Prey
                </Button>
                <Button
                  icon={ext_hearing ? 'ear-listen' : 'ear-deaf'}
                  tooltip={
                    (ext_hearing ? 'Allow' : 'Disallow') +
                    ' your captured souls to hear.'
                  }
                  color={ext_hearing ? 'green' : 'red'}
                  onClick={() => act('toggle_ext_hearing')}
                >
                  Ext. Hearing
                </Button>
                <Button
                  icon={ext_vision ? 'eye' : 'eye-slash'}
                  tooltip={
                    (ext_vision ? 'Allow' : 'Disallow') +
                    ' your captured souls to see.'
                  }
                  color={ext_vision ? 'green' : 'red'}
                  onClick={() => act('toggle_ext_vision')}
                >
                  Ext. Vision
                </Button>
                <Button
                  icon="database"
                  tooltip={
                    (mind_backups ? 'Allow' : 'Disallow') +
                    ' your captured souls to have regular mind backups.'
                  }
                  color={mind_backups ? 'green' : 'red'}
                  onClick={() => act('toggle_mind_backup')}
                >
                  Mind Backups
                </Button>
                <Button
                  icon="street-view"
                  tooltip={
                    (mind_backups ? 'Allow' : 'Disallow') +
                    ' your captured souls to AR project themselves.'
                  }
                  color={mind_backups ? 'green' : 'red'}
                  onClick={() => act('toggle_ar_projecting')}
                >
                  AR Projecting
                </Button>
                <Button
                  icon={show_vore_sfx ? 'circle-play' : 'circle-pause'}
                  tooltip={
                    (show_vore_sfx ? 'Show' : 'Hide') +
                    ' the selected vore SFX to your captured souls.'
                  }
                  color={show_vore_sfx ? 'green' : 'red'}
                  onClick={() => act('toggle_vore_sfx')}
                >
                  Show Vore SFX
                </Button>
              </Box>
            </LabeledList.Item>
            <LabeledList.Item
              label="Interior Design"
              buttons={
                <Button
                  icon="wand-magic-sparkles"
                  tooltip="Customize your soulcatcher flavour text."
                  onClick={() => act('soulcatcher_interior_design')}
                />
              }
            >
              {interior_design}
            </LabeledList.Item>
            <LabeledList.Item label="Interior SFX">
              <Dropdown
                width="200px"
                selected={selected_sfx}
                options={getBellies}
                onSelected={(value) =>
                  act('soulcatcher_sfx', {
                    selected_belly: value,
                  })
                }
              />
            </LabeledList.Item>
            <LabeledList.Item label="Custom Messages">
              <Box>
                <Button onClick={() => act('soulcatcher_capture_message')}>
                  Capture Message
                </Button>
                <Button onClick={() => act('soulcatcher_transit_message')}>
                  Transit Message
                </Button>
                <Button onClick={() => act('soulcatcher_release_message')}>
                  Release Message
                </Button>
                <Button onClick={() => act('soulcatcher_delete_message')}>
                  Delete Message
                </Button>
              </Box>
            </LabeledList.Item>
          </LabeledList>
        ) : (
          'Soulcatching disabled.'
        )}
      </Section>
      <Section
        title="Abilities"
        buttons={'Nutrition: ' + toFixed(nutrition, 1)}
      >
        <LabeledList>
          <LabeledList.Item label="Resize">
            <Flex align="baseline">
              <Flex.Item>
                <Slider
                  disabled={!is_enabled(nutrition, resize_cost)}
                  width="250px"
                  ranges={
                    (is_enabled(nutrition, resize_cost) && {
                      bad: [1, 25],
                      average: [25, 50],
                      green: [50, 150],
                      yellow: [150, 200],
                      red: [200, 600],
                    }) ||
                    (!is_enabled(nutrition, resize_cost) && { black: [0, 600] })
                  }
                  format={(value) => toFixed(value, 2) + '%'}
                  value={current_size * 100}
                  minValue={minimum_size * 100}
                  maxValue={maximum_size * 100}
                  onChange={(e, value) =>
                    act('adjust_own_size', {
                      new_mob_size: value / 100,
                    })
                  }
                />
              </Flex.Item>
              <Flex.Item color="label">&nbsp;&nbsp;Cost:&nbsp;</Flex.Item>
              <Flex.Item>{resize_cost}</Flex.Item>
            </Flex>
          </LabeledList.Item>
        </LabeledList>
      </Section>
    </>
  );
};
