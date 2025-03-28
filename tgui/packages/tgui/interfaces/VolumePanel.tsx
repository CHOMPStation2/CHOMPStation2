import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import { Button, LabeledList, Section, Slider } from 'tgui-core/components';

type Data = {
  volume_channels: { key; val: number }[];
};

export const VolumePanel = (props) => {
  const { act, data } = useBackend<Data>();

  const { volume_channels } = data;

  return (
    <Window width={350} height={600}>
      <Window.Content>
        <Section title="Volume Levels">
          <LabeledList>
            {Object.keys(volume_channels).map((key) => (
              <LabeledList.Item label={key} key={key}>
                <Slider
                  width="88%"
                  minValue={0}
                  maxValue={200}
                  value={volume_channels[key] * 100}
                  onChange={(e, val) =>
                    act('adjust_volume', { channel: key, vol: val / 100 })
                  }
                />
                <Button
                  ml={1}
                  icon="undo"
                  onClick={() => act('adjust_volume', { channel: key, vol: 1 })}
                />
              </LabeledList.Item>
            ))}
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
