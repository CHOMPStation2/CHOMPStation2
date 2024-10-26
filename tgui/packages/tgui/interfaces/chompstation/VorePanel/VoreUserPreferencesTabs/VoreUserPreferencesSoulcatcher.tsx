import { BooleanLike } from 'common/react';
import { Box, Flex, Section } from 'tgui/components';

import { localPrefs } from '../types';
import { VoreUserPreferenceItem } from '../VoreUserPreferenceItem';

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
              spec={preferences.soulcatcher_takeover}
              tooltipPosition="top"
            />
          </Flex.Item>
          <Flex.Item basis="33%">
            <VoreUserPreferenceItem
              spec={preferences.soulcatcher_delete}
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
