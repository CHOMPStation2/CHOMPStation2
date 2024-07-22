import { useBackend } from '../../../backend';
import { Box, Button, Flex, LabeledList, Section } from '../../../components';
import { Data } from './types';

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
    <Flex height="100%" width="100%" direction="column">
      <Flex.Item maxHeight="50%" grow={1} basis={0}>
        <Section
          height="100%"
          title="Queue"
          overflowY="scroll"
          buttons={
            <>
              <Button
                disabled={!!busy}
                color={use_catalyst ? 'green' : 'bad'}
                icon="wrench"
                tooltip="Enable/Disable the catalyst BEFORE starting the queue."
                onClick={() => act('toggle_catalyst')}
              >
                {use_catalyst ? 'Catalyst Active' : 'Catalyst Disabled'}
              </Button>
              <Button.Confirm
                disabled={!queue.length}
                color="bad"
                icon="minus-circle"
                tooltip="Clear Queue"
                onClick={() => act('clear_queue')}
              />
              {!busy && (
                <Button
                  disabled={!queue.length}
                  icon="play"
                  tooltip="Start Queue"
                  onClick={() => act('start_queue')}
                />
              )}
            </>
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
      </Flex.Item>
      <Flex.Item maxHeight="50%" grow={1} basis={0}>
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
      </Flex.Item>
    </Flex>
  );
};
