import { round } from 'common/math';

import { useBackend } from '../backend';
import { Button, Flex, NumberInput, Section } from '../components';
import { formatTime } from '../format';
import { Window } from '../layouts';

export const BrigTimer = (props) => {
  const { act, data } = useBackend();
  return (
    <Window width={400} height={138}>
      <Window.Content scrollable>
        <Section
          title="Cell Timer"
          buttons={
            <>
              <Button
                icon="clock-o"
                content={data.timing ? 'Stop' : 'Start'}
                selected={data.timing}
                onClick={() => act(data.timing ? 'stop' : 'start')}
              />
              {(data.flash_found && (
                <Button
                  icon="lightbulb-o"
                  content={data.flash_charging ? 'Recharging' : 'Flash'}
                  disabled={data.flash_charging}
                  onClick={() => act('flash')}
                />
              )) ||
                null}
            </>
          }
        >
          <NumberInput
            animated
            fluid
            value={data.time_left / 10}
            minValue={0}
            maxValue={data.max_time_left / 10}
            format={(val) => formatTime(round(val * 10))}
            onDrag={(e, val) => act('time', { time: val })}
          />
          <Flex mt={1}>
            <Flex.Item grow={1}>
              <Button
                fluid
                icon="hourglass-start"
                content={'Add ' + formatTime(data.preset_short / 10)}
                onClick={() => act('preset', { preset: 'short' })}
<<<<<<< HEAD
              />
=======
              >
                {'Add ' + formatTime(data.preset_short)}
              </Button>
>>>>>>> 64907dbc78... multiple UI timing issues (#15992)
            </Flex.Item>
            <Flex.Item grow={1}>
              <Button
                fluid
                icon="hourglass-start"
                content={'Add ' + formatTime(data.preset_medium / 10)}
                onClick={() => act('preset', { preset: 'medium' })}
<<<<<<< HEAD
              />
=======
              >
                {'Add ' + formatTime(data.preset_medium)}
              </Button>
>>>>>>> 64907dbc78... multiple UI timing issues (#15992)
            </Flex.Item>
            <Flex.Item grow={1}>
              <Button
                fluid
                icon="hourglass-start"
                content={'Add ' + formatTime(data.preset_long / 10)}
                onClick={() => act('preset', { preset: 'long' })}
<<<<<<< HEAD
              />
=======
              >
                {'Add ' + formatTime(data.preset_long)}
              </Button>
>>>>>>> 64907dbc78... multiple UI timing issues (#15992)
            </Flex.Item>
          </Flex>
        </Section>
      </Window.Content>
    </Window>
  );
};
