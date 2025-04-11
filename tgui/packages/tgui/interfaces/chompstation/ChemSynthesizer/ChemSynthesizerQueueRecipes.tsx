import { useBackend } from 'tgui/backend';
import { Box, Button, LabeledList, Section, Stack } from 'tgui-core/components';

import type { Data } from './types';

export const ChemSynthesizerQueueRecipes = (props) => {
  const { act, data } = useBackend<Data>();
  const {
    busy,
    use_catalyst,
    queue = [],
    recipes = [],
    production_mode,
  } = data;

  return (
    <Stack height="100%" width="100%" direction="column">
      <Stack.Item maxHeight="50%" grow basis={0}>
        <Section
          height="100%"
          title="Queue"
          overflowY="scroll"
          buttons={
            <Stack>
              <Stack.Item>
                <Button
                  disabled={!!busy}
                  color={use_catalyst ? 'green' : 'bad'}
                  icon="wrench"
                  tooltip="Enable/Disable the catalyst BEFORE starting the queue."
                  onClick={() => act('toggle_catalyst')}
                >
                  {use_catalyst ? 'Catalyst Active' : 'Catalyst Disabled'}
                </Button>
              </Stack.Item>
              <Stack.Item>
                <Button.Confirm
                  disabled={!queue.length}
                  color="bad"
                  icon="minus-circle"
                  tooltip="Clear Queue"
                  onClick={() => act('clear_queue')}
                />
              </Stack.Item>
              {!busy && (
                <Stack.Item>
                  <Button
                    disabled={!queue.length}
                    icon="play"
                    tooltip="Start Queue"
                    onClick={() => act('start_queue')}
                  />
                </Stack.Item>
              )}
            </Stack>
          }
        >
          <LabeledList>
            {(queue.length &&
              queue.map((item) => {
                if (item.index === 1 && !!busy) {
                  return (
                    <LabeledList.Item key="" label={item.name} labelColor="bad">
                      {
                        <Box>
                          <Button disabled icon="trash">
                            Delete
                          </Button>
                        </Box>
                      }
                    </LabeledList.Item>
                  );
                }
                return (
                  <LabeledList.Item key="" label={item.name}>
                    <Button
                      icon="trash"
                      onClick={() =>
                        act('rem_queue', {
                          q_index: item.index,
                        })
                      }
                    >
                      Delete
                    </Button>
                  </LabeledList.Item>
                );
              })) || <Box m={1}>Queue Empty.</Box>}
          </LabeledList>
        </Section>
      </Stack.Item>
      <Stack.Item maxHeight="50%" grow basis={0}>
        <Section
          height="100%"
          title="Recipes"
          overflowY="scroll"
          buttons={
            <Button
              icon="plus"
              tooltip={production_mode ? 'Import Recipe' : 'Generate Recipe'}
              onClick={() => act('add_recipe')}
            />
          }
        >
          <LabeledList>
            {(recipes.length &&
              recipes.map((item) => {
                return (
                  <LabeledList.Item key="" label={item.name}>
                    <Button
                      icon="plus"
                      tooltip="Add to Queue"
                      onClick={() =>
                        act('add_queue', {
                          qa_index: item.name,
                        })
                      }
                    />
                    <Button
                      icon="inbox"
                      tooltip="Export Recipe"
                      onClick={() =>
                        act('exp_recipe', {
                          exp_index: item.name,
                        })
                      }
                    />
                    <Button
                      color="bad"
                      icon="minus-circle"
                      tooltip="Delete Recipe"
                      disabled={!!busy}
                      onClick={() =>
                        act('rem_recipe', {
                          rm_index: item.name,
                        })
                      }
                    />
                  </LabeledList.Item>
                );
              })) || <Box m={1}>No recipes found.</Box>}
          </LabeledList>
        </Section>
      </Stack.Item>
    </Stack>
  );
};
