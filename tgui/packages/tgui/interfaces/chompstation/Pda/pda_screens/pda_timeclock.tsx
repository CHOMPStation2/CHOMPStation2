import { useBackend } from 'tgui/backend';
import { RankIcon } from 'tgui/interfaces/common/RankIcon';
import {
  Box,
  Button,
  LabeledList,
  NoticeBox,
  Section,
  Stack,
} from 'tgui-core/components';
import { formatTime } from 'tgui-core/format';
import { toFixed } from 'tgui-core/math';
import type { BooleanLike } from 'tgui-core/react';

type Data = {
  card: string | null;
  department_hours: Record<string, number> | undefined;
  user_name: string;
  assignment: string | null;
  card_cooldown: number;
  area_clockout: boolean | false;
  is_human: boolean | false;
  job_datum: {
    title: string;
    departments: string;
    selection_color: string;
    economic_modifier: number;
    timeoff_factor: number;
    pto_department: string;
  } | null;
  allow_change_job: BooleanLike;
  job_choices: Record<string, string[]> | null;
};

export const pda_timeclock = (props) => {
  const { act, data } = useBackend<Data>();

  const {
    department_hours,
    user_name,
    is_human,
    area_clockout,
    card,
    card_cooldown,
    assignment,
    job_datum,
    allow_change_job,
    job_choices,
  } = data;

  return (
    <Box>
      <Section title="PDA Timeclock">
        <NoticeBox>
          OOC Note: PTO acquired is account-wide and shared across all
          characters. Info listed below is not IC information.
        </NoticeBox>
        <Section title={'Time Off Balance for ' + user_name}>
          <LabeledList>
            {!!department_hours &&
              Object.keys(department_hours).map((key) => (
                <LabeledList.Item
                  key={key}
                  label={key}
                  color={
                    department_hours[key] > 6
                      ? 'good'
                      : department_hours[key] > 1
                        ? 'average'
                        : 'bad'
                  }
                >
                  {toFixed(department_hours[key], 1)}{' '}
                  {department_hours[key] === 1 ? 'hour' : 'hours'}
                </LabeledList.Item>
              ))}
          </LabeledList>
        </Section>
      </Section>
      <Section title="Employee Info">
        <LabeledList>
          <LabeledList.Item label="Employee ID">
            {card || 'Insert ID'}
          </LabeledList.Item>
          {!!job_datum && (
            <>
              <LabeledList.Item label="Rank">
                <Stack backgroundColor={job_datum.selection_color} p={0.8}>
                  <Stack.Item ml={1}>
                    <RankIcon color="white" rank={job_datum.title} />
                  </Stack.Item>
                  <Stack.Item fontSize={1.5} grow textAlign="right" mr={1}>
                    {job_datum.title}
                  </Stack.Item>
                </Stack>
              </LabeledList.Item>
              <LabeledList.Item label="Departments">
                {job_datum.departments}
              </LabeledList.Item>
              <LabeledList.Item label="Pay Scale">
                {job_datum.economic_modifier}
              </LabeledList.Item>
              <LabeledList.Item label="PTO Elegibility">
                {(job_datum.timeoff_factor > 0 && (
                  <Box>Earns PTO - {job_datum.pto_department}</Box>
                )) ||
                  (job_datum.timeoff_factor < 0 && (
                    <Box>Requires PTO - {job_datum.pto_department}</Box>
                  )) || <Box>Neutral</Box>}
              </LabeledList.Item>
            </>
          )}
        </LabeledList>
      </Section>
      {!!(
        allow_change_job &&
        job_datum &&
        job_datum.timeoff_factor !== 0 &&
        assignment !== 'Dismissed' &&
        is_human
      ) && (
        <Section title="Employment Actions">
          {(job_datum.timeoff_factor > 0 &&
            ((!!department_hours &&
              department_hours[job_datum.pto_department] > 0 && (
                <Button
                  fluid
                  disabled={card_cooldown > 0 || !area_clockout}
                  tooltip={
                    card_cooldown > 0
                      ? "You've recently modified your card, please wait " +
                        formatTime(card_cooldown, 'short')
                      : area_clockout
                        ? 'Clock out!'
                        : 'You cannot clock out in this area'
                  }
                  icon="exclamation-triangle"
                  onClick={() => act('switch-to-offduty')}
                >
                  Go Off-Duty
                </Button>
              )) || (
              <Box color="bad">
                Warning: You do not have enough accrued time off to go off-duty.
              </Box>
            ))) ||
            (!!job_choices &&
              Object.keys(job_choices).length &&
              Object.keys(job_choices).map((job) => {
                const alt_titles = job_choices[job];

                return alt_titles.map((title) => (
                  <Button
                    key={title}
                    disabled={card_cooldown > 0}
                    tooltip={
                      card_cooldown > 0
                        ? "You've recently modified your card, please wait " +
                          formatTime(card_cooldown, 'short')
                        : 'Clock in!'
                    }
                    icon="suitcase"
                    onClick={() =>
                      act('switch-to-onduty-rank', {
                        'switch-to-onduty-rank': job,
                        'switch-to-onduty-assignment': title,
                      })
                    }
                  >
                    {title}
                  </Button>
                ));
              })) || (
              <Box color="bad">No Open Positions - See Head Of Personnel</Box>
            )}
        </Section>
      )}
    </Box>
  );
};
