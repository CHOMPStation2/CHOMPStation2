import { BooleanLike } from 'common/react';

import { useBackend } from '../../../backend';
import {
  Box,
  Button,
  Dropdown,
  LabeledList,
  Section,
  Stack,
} from '../../../components';

export const VoreSoulcatcher = (props) => {
  const { act, data } = useBackend<Data>();

  type Data = {
    soulcatcher: {
      active: BooleanLike;
      caught_souls: DropdownEntry[];
      selected_soul: string;
      interior_design: string;
      catch_self: BooleanLike;
      catch_prey: BooleanLike;
      ext_hearing: BooleanLike;
      ext_vision: BooleanLike;
      mind_backups: BooleanLike;
      ar_projecting: BooleanLike;
    };
  };

  type DropdownEntry = {
    displayText: string;
    value: string;
  };

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
  } = data.soulcatcher;

  return (
    <Section
      title="Soulcatcher"
      buttons={
        <Button
          onClick={() => act('soulcatcher_toggle')}
          icon={active ? 'toggle-on' : 'toggle-off'}
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
                  onClick={() => act('soulcatcher_release')}
                  selected
                >
                  Release
                </Button>
                <Button
                  icon="right-left"
                  onClick={() => act('soulcatcher_transfer')}
                >
                  Transfer
                </Button>
                <Button.Confirm
                  icon="skull"
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
                confirmColor="green"
                confirmIcon="triangle-exclamation"
                onClick={() => act('soulcatcher_release_all')}
              >
                Release Souls
              </Button.Confirm>
              <Button.Confirm
                icon="eraser"
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
                color={catch_self ? 'green' : 'red'}
                onClick={() => act('toggle_self_catching')}
              >
                Catch User
              </Button>
              <Button
                icon="person"
                color={catch_prey ? 'green' : 'red'}
                onClick={() => act('toggle_prey_catching')}
              >
                Catch Prey
              </Button>
              <Button
                icon={ext_hearing ? 'ear-listen' : 'ear-deaf'}
                color={ext_hearing ? 'green' : 'red'}
                onClick={() => act('toggle_ext_hearing')}
              >
                Ext. Hearing
              </Button>
              <Button
                icon={ext_vision ? 'eye' : 'eye-slash'}
                color={ext_vision ? 'green' : 'red'}
                onClick={() => act('toggle_ext_vision')}
              >
                Ext. Vision
              </Button>
              <Button
                icon="database"
                color={mind_backups ? 'green' : 'red'}
                onClick={() => act('toggle_mind_backup')}
              >
                Mind Backups
              </Button>
              <Button
                icon="street-view"
                color={ar_projecting ? 'green' : 'red'}
                onClick={() => act('toggle_ar_projecting')}
              >
                AR Projecting
              </Button>
            </Box>
          </LabeledList.Item>
          <LabeledList.Item
            label="Interior Design"
            buttons={
              <Button
                icon="wand-magic-sparkles"
                onClick={() => act('soulcatcher_interior_design')}
              />
            }
          >
            {interior_design}
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
  );
};
