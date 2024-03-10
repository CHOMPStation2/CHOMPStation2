import { BooleanLike } from 'common/react';
import { capitalize } from 'common/string';

import { useBackend } from '../../../backend';
import { Button, LabeledList, Section } from '../../../components';

type Data = {
  host_mobtype: { is_cyborg: BooleanLike; is_vore_simple_mob: BooleanLike };
};

export const VoreSelectedMobTypeBellyButtons = (props) => {
  const { act, data } = useBackend<Data>();
  const { host_mobtype } = data;
  const { is_cyborg, is_vore_simple_mob } = host_mobtype;
  const { belly } = props;
  const {
    silicon_belly_overlay_preference,
    belly_sprite_option_shown,
    belly_sprite_to_affect,
  } = belly;

  if (is_cyborg) {
    if (belly_sprite_option_shown && belly_sprite_to_affect === 'sleeper') {
      return (
        <Section title={'Cyborg Controls'} width={'80%'}>
          <LabeledList>
            <LabeledList.Item label="Toggle Belly Overlay Mode">
              <Button
                onClick={() =>
                  act('set_attribute', { attribute: 'b_silicon_belly' })
                }
                content={capitalize(silicon_belly_overlay_preference)}
              />
            </LabeledList.Item>
          </LabeledList>
        </Section>
      );
    } else {
      return (
        <Section title={'Cyborg Controls'} width={'80%'}>
          <span style={{ color: 'red' }}>
            Your module does either not support vore sprites or you&apos;ve
            selected a belly sprite other than the sleeper within the Visuals
            section.
          </span>
        </Section>
      );
    }
  } else if (is_vore_simple_mob) {
    return (
      // For now, we're only returning empty. TODO: Simple mob belly controls
      <LabeledList>
        <LabeledList.Item />
      </LabeledList>
    );
  } else {
    return (
      // Returning Empty element
      <LabeledList>
        <LabeledList.Item />
      </LabeledList>
    );
  }
};
