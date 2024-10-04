import { BooleanLike } from 'common/react';
import { capitalize } from 'common/string';
import { useBackend } from 'tgui/backend';
import { Box, Button, Flex, Section } from 'tgui/components';

import { localPrefs } from '../types';
import { VoreUserPreferenceItem } from '../VoreUserPreferenceItem';

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
