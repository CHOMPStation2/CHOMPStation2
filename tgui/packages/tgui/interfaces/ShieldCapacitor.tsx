import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  AnimatedNumber,
  Box,
  Button,
  LabeledList,
  NumberInput,
  Section,
} from 'tgui-core/components';
import { formatPower, formatSiUnit } from 'tgui-core/format';
import { round, toFixed } from 'tgui-core/math';
import type { BooleanLike } from 'tgui-core/react';

type Data = {
  active: BooleanLike;
  time_since_fail: number;
  stored_charge: number;
  max_charge: number;
  charge_rate: number;
  max_charge_rate: number;
};

export const ShieldCapacitor = (props) => {
  const { act, data } = useBackend<Data>();

  const {
    active,
    time_since_fail,
    stored_charge,
    max_charge,
    charge_rate,
    max_charge_rate,
  } = data;

  return (
    <Window width={500} height={400}>
      <Window.Content>
        <Section
          title="Status"
          buttons={
            <Button
              icon="power-off"
              selected={active}
              onClick={() => act('toggle')}
            >
              {active ? 'Online' : 'Offline'}
            </Button>
          }
        >
          <LabeledList>
            <LabeledList.Item label="Capacitor Status">
              {time_since_fail > 2 ? (
                <Box color="good">OK.</Box>
              ) : (
                <Box color="bad">Discharging!</Box>
              )}
            </LabeledList.Item>
            <LabeledList.Item label="Stored Energy">
              <AnimatedNumber
                value={stored_charge}
                format={(val) => formatSiUnit(val, 0, 'J')}
              />
              <AnimatedNumber
                value={100 * round(stored_charge / max_charge, 1)}
                format={(value) => ` (${toFixed(value, 1)}%)`}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Charge Rate">
              <NumberInput
                tickWhileDragging
                value={charge_rate}
                step={100}
                stepPixelSize={0.2}
                minValue={10000}
                maxValue={max_charge_rate}
                format={(val: number) => formatPower(val)}
                onChange={(val: number) => act('charge_rate', { rate: val })}
              />
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
