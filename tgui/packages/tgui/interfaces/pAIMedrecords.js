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

export const pAIMedrecords = (props, context) => {
  const { act, data } = useBackend(context);

<<<<<<< HEAD
  const { records, general, medical, could_not_find } = data;
=======
  const {
    records,
    general,
    medical,
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
        {(general || medical) && (
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
              <LabeledList.Divider />
              <LabeledList.Item label="Blood Type">{medical.b_type}</LabeledList.Item>
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
              <LabeledList.Divider />
              <LabeledList.Item label="Blood Type">
                {medical.b_type}
              </LabeledList.Item>
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
              <LabeledList.Item label="Minor Disabilities">
                <Box>{medical.mi_dis}</Box>
                <Box>{medical.mi_dis_d}</Box>
              </LabeledList.Item>
              <LabeledList.Item label="Major Disabilities">
                <Box>{medical.ma_dis}</Box>
                <Box>{medical.ma_dis_d}</Box>
              </LabeledList.Item>
              <LabeledList.Item label="Allergies">
                <Box>{medical.alg}</Box>
                <Box>{medical.alg_d}</Box>
              </LabeledList.Item>
              <LabeledList.Item label="Current Diseases">
                <Box>{medical.cdi}</Box>
                <Box>{medical.cdi_d}</Box>
              </LabeledList.Item>
<<<<<<< HEAD
              <LabeledList.Item label="Important Notes">{medical.notes}</LabeledList.Item>
=======
              <LabeledList.Item label="Important Notes">
                {medical.notes}
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
