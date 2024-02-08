import { useBackend } from '../backend';
import { Box, Button, Flex, LabeledList, Section } from '../components';
import { Window } from '../layouts';
import { BeakerContents } from './common/BeakerContents';
import { ComplexModal, modalOpen } from './common/ComplexModal';

export const ChemSynthesizer = (props, context) => {
  return (
    <Window width={1100} height={640} resizable>
      <ComplexModal />
      <Window.Content>
        <Flex height="100%">
          <Flex.Item grow={1} maxWidth="33%">
            <ChemSynthesizerQueueRecipes />
          </Flex.Item>
          <Flex.Item grow={1}>
            <ChemSynthesizerChemicals />
          </Flex.Item>
          <Flex.Item grow={1} maxWidth="33%">
            <ChemSynthesizerSettings />
          </Flex.Item>
        </Flex>
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
                content={use_catalyst ? 'Catalyst Active' : 'Catalyst Disabled'}
                onClick={() => act('toggle_catalyst')}
              />
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
                    <LabeledList.Item label={item.name} labelColor="bad">
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
                  <LabeledList.Item label={item.name}>
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
                  <LabeledList.Item label={item.name}>
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

const ChemSynthesizerChemicals = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    busy,
    chemicals = [],
    rxn_vessel = [],
    catalyst,
    catalystCurrentVolume,
    catalystMaxVolume,
    catalyst_reagents = [],
  } = data;

  const flexFillers = [];
  for (let i = 0; i < (chemicals.length + 1) % 3; i++) {
    flexFillers.push(true);
  }
  return (
    <Flex direction="column">
      <Section title="Cartridge Reagents" flexGrow="1">
        <Flex direction="row" wrap="wrap" height="100%" align="flex-start">
          {chemicals.map((c, i) => (
            <Flex.Item key={i} grow="1" m={0.2} basis="40%" height="20px">
              <Button
                icon="arrow-circle-down"
                width="100%"
                height="100%"
                align="flex-start"
                disabled={1}
                content={c.title + ' (' + c.amount + ')'}
              />
            </Flex.Item>
          ))}
          {flexFillers.map((_, i) => (
            <Flex.Item key={i} grow="1" basis="25%" height="20px" />
          ))}
        </Flex>
      </Section>
      <Section title="Reaction Vessel">
        {rxn_vessel.length > 0 ? (
          <BeakerContents beakerLoaded beakerContents={rxn_vessel} />
        ) : (
          <Box color="label">Vessel is empty.</Box>
        )}
      </Section>
      <Section
        title="Catalyst"
        flex="content"
        minHeight="25%"
        buttons={
          <Box>
            {!!catalyst && (
              <Box inline color="label" mr={2}>
                {catalystCurrentVolume} / {catalystMaxVolume} units
              </Box>
            )}
            <Button
              icon="eject"
              content="Eject"
              disabled={!catalyst || !!busy}
              onClick={() => act('eject_catalyst')}
            />
          </Box>
        }
      >
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
    drug_substance,
    bottle_icon,
    pill_icon,
    patch_icon,
  } = data;

  return (
    <Flex height="100%" width="100%" direction="column">
      <Flex.Item height={0} grow={1}>
        <Section height="100%" title="Settings" overflowY="auto">
          <Flex direction="column">
            <Flex.Item>
              <Button
                color={production_mode ? 'green' : 'bad'}
                icon="wrench"
                content={
                  production_mode
                    ? 'Recipe mode: Import'
                    : 'Recipe mode: Tutorial'
                }
                onClick={() => act('mode_toggle')}
              />
            </Flex.Item>
            <Flex.Item>
              <Button
                disabled={!!busy}
                color={panel_open ? 'bad' : 'green'}
                icon="wrench"
                content={panel_open ? 'Panel Open' : 'Panel Closed'}
                onClick={() => act('panel_toggle')}
              />
            </Flex.Item>
            <Flex.Item>
              {!busy && (
                <Button
                  disabled={!rxn_vessel.length}
                  color="bad"
                  icon="flask"
                  tooltip="For emptying the reaction vessel if the machine stalls."
                  content="Bottle Manually"
                  onClick={() => act('bottle_product')}
                />
              )}
            </Flex.Item>
            <Flex.Item>
              <Button
                disabled={!busy}
                color="bad"
                icon="minus-circle"
                content="EMERGENCY STOP"
                onClick={() => act('emergency_stop')}
              />
            </Flex.Item>
          </Flex>
        </Section>
      </Flex.Item>
      <Flex.Item height={0} grow={1}>
        <Section height="100%" title="Drug Substance" overflowY="auto">
          <LabeledList>
            <LabeledList.Item label="Bottle">
              <Button
                icon="wine-bottle"
                content="Activate"
                selected={data.drug_substance === 1}
                mr="0.5rem"
                onClick={() => act('drug_form', { drug_index: 1 })}
              />
              <Button onClick={() => modalOpen(context, 'change_bottle_style')}>
                <div
                  style={
                    'display: inline-block;' +
                    'width: 16px;' +
                    'height: 16px;' +
                    'vertical-align: middle;' +
                    'background: url(bottle-' +
                    data.bottle_icon +
                    '.png);' +
                    'background-size: 200%;' +
                    'background-position: left -10px bottom -6px;'
                  }
                />
                Style
              </Button>
            </LabeledList.Item>
            <LabeledList.Item label="Pill">
              <Button
                icon="circle"
                content="Activate"
                selected={data.drug_substance === 2}
                mr="0.5rem"
                onClick={() => act('drug_form', { drug_index: 2 })}
              />
              <Button onClick={() => modalOpen(context, 'change_pill_style')}>
                <div
                  style={
                    'display: inline-block;' +
                    'width: 16px;' +
                    'height: 16px;' +
                    'vertical-align: middle;' +
                    'background: url(pill' +
                    data.pill_icon +
                    '.png);' +
                    'background-size: 200%;' +
                    'background-position: left -10px bottom -6px;'
                  }
                />
                Style
              </Button>
            </LabeledList.Item>
            <LabeledList.Item label="Patch">
              <Button
                icon="square"
                content="Activate"
                selected={data.drug_substance === 3}
                mr="0.5rem"
                onClick={() => act('drug_form', { drug_index: 3 })}
              />
              <Button onClick={() => modalOpen(context, 'change_patch_style')}>
                <div
                  style={
                    'display: inline-block;' +
                    'width: 16px;' +
                    'height: 16px;' +
                    'vertical-align: middle;' +
                    'background: url(patch' +
                    data.patch_icon +
                    '.png);' +
                    'background-size: 200%;' +
                    'background-position: left -10px bottom -6px;'
                  }
                />
                Style
              </Button>
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Flex.Item>
    </Flex>
  );
};
