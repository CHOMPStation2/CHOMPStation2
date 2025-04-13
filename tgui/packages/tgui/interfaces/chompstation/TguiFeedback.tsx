import { useState } from 'react';
import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  Box,
  Button,
  Input,
  Section,
  Stack,
  Tabs,
  TextArea,
} from 'tgui-core/components';

type Data = {
  open_windows: string[];
  selected_window: string;
};

export const TguiFeedback = (props) => {
  const { act, data } = useBackend<Data>();
  const { open_windows, selected_window } = data;
  const [rating, setRating] = useState<string>('');
  const [comment, setComment] = useState<string>('');
  return (
    <Window width={550} height={460}>
      <Stack>
        <Stack.Item>
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
        </Stack.Item>
        <Stack.Item>
          {selected_window && (
            <>
              <Section title="Rating">
                Please enter your rating of this window from a range from 1 to 5
                <br />
                <Input onChange={(val) => setRating(val)} value={rating} />
              </Section>
              <Section title="Optional Comment">
                If you want, you can leave an optional comment as well!
                <br />
                <TextArea
                  height={'18rem'}
                  onChange={(val) => setComment(val)}
                  value={comment}
                />
              </Section>
              <Button
                onClick={() =>
                  act('submit', { rating: rating, comment: comment })
                }
              >
                Submit
              </Button>
            </>
          )}
          : {<>Please select an open window on the left!</>}
        </Stack.Item>
      </Stack>
    </Window>
  );
};
