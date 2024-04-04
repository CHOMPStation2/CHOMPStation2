import { useBackend } from '../../../backend';
import { Button, Flex, LabeledList } from '../../../components';

export const VoreSelectedBellySounds = (props) => {
  const { act } = useBackend();

  const { belly } = props;
  const {
    is_wet,
    wet_loop,
    fancy,
    sound,
    release_sound,
    sound_volume,
    noise_freq,
  } = belly;

  return (
    <Flex wrap="wrap">
      <Flex.Item basis="49%" grow={1}>
        <LabeledList>
          <LabeledList.Item label="Fleshy Belly">
            <Button
              onClick={() => act('set_attribute', { attribute: 'b_wetness' })}
              icon={is_wet ? 'toggle-on' : 'toggle-off'}
              selected={is_wet}
              content={is_wet ? 'Yes' : 'No'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Internal Loop">
            <Button
              onClick={() => act('set_attribute', { attribute: 'b_wetloop' })}
              icon={wet_loop ? 'toggle-on' : 'toggle-off'}
              selected={wet_loop}
              content={wet_loop ? 'Yes' : 'No'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Use Fancy Sounds">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_fancy_sound' })
              }
              icon={fancy ? 'toggle-on' : 'toggle-off'}
              selected={fancy}
              content={fancy ? 'Yes' : 'No'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Vore Sound">
            <Button
              onClick={() => act('set_attribute', { attribute: 'b_sound' })}
              content={sound}
            />
            <Button
              onClick={() => act('set_attribute', { attribute: 'b_soundtest' })}
              icon="volume-up"
            />
          </LabeledList.Item>
          <LabeledList.Item label="Release Sound">
            <Button
              onClick={() => act('set_attribute', { attribute: 'b_release' })}
              content={release_sound}
            />
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_releasesoundtest' })
              }
              icon="volume-up"
            />
          </LabeledList.Item>
          <LabeledList.Item label="Sound Volume">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_sound_volume' })
              }
              content={sound_volume + '%'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Noise Frequency">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_noise_freq' })
              }
              content={noise_freq}
            />
          </LabeledList.Item>
        </LabeledList>
      </Flex.Item>
    </Flex>
  );
};
