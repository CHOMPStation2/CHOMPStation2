import { useState } from 'react';

import { useBackend } from '../../backend';
import {
  Box,
  Button,
  Flex,
  Input,
  Section,
  Tabs,
  TextArea,
} from '../../components';
import { Window } from '../../layouts';

type Data = {
  open_windows: string[];
  selected_window: string;
};

export const TguiFeedback = (props) => {
  const { act, data } = useBackend<Data>();
  const { open_windows, selected_window } = data;
  const [rating, setRating] = useState('');
  const [comment, setComment] = useState('');
  return (
    <Window width={550} height={460}>
      <Flex>
        <Flex.Item>
          <Section title="Open Windows" scrollable>
            <Tabs vertical>
              {open_windows.map((window) => (
                <Tabs.Tab
                  key={window}
                  selected={window === selected_window}
                  onClick={() => act('pick_window', { win: window })}
                >
                  <Box inline>{window}</Box>
                </Tabs.Tab>
              ))}
            </Tabs>
          </Section>
        </Flex.Item>
        <Flex.Item>
          {selected_window && (
            <>
              <Section title="Rating">
                Please enter your rating of this window from a range from 1 to 5
                <br />
                <Input onChange={(e, val) => setRating(val)} value={rating} />
              </Section>
              <Section title="Optional Comment">
                If you want, you can leave an optional comment as well!
                <br />
                <TextArea
                  height={'18rem'}
                  onChange={(e, val) => setComment(val)}
                  value={comment}
                />
              </Section>
              <Button
                content="Submit"
                onClick={() =>
                  act('submit', { rating: rating, comment: comment })
                }
              />
            </>
          )}{' '}
          : {<>Please select an open window on the left!</>}
        </Flex.Item>
      </Flex>
    </Window>
  );
};
