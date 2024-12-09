import { BooleanLike } from 'common/react';
import { Box, Flex, Section } from 'tgui/components';

import { localPrefs } from '../types';
import { VoreUserPreferenceItem } from '../VoreUserPreferenceItem';

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
