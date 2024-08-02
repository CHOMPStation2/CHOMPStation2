/* eslint react/no-danger: "off" */
import { KEY } from 'common/keys';
import { useState } from 'react';

import { useBackend } from '../../backend';
import {
  Box,
  Button,
  Divider,
  Flex,
  Input,
  LabeledList,
  Section,
} from '../../components';
import { Window } from '../../layouts';

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
  example: 'Example',
};

const State = {
  open: 'Open',
  resolved: 'Resolved',
  closed: 'Closed',
  unknown: 'Unknown',
};

type Data = {
  id: number;
  level: number;
  handler: string;
  log: string[];
};

export const TicketChat = (props) => {
  const { act, data } = useBackend<Data>();
  const [ticketChat, setTicketChat] = useState('');
  const { id, level, handler, log } = data;
  return (
    <Window width={900} height={600}>
      <Window.Content>
        <Section
          title={'Ticket #' + id}
          buttons={
            <Box nowrap>
              <Button color={LevelColor[level]}>{Level[level]}</Button>
            </Box>
          }
        >
          <LabeledList>
            <LabeledList.Item label="Assignee">{handler}</LabeledList.Item>
            <LabeledList.Item label="Log" />
          </LabeledList>
          <Divider />
          <Flex direction="column">
            <Flex.Item>
              {Object.keys(log)
                .slice(0)
                .map((L, i) => (
                  <div key={i} dangerouslySetInnerHTML={{ __html: log[L] }} />
                ))}
            </Flex.Item>
            <Divider />
            <Flex.Item>
              <Flex>
                <Flex.Item grow>
                  <Input
                    autoFocus
                    autoSelect
                    fluid
                    placeholder="Enter a message..."
                    value={ticketChat}
                    onInput={(e, value: string) => setTicketChat(value)}
                    onKeyDown={(e) => {
                      if (KEY.Enter === e.key) {
                        act('send_msg', { msg: ticketChat });
                        setTicketChat('');
                      }
                    }}
                  />
                </Flex.Item>
                <Flex.Item>
                  <Button
                    onClick={() => {
                      act('send_msg', { msg: ticketChat });
                      setTicketChat('');
                    }}
                  >
                    Send
                  </Button>
                </Flex.Item>
              </Flex>
            </Flex.Item>
          </Flex>
        </Section>
      </Window.Content>
    </Window>
  );
};
