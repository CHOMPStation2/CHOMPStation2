import { sortBy } from 'common/collections';
<<<<<<< HEAD
import { useBackend } from '../backend';
import { AnimatedNumber, Box, Button, LabeledList, NoticeBox, NumberInput, Section } from '../components';
import { Window } from '../layouts';
=======
import { Fragment } from 'inferno';
import { useBackend } from "../backend";
import { AnimatedNumber, Box, Button, Flex, Icon, LabeledList, NoticeBox, NumberInput, ProgressBar, Section } from "../components";
import { Window } from "../layouts";
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale

export const TelesciConsole = (props, context) => {
  const { act, data } = useBackend(context);

<<<<<<< HEAD
  const { noTelepad } = data;
=======
  const {
    noTelepad,
  } = data;
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale

  return (
    <Window width={400} height={450} resizable>
      <Window.Content scrollable>
<<<<<<< HEAD
        {(noTelepad && <TelesciNoTelepadError />) || <TelesciConsoleContent />}
=======
        {noTelepad && <TelesciNoTelepadError /> || <TelesciConsoleContent />}
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
      </Window.Content>
    </Window>
  );
};

const TelesciNoTelepadError = (props, context) => {
  return (
    <Section title="Error" color="bad">
<<<<<<< HEAD
      No telepad located.
      <br />
=======
      No telepad located.<br />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
      Please add telepad data.
    </Section>
  );
};

export const TelesciConsoleContent = (props, context) => {
  const { act, data } = useBackend(context);

  const {
    insertedGps,
    rotation,
    currentZ,
    cooldown,
    crystalCount,
    maxCrystals,
    maxPossibleDistance,
    maxAllowedDistance,
    distance,
    tempMsg,
    sectorOptions,
    lastTeleData,
  } = data;

  return (
<<<<<<< HEAD
    <Section
      title="Telepad Controls"
      buttons={<Button icon="eject" disabled={!insertedGps} onClick={() => act('ejectGPS')} content="Eject GPS" />}>
      <NoticeBox info>
        {(cooldown && (
          <Box>
            Telepad is recharging. Please wait <AnimatedNumber value={cooldown} /> seconds.
          </Box>
        )) || <Box>{tempMsg}</Box>}
=======
    <Section title="Telepad Controls" buttons={
      <Button
        icon="eject"
        disabled={!insertedGps}
        onClick={() => act("ejectGPS")}
        content="Eject GPS" />
    }>
      <NoticeBox info>
        {cooldown && (
          <Box>
            Telepad is recharging. Please wait <AnimatedNumber value={cooldown} /> seconds.
          </Box>
        ) || (
          <Box>
            {tempMsg}
          </Box>
        )}
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
      </NoticeBox>
      <LabeledList>
        <LabeledList.Item label="Bearing">
          <NumberInput
            fluid
            value={rotation}
<<<<<<< HEAD
            format={(v) => v + '°'}
            step={1}
            minValue={-900}
            maxValue={900}
            onDrag={(e, val) => act('setrotation', { val: val })}
          />
=======
            format={v => v + "°"}
            step={1}
            minValue={-900}
            maxValue={900}
            onDrag={(e, val) => act("setrotation", { val: val })} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
        </LabeledList.Item>
        <LabeledList.Item label="Distance">
          <NumberInput
            fluid
            value={distance}
<<<<<<< HEAD
            format={(v) => v + '/' + maxAllowedDistance + ' m'}
=======
            format={v => v + "/" + maxAllowedDistance + " m"}
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
            minValue={0}
            maxValue={maxAllowedDistance}
            step={1}
            stepPixelSize={4}
<<<<<<< HEAD
            onDrag={(e, val) => act('setdistance', { val: val })}
          />
        </LabeledList.Item>
        <LabeledList.Item label="Sector">
          {sortBy((v) => Number(v))(sectorOptions).map((z) => (
=======
            onDrag={(e, val) => act("setdistance", { val: val })} />
        </LabeledList.Item>
        <LabeledList.Item label="Sector">
          {sortBy(v => Number(v))(sectorOptions).map(z => (
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
            <Button
              key={z}
              icon="check-circle"
              content={z}
              selected={currentZ === z}
<<<<<<< HEAD
              onClick={() => act('setz', { setz: z })}
            />
          ))}
        </LabeledList.Item>
        <LabeledList.Item label="Controls">
          <Button icon="share" iconRotation={-90} onClick={() => act('send')} content="Send" />
          <Button icon="share" iconRotation={90} onClick={() => act('receive')} content="Receive" />
          <Button icon="sync" iconRotation={90} onClick={() => act('recal')} content="Recalibrate" />
        </LabeledList.Item>
      </LabeledList>
      {(lastTeleData && (
=======
              onClick={() => act("setz", { setz: z })} />
          ))}
        </LabeledList.Item>
        <LabeledList.Item label="Controls">
          <Button
            icon="share"
            iconRotation={-90}
            onClick={() => act("send")}
            content="Send" />
          <Button
            icon="share"
            iconRotation={90}
            onClick={() => act("receive")}
            content="Receive" />
          <Button
            icon="sync"
            iconRotation={90}
            onClick={() => act("recal")}
            content="Recalibrate" />
        </LabeledList.Item>
      </LabeledList>
      {lastTeleData && (
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
        <Section mt={1}>
          <LabeledList>
            <LabeledList.Item label="Telepad Location">
              {lastTeleData.src_x}, {lastTeleData.src_y}
            </LabeledList.Item>
<<<<<<< HEAD
            <LabeledList.Item label="Distance">{lastTeleData.distance}m</LabeledList.Item>
            <LabeledList.Item label="Transit Time">{lastTeleData.time} secs</LabeledList.Item>
          </LabeledList>
        </Section>
      )) || <Section mt={1}>No teleport data found.</Section>}
=======
            <LabeledList.Item label="Distance">
              {lastTeleData.distance}m
            </LabeledList.Item>
            <LabeledList.Item label="Transit Time">
              {lastTeleData.time} secs
            </LabeledList.Item>
          </LabeledList>
        </Section>
      ) || (
        <Section mt={1}>
          No teleport data found.
        </Section>
      )}
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
      <Section>
        Crystals: {crystalCount} / {maxCrystals}
      </Section>
    </Section>
  );
<<<<<<< HEAD
};
=======
};
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
