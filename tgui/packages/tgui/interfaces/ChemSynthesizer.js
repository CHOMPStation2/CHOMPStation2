import { Fragment } from 'inferno';
import { useBackend } from "../backend";
import { Box, Button, Flex, LabeledList, Section } from "../components";
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
                icon="wrench"
                tooltip="Enable/Disable the catalyst BEFORE starting the queue."
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
                  icon="play"
                  tooltip="Start Queue"
                  onClick={() => act("start_queue")} />
              ))}
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
          buttons={
            <Button
              icon="plus"
              tooltip={production_mode ? "Import Recipe" : "Generate Recipe"}
              onClick={() => act("add_recipe")} />
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

  return (
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
        
          return (
            <LabeledList.Item label={item.name}>
              <Button
                icon="trash"
                onClick={() => act("rem_queue", {
                  q_index: item.index,
                })}>
                Delete
              </Button>
            </LabeledList.Item>
          );
        } }) || (
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

  return (
    <Flex>
      {recipes.map(item => {
        <Flex.Item>
          <Button
            color="bad"
            icon="minus"
            disabled={!!busy}
            onClick={() => act("rem_recipe", { 
              rm_index: item.name,
            })} />
          <Button
            icon="inbox"
            onClick={() => act("exp_recipe", { 
              exp_index: item.name,
            })} />
          <Button
            icon="plus"
            onClick={() => act("add_queue", { 
              qa_index: item.name,
            })} />
          <Box>
            {item.name}
          </Box>
        </Flex.Item>;
      })}
    </Flex>
  ); 
};

const ChemSynthesizerChemicals = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    busy,
    chemicals = [],
    rxn_vessel = [],
    catalyst,
    catalyst_reagents = [],
  } = data;

  const flexFillers = [];
  for (let i = 0; i < (chemicals.length + 1) % 3; i++) {
    flexFillers.push(true);
  }
  return (
    <Flex>
      <Section
        title="Cartridge Reagents"
        flexGrow="1">
        <Flex
          direction="row"
          wrap="wrap"
          height="100%"
          align="flex-start">
          {chemicals.map((c, i) => (
            <Flex.Item key={i} grow="1" m={0.2} basis="40%" height="20px">
              <Box>
                {c.title + " (" + c.amount + ")"}
              </Box>
            </Flex.Item>
          ))}
          {flexFillers.map((_, i) => (
            <Flex.Item key={i} grow="1" basis="25%" height="20px" />
          ))}
        </Flex>
      </Section>
      <Section
        title="Reaction Vessel">
        {(rxn_vessel.length > 0)
          ? (
            <BeakerContents
              beakerLoaded
              beakerContents={rxn_vessel}
            />
          )
          : (
            <Box color="label">
              Vessel is empty.
            </Box>
          )}
      </Section>
      <Section
        title="Catalyst"
        flex="content"
        minHeight="25%"
        buttons={(
          <Box>
            {!!beaker && (
              <Box inline color="label" mr={2}>
                {beakerCurrentVolume} / {beakerMaxVolume} units
              </Box>
            )}
            <Button
              icon="eject"
              content="Eject"
              disabled={!catalyst || !!busy}
              onClick={() => act("eject_catalyst")}
            />
          </Box>
        )}>
        <BeakerContents
          beakerLoaded={catalyst}
          beakerContents={catalyst_reagents}
        />
      </Section>
    </Flex>
  );
};

const ChemSynthesizerSettings = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    busy,
    production_mode,
    panel_open,
    rxn_vessel,
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
          title="Settings"
          overflowY="auto"
          buttons={
            <Fragment>
              <Button 
                color={production_mode ? "green" : "bad"}
                icon="wrench"
                content={production_mode ? "Recipe mode: Import" : "Recipe mode: Tutorial"}
                onClick={() => act("panel_toggle")} />
              <Button 
                disabled={!!busy}
                color={panel_open ? "bad" : "green"}
                icon="wrench"
                content={panel_open ? "Panel Open" : "Panel Closed"}
                onClick={() => act("panel_toggle")} />
              {(!busy && (
                <Button
                  disabled={!rxn_vessel.length}
                  color="bad"
                  icon="flask"
                  tooltip="For emptying the reaction vessel if the machine stalls."
                  content="Bottle Manually"
                  onClick={() => act("bottle_product")} />
              ))}
              <Button
                disabled={!busy}
                color="bad"
                icon="minus-circle"
                content="EMERGENCY STOP"
                onClick={() => act("emergency_stop")} />
            </Fragment>
          } />
      </Flex.Item>
    </Flex>
  );
};