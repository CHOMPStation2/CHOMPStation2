import { useBackend } from 'tgui/backend';
import { Button, Flex, Section } from 'tgui/components';

import { localPrefs, selectedData } from '../types';
import { VoreUserPreferenceItem } from '../VoreUserPreferenceItem';

export const VoreUserPreferencesAesthetic = (props: {
  belly_rub_target: string | null;
  selected: selectedData | null;
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
                : 'Current Active (' + (selected && selected.belly_name) + ')')}
          </Button>
        </Flex.Item>
      </Flex>
    </Section>
  );
};
