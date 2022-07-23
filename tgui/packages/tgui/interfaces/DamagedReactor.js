import { useBackend } from "../backend";
import { Box, Button, LabeledList, ProgressBar, Section, AnimatedNumber, Input } from "../components";
import { Window } from "../layouts";

/* data["health"] = health
	data["wave"] = current_wave
	data["warmup_enabled"] = warmup
	data["currentTab"] = current_tab
	data["warmup_time_left"] = (warmup_complete - world.time) / 10 // We want to take the TOTAL time and subtract the
    // CURRENT time, then divide it, to get our fancy UI percentage/time.
	data["wave_time_left"] = (wave_complete - world.time) / 10 // Same as above method, but for wave time.
*/

export const DamagedReactor = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    health,
    maxhealth,
    wave,
    warmup_enabled,
    currentTab,
    warmup_time_left,
    wave_time_left,
  } = data;
  let body = <DamagedReactorTab1 />;
  if (currentTab === 1) { body = <DamagedReactorTab1 />; }
  if (currentTab === 2 && warmup_enabled === 1) { body = <DamagedReactorTab2 />; }
  if (currentTab === 3) { body = <DamagedReactorTab3 />; }
  if (currentTab === 4) { body = <DamagedReactorTab4 />; }
  if (currentTab === 5) { body = <DamagedReactorTab5 />; }
  return (
    <Window width={600} height={600} resizable theme="terminal">
      <Window.Content>
        <Section>
          <Box textAlign="center">
            Reactor Status
          </Box>
          <Box textAlign="center">
            <ProgressBar
              animated
              ranges={{
                'good': [1500, Infinity],
                'average': [500, 1500],
                'bad': [-Infinity, 500],
              }}
              value={health} minValue={0} maxValue={maxhealth} />
          </Box>
        </Section>
        {body}
      </Window.Content>
    </Window>
  );
};

const DamagedReactorTab1 = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    health,
    maxhealth,
    wave,
    warmup_enabled,
    currentTab,
    warmup_time_left,
    wave_time_left,
    verification_required = false,
  } = data;
  return (
    <Section>
      <LabeledList>
        <LabeledList.Item label="STARTUP MESSAGE TBD">
          <Button
            icon="power-off"
            content="Start Reactor"
            selected={warmup_enabled}
            onClick={() => act("Engage Reactor")}
          />
        </LabeledList.Item>
        <LabeledList.Item label="REACTOR LOCKDOWN">
          REQUIRES {verification_required
            ? "PASSCODE AND" : ""} VERIFICATION SEQUENCE TO UNLOCK
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};

const DamagedReactorTab2 = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    health,
    maxhealth,
    wave,
    warmup_enabled,
    currentTab,
    warmup_time_left,
    wave_time_left,
    power_generation = 0,
    max_power_generation = 10,
  } = data;

  return (
    <Section
      title="Reactor warming up">
      <LabeledList>
        <LabeledList.Item label="WARMUP TIME REMAINING">
          <AnimatedNumber value={warmup_time_left} /> s
        </LabeledList.Item>
        <LabeledList.Item label="POWER GENERATION">
          <ProgressBar
            value={power_generation}
            minValue={0}
            maxValue={max_power_generation}
            color={power_generation < max_power_generation - 5
              ? 'good' : 'average'}>
            {power_generation + " W"}
          </ProgressBar>
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};

const DamagedReactorTab3 = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    health,
    maxhealth,
    wave,
    warmup_enabled,
    warmup_time_left,
    wave_time_left,
    power_generation = 0,
    max_power_generation = 10,
  } = data;

  return (
    <Section
      title="Reactor engaged">
      <LabeledList>
        <LabeledList.Item label="REACTOR EXPECTED RUNTIME LEFT">
          <AnimatedNumber value={wave_time_left} /> s
        </LabeledList.Item>
        <LabeledList.Item label="POWER GENERATION">
          <ProgressBar
            value={power_generation}
            minValue={0}
            maxValue={max_power_generation}
            color={power_generation < max_power_generation - 5
              ? 'good' : 'average'}>
            {power_generation + " W"}
          </ProgressBar>
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};

const DamagedReactorTab4 = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    health,
    maxhealth,
    wave,
    warmup_enabled,
    warmup_time_left,
    wave_time_left,
    verification_code = "WOLF BRAVO",
    target_verification = "",
    power_generation = 0,
    max_power_generation = 10,
  } = data;

  return (
    <Section
      title="Reactor Verification Required">
      <LabeledList>
        <LabeledList.Item label="VERIFICATION CODE">
          <span class="unselectable">{verification_code}</span>
        </LabeledList.Item>
        <LabeledList.Item label="VERIFICATION ENTRY">
          <Input
            value={target_verification}
            fluid
            onInput={(e, val) => act("submit_verification", { string: val })} />
        </LabeledList.Item>
        <LabeledList.Item label="POWER GENERATION">
          <ProgressBar
            value={power_generation}
            minValue={0}
            maxValue={max_power_generation}
            color={power_generation < max_power_generation - 5
              ? 'good' : 'average'}>
            {power_generation + " W"}
          </ProgressBar>
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};

const DamagedReactorTab5 = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    health,
    maxhealth,
    wave,
    warmup_enabled,
    warmup_time_left,
    wave_time_left,
    power_generation = 0,
    max_power_generation = 10,
  } = data;

  return (
    <Section
      title="Reactor Stable">
      <LabeledList>
        <LabeledList.Item label="POWER GENERATION">
          <ProgressBar
            value={power_generation}
            minValue={0}
            maxValue={max_power_generation}
            color={power_generation < max_power_generation - 5
              ? 'good' : 'average'}>
            {power_generation + " W"}
          </ProgressBar>
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};
