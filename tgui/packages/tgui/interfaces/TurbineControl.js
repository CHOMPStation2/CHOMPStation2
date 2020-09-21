<<<<<<< HEAD
import { formatPower } from '../format';
import { useBackend } from '../backend';
import { AnimatedNumber, Box, Button, LabeledList, Section } from '../components';
import { Window } from '../layouts';
=======
import { round } from 'common/math';
import { Fragment } from 'inferno';
import { formatPower } from "../format";
import { useBackend } from "../backend";
import { AnimatedNumber, Box, Button, Flex, Icon, LabeledList, ProgressBar, Section, Table } from "../components";
import { Window } from "../layouts";
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale

export const TurbineControl = (props, context) => {
  const { act, data } = useBackend(context);

<<<<<<< HEAD
  const { connected, compressor_broke, turbine_broke, broken, door_status, online, power, rpm, temp } = data;
=======
  const {
    connected,
    compressor_broke,
    turbine_broke,
    broken,
    door_status,
    online,
    power,
    rpm,
    temp,
  } = data;
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale

  return (
    <Window width={520} height={440} resizable>
      <Window.Content scrollable>
        <Section title="Turbine Controller">
          <LabeledList>
            <LabeledList.Item label="Status">
<<<<<<< HEAD
              {(broken && (
                <Box color="bad">
                  Setup is broken
                  <Button icon="sync" onClick={() => act('reconnect')} content="Reconnect" />
                </Box>
              )) || (
                <Box color={online ? 'good' : 'bad'}>
                  {online && !compressor_broke && !turbine_broke ? 'Online' : 'Offline'}
=======
              {broken && (
                <Box color="bad">
                  Setup is broken
                  <Button
                    icon="sync"
                    onClick={() => act("reconnect")}
                    content="Reconnect" />
                </Box>
              ) || (
                <Box color={online ? "good" : "bad"}>
                  {(online && !compressor_broke && !turbine_broke) ? "Online" : "Offline"}
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
                </Box>
              )}
            </LabeledList.Item>
            <LabeledList.Item label="Compressor">
<<<<<<< HEAD
              {(compressor_broke && <Box color="bad">Compressor is inoperable.</Box>) ||
                (turbine_broke && <Box color="bad">Turbine is inoperable.</Box>) || (
                  <Box>
                    <Button.Checkbox
                      checked={online}
                      content="Compressor Power"
                      onClick={() => act(online ? 'power-off' : 'power-on')}
                    />
                  </Box>
                )}
=======
              {compressor_broke && (
                <Box color="bad">Compressor is inoperable.</Box>
              ) || turbine_broke && (
                <Box color="bad">Turbine is inoperable.</Box>
              ) ||(
                <Box>
                  <Button.Checkbox
                    checked={online}
                    content="Compressor Power"
                    onClick={() => act(online ? "power-off" : "power-on")} />
                </Box>
              )}
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
            </LabeledList.Item>
            <LabeledList.Item label="Vent Doors">
              <Button.Checkbox
                checked={door_status}
<<<<<<< HEAD
                onClick={() => act('doors')}
                content={door_status ? 'Closed' : 'Open'}
              />
=======
                onClick={() => act("doors")}
                content={door_status ? "Closed" : "Open"} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section title="Status">
          <LabeledList>
            <LabeledList.Item label="Turbine Speed">
<<<<<<< HEAD
              {broken ? '--' : <AnimatedNumber value={rpm} />} RPM
            </LabeledList.Item>
            <LabeledList.Item label="Internal Temperature">
              {broken ? '--' : <AnimatedNumber value={temp} />} K
            </LabeledList.Item>
            <LabeledList.Item label="Generated Power">
              {broken ? '--' : <AnimatedNumber format={(v) => formatPower(v)} value={Number(power)} />}
=======
              {broken ? "--" : <AnimatedNumber value={rpm} />} RPM
            </LabeledList.Item>
            <LabeledList.Item label="Internal Temperature">
              {broken ? "--" : <AnimatedNumber value={temp} />} K
            </LabeledList.Item>
            <LabeledList.Item label="Generated Power">
              {broken ? "--" : <AnimatedNumber format={v => formatPower(v)} value={Number(power)} />}
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
<<<<<<< HEAD
};
=======
};
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
