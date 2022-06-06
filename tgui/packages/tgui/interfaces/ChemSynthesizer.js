import { Fragment } from 'inferno';
import { useBackend } from "../backend";
import { Box, Button, Flex, Icon, LabeledList, Section } from "../components";
import { Window } from "../layouts";
import { BeakerContents } from './common/BeakerContents';

export const ChemSynthesizer = (props, context) => {
  return (
    <Window
      width={575}
      height={500}
      resizable>
      <Window.Content className="Layout__content--flexColumn">
        <ChemSynthesizerQueueRecipes />
        <ChemSynthesizerQueueList />
        <ChemSynthesizerRecipeList />
        <ChemSynthesizerChemicals />
        <ChemSynthesizerSettings />
      </Window.Content>
    </Window>
  );
};

const ChemSynthesizerQueueRecipes = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    busy,
    use_catalyst,
    queue = [],
    production_mode,
  } = data;

  return (
    <Flex
      height="100%"
      width="100%"
      direction="column">
      <Flex.Item
        height={0}
        grow={1}>
        <Section
          height="100%"
          title="Queue"
          overflowY="auto"
          buttons={
            <Fragment>
              <Button 
                disabled={!!busy}
                color={use_catalyst ? "green" : "bad"}
                tooltip="Enable/Disable the catalyst BEFORE starting the queue."
                icon="wrench"
                content={use_catalyst ? "Catalyst Active" : "Catalyst Disabled"}
                onClick={() => act("toggle_catalyst")} />
              <Button.Confirm
                disabled={!queue.length}
                color="bad"
                icon="minus-circle"
                tooltip="Clear Queue"
                onClick={() => act("clear_queue")} />
              {(!busy && (
                <Button
                disabled={!queue.length}
                tooltip="Start Queue"
                icon="play"
                onClick={() => act("start_queue")} />
              ))
              }
            </Fragment>
          }>
          <Flex
            direction="column"
            height="100%">
            <Flex.Item>
            <ChemSynthesizerQueueList />
            </Flex.Item>
          </Flex>
        </Section>
        <Section
          height="100%"
          title="Recipes"
          overflowY="auto"
          buttons = {
            <Fragment>
              <Button
                icon="plus"
                tooltip={production_mode ? "Import Recipe" : "Generate Recipe"}
                onClick={() => act("add_recipe")} />
            </Fragment>
          }>
          <Flex
            direction="column"
            height="100%">
            <Flex.Item>
            <ChemSynthesizerRecipeList />
            </Flex.Item>
          </Flex>
        </Section>
      </Flex.Item>
    </Flex>
  );
};

const ChemSynthesizerQueueList = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    queue = [],
    busy,
  } = data;

  return = (
    <LabeledList>
      {queue.length && queue.map(item => {
        if ((item.index === 1) && !!busy) {
          return (
            <LabeledList.Item label={item.name} labelColor="bad">
            {
              <Box>
                <Button
                  disabled icon="trash">
                    Delete
                </Button>
              </Box>
            }
            </LabeledList.Item>
          );
        }
      return (
        <LabeledList.Item label={item.name}>
          <Button
            icon="trash"
            onClick={() => act("rem_queue", {
              q_index: item.index
            })}>
            Delete
          </Button>
        </LabeledList.Item>
      );
    }) || (
      <Box m={1}>
        Queue Empty.
      </Box>
    )}
  </LabeledList>
  );
};

const ChemSynthesizerRecipeList = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    recipes = [],
    busy,
  } = data;

  return = (
    <LabeledList>
      {recipes.length && recipes.map(item => {
        <LabeledList.Item label={item.name}>
          <Button
            icon="trash"
            onClick={() => act("rem_queue", {
              q_index: item.index
            })}>
            Delete
          </Button>
        </LabeledList.Item>
    }) || (
      <Box m={1}>
        No Recipes.
      </Box>
    )}
  </LabeledList>
  );
};