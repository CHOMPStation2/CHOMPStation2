<<<<<<< HEAD
import { useBackend } from '../backend';
import { Box, Button, LabeledList, Section } from '../components';
import { Window } from '../layouts';
=======
import { round } from 'common/math';
import { Fragment } from 'inferno';
import { useBackend } from "../backend";
import { AnimatedNumber, Box, Button, Divider, Flex, Icon, LabeledList, ProgressBar, Section } from "../components";
import { Window } from "../layouts";
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale

export const pAISecrecords = (props, context) => {
  const { act, data } = useBackend(context);

<<<<<<< HEAD
  const { records, general, security, could_not_find } = data;
=======
  const {
    records,
    general,
    security,
    could_not_find,
  } = data;
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale

  return (
    <Window width={450} height={600} resizable>
      <Window.Content scrollable>
        <Section>
<<<<<<< HEAD
          {records.map((record) => (
            <Button key={record.ref} content={record.name} onClick={() => act('select', { select: record.ref })} />
=======
          {records.map(record => (
            <Button
              key={record.ref}
              content={record.name}
              onClick={() => act("select", { select: record.ref })} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
          ))}
        </Section>
        {(general || security) && (
          <Section title="Selected Record">
            {!!could_not_find && (
<<<<<<< HEAD
              <Box color="bad">Warning: Failed to find some records. The information below may not be complete.</Box>
            )}
            <LabeledList>
              <LabeledList.Item label="Name">{general.name}</LabeledList.Item>
              <LabeledList.Item label="Record ID">{general.id}</LabeledList.Item>
              <LabeledList.Item label="Entity Classification">{general.brain_type}</LabeledList.Item>
              <LabeledList.Item label="Sex">{general.sex}</LabeledList.Item>
              <LabeledList.Item label="Species">{general.species}</LabeledList.Item>
              <LabeledList.Item label="Age">{general.age}</LabeledList.Item>
              <LabeledList.Item label="Rank">{general.rank}</LabeledList.Item>
              <LabeledList.Item label="Fingerprint">{general.fingerprint}</LabeledList.Item>
              <LabeledList.Item label="Physical Status">{general.p_stat}</LabeledList.Item>
              <LabeledList.Item label="Mental Status">{general.m_stat}</LabeledList.Item>
=======
              <Box color="bad">
                Warning: Failed to find some records. The information below may not be complete.
              </Box>
            )}
            <LabeledList>
              <LabeledList.Item label="Name">
                {general.name}
              </LabeledList.Item>
              <LabeledList.Item label="Record ID">
                {general.id}
              </LabeledList.Item>
              <LabeledList.Item label="Entity Classification">
                {general.brain_type}
              </LabeledList.Item>
              <LabeledList.Item label="Sex">
                {general.sex}
              </LabeledList.Item>
              <LabeledList.Item label="Species">
                {general.species}
              </LabeledList.Item>
              <LabeledList.Item label="Age">
                {general.age}
              </LabeledList.Item>
              <LabeledList.Item label="Rank">
                {general.rank}
              </LabeledList.Item>
              <LabeledList.Item label="Fingerprint">
                {general.fingerprint}
              </LabeledList.Item>
              <LabeledList.Item label="Physical Status">
                {general.p_stat}
              </LabeledList.Item>
              <LabeledList.Item label="Mental Status">
                {general.m_stat}
              </LabeledList.Item>
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
              <LabeledList.Divider />
              <LabeledList.Item label="Criminal Status">
                <Box>{security.criminal}</Box>
              </LabeledList.Item>
              <LabeledList.Item label="Minor Crimes">
                <Box>{security.mi_crim}</Box>
                <Box>{security.mi_crim_d}</Box>
              </LabeledList.Item>
              <LabeledList.Item label="Major Crimes">
                <Box>{security.ma_crim}</Box>
                <Box>{security.ma_crim_d}</Box>
              </LabeledList.Item>
<<<<<<< HEAD
              <LabeledList.Item label="Important Notes">{security.notes}</LabeledList.Item>
=======
              <LabeledList.Item label="Important Notes">
                {security.notes}
              </LabeledList.Item>
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
            </LabeledList>
          </Section>
        )}
      </Window.Content>
    </Window>
  );
<<<<<<< HEAD
};
=======
};
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
