/* eslint react/no-danger: "off" */
import { KEY_ENTER } from '../../common/keycodes';
import { useBackend, useLocalState } from '../backend';
import { Box, Button, Divider, Flex, Input, LabeledList, Section } from '../components';
import { Window } from '../layouts';

const Level = {
  0: 'Adminhelp',
  1: 'Mentorhelp',
  2: 'GM Request',
};

const LevelColor = {
  0: 'red',
  1: 'green',
  2: 'pink',
};

const Tag = {
  'example': 'Example',
};

const State = {
  'open': 'Open',
  'resolved': 'Resolved',
  'closed': 'Closed',
  'unknown': 'Unknown',
};

type Data = {
  id: number;
  title: string;
  name: string;
  ticket_ref: string;
  state: string;
  level: number;
  handler: string;
  opened_at: number;
  closed_at: number;
  opened_at_date: string;
  closed_at_date: string;
  actions: string;
  log: string[];
};

export const Ticket = (props, context) => {
  const { act, data } = useBackend<Data>(context);
  const [ticketChat, setTicketChat] = useLocalState(context, 'ticketChat', '');
  const {
    id,
    title,
    name,
    ticket_ref,
    state,
    level,
    handler,
    opened_at,
    closed_at,
    opened_at_date,
    closed_at_date,
    actions,
    log,
  } = data;
  return (
    <Window width={900} height={600}>
      <Window.Content scrollable>
        <Section
          title={'Ticket #' + id}
          buttons={
            <Box nowrap>
              <Button
                icon="pen"
                content="Rename Ticket"
                onClick={() => act('retitle')}
              />{' '}
              <Button content="Legacy UI" onClick={() => act('legacy')} />{' '}
              <Button content={Level[level]} color={LevelColor[level]} />
            </Box>
          }>
          <LabeledList>
            <LabeledList.Item label="Ticket ID">
              #{id}: <div dangerouslySetInnerHTML={{ __html: name }} />
            </LabeledList.Item>
            <LabeledList.Item label="Type">{Level[level]}</LabeledList.Item>
            <LabeledList.Item label="State">{State[state]}</LabeledList.Item>
            <LabeledList.Item label="Assignee">{handler}</LabeledList.Item>
            {State[state] === State.open ? (
              <LabeledList.Item label="Opened At">
                {opened_at_date} ({Math.round((opened_at / 600) * 10) / 10}{' '}
                minutes ago.)
              </LabeledList.Item>
            ) : (
              <LabeledList.Item label="Closed At">
                {closed_at_date} ({Math.round((closed_at / 600) * 10) / 10}{' '}
                minutes ago.){' '}
                <Button content="Reopen" onClick={() => act('reopen')} />
              </LabeledList.Item>
            )}
            <LabeledList.Item label="Actions">
              <div dangerouslySetInnerHTML={{ __html: actions }} />
            </LabeledList.Item>
            <LabeledList.Item label="Log" />
          </LabeledList>
          <Divider />
          <Flex direction="column">
            <Flex.Item>
              <Flex>
                <Flex.Item grow>
                  <Input
                    autoFocus
                    autoSelect
                    fluid
                    placeholder="Enter a message..."
                    value={ticketChat}
                    onInput={(e, value) => setTicketChat(value)}
                    onKeyDown={(event) => {
                      const keyCode = window.event
                        ? event.which
                        : event.keyCode;
                      if (keyCode === KEY_ENTER) {
                        act('send_msg', {
                          msg: ticketChat,
                          ticket_ref: ticket_ref,
                        });
                        setTicketChat('');
                      }
                    }}
                  />
                </Flex.Item>
                <Flex.Item>
                  <Button
                    content="Send"
                    onClick={() => {
                      act('send_msg', {
                        msg: ticketChat,
                        ticket_ref: ticket_ref,
                      });
                      setTicketChat('');
                    }}
                  />
                </Flex.Item>
              </Flex>
            </Flex.Item>
            <Divider />
            <Flex.Item>
              {Object.keys(log)
                .slice(0)
                .reverse()
                .map((L) => (
                  <div dangerouslySetInnerHTML={{ __html: log[L] }} />
                ))}
            </Flex.Item>
          </Flex>
        </Section>
      </Window.Content>
    </Window>
  );
};
