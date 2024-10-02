import { BooleanLike } from 'common/react';

import { useBackend } from '../../../../backend';
import { Button, Flex, Section } from '../../../../components';
import { localPrefs } from '../types';
import { VoreUserPreferenceItem } from '../VoreUserPreferenceItem';

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
            tooltipPosition="left"
          />
          <Flex.Item basis="33%">
            <VoreUserPreferenceItem
              spec={preferences.allow_mimicry}
              tooltipPosition="right"
            />
          </Flex.Item>
        </Flex.Item>
      </Flex>
    </Section>
  );
};
