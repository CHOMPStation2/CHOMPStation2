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
                color="bad"
                icon="wrench"
                content={use_catalyst ? "Catalyst Active" : "Catalyst Disabled"}
                onClick={() => act("toggle_catalyst")} />
              <Button.Confirm
                disabled={!queue.length}
                color="bad"
                icon="minus-circle"
                content="Clear Queue"
                onClick={() => act("clear_queue")} />
              {(!busy && (
                <Button
                disabled={!queue.length}
                content="Start Queue"
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
          overflowY="auto">
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
    use_catalyst,
    queue = [],
  } = data;

};

const ChemMasterBuffer = (props, context) => {
  const { act } = useBackend(context);
  const {
    mode,
    bufferReagents = [],
  } = props;
  return (
    <Section
      title="Buffer"
      buttons={
        <Box color="label">
          Transferring to&nbsp;
          <Button
            icon={mode ? "flask" : "trash"}
            color={!mode && "bad"}
            content={mode ? "Beaker" : "Disposal"}
            onClick={() => act('toggle')}
          />
        </Box>
      }>
      {(bufferReagents.length > 0)
        ? (
          <BeakerContents
            beakerLoaded
            beakerContents={bufferReagents}
            buttons={(chemical, i) => (
              <Box mb={(i < bufferReagents.length - 1) && "2px"}>
                <Button
                  content="Analyze"
                  mb="0"
                  onClick={() => modalOpen(context, 'analyze', {
                    idx: i + 1,
                    beaker: 0,
                  })}
                />
                {transferAmounts.map((am, i) =>
                  (<Button
                    key={i}
                    content={am}
                    mb="0"
                    onClick={() => act('remove', {
                      id: chemical.id,
                      amount: am,
                    })}
                  />)
                )}
                <Button
                  content="All"
                  mb="0"
                  onClick={() => act('remove', {
                    id: chemical.id,
                    amount: chemical.volume,
                  })}
                />
                <Button
                  content="Custom.."
                  mb="0"
                  onClick={() => modalOpen(context, 'removecustom', {
                    id: chemical.id,
                  })}
                />
              </Box>
            )}
          />
        )
        : (
          <Box color="label">
            Buffer is empty.
          </Box>
        )}
    </Section>
  );
};

const ChemMasterProduction = (props, context) => {
  const { act, data } = useBackend(context);
  if (!props.bufferNonEmpty) {
    return (
      <Section
        title="Production"
        flexGrow="1"
        buttons={
          <Button
            disabled={!data.loaded_pill_bottle}
            icon="eject"
            content={data.loaded_pill_bottle
              ? (
                data.loaded_pill_bottle_name
                + " ("
                + data.loaded_pill_bottle_contents_len
                + "/"
                + data.loaded_pill_bottle_storage_slots
                + ")"
              )
              : "No pill bottle loaded"}
            mb="0.5rem"
            onClick={() => act('ejectp')}
          />
        }>
        <Flex height="100%">
          <Flex.Item
            grow="1"
            align="center"
            textAlign="center"
            color="label">
            <Icon
              name="tint-slash"
              mt="0.5rem"
              mb="0.5rem"
              size="5"
            /><br />
            Buffer is empty.
          </Flex.Item>
        </Flex>
      </Section>
    );
  }

  return (
    <Section
      title="Production"
      flexGrow="1"
      buttons={
        <Button
          disabled={!data.loaded_pill_bottle}
          icon="eject"
          content={data.loaded_pill_bottle
            ? (
              data.loaded_pill_bottle_name
              + " ("
              + data.loaded_pill_bottle_contents_len
              + "/"
              + data.loaded_pill_bottle_storage_slots
              + ")"
            )
            : "No pill bottle loaded"}
          mb="0.5rem"
          onClick={() => act('ejectp')}
        />
      }>
      {!props.isCondiment ? (
        <ChemMasterProductionChemical />
      ) : (
        <ChemMasterProductionCondiment />
      )}
    </Section>
  );
};

const ChemMasterProductionChemical = (props, context) => {
  const { act, data } = useBackend(context);
  return (
    <LabeledList>
      <LabeledList.Item label="Pills">
        <Button
          icon="circle"
          content="One (60u max)"
          mr="0.5rem"
          onClick={() => modalOpen(context, 'create_pill')}
        />
        <Button
          icon="plus-circle"
          content="Multiple"
          mb="0.5rem"
          onClick={() => modalOpen(context, 'create_pill_multiple')}
        /><br />
        <Button
          onClick={() => modalOpen(context, 'change_pill_style')}>
          <div style={
            "display: inline-block;"
            + "width: 16px;"
            + "height: 16px;"
            + "vertical-align: middle;"
            + "background: url(pill" + data.pillsprite + ".png);"
            + "background-size: 200%;"
            + "background-position: left -10px bottom -6px;"
          } />
          Style
        </Button>
      </LabeledList.Item>
      <LabeledList.Item label="Patches">
        <Button
          icon="square"
          content="One (60u max)"
          mr="0.5rem"
          onClick={() => modalOpen(context, 'create_patch')}
        />
        <Button
          icon="plus-square"
          content="Multiple"
          onClick={() => modalOpen(context, 'create_patch_multiple')}
        />
      </LabeledList.Item>
      <LabeledList.Item label="Bottle">
        <Button
          icon="wine-bottle"
          content="Create bottle (60u max)"
          mr="0.5rem"
          mb="0.5rem"
          onClick={() => modalOpen(context, 'create_bottle')}
        />
        <Button
          icon="plus-square"
          content="Multiple"
          onClick={() => modalOpen(context, 'create_bottle_multiple')}
        /><br />
        <Button
          mb="0.5rem"
          onClick={() => modalOpen(context, 'change_bottle_style')}>
          <div style={
            "display: inline-block;"
            + "width: 16px;"
            + "height: 16px;"
            + "vertical-align: middle;"
            + "background: url(bottle-" + data.bottlesprite + ".png);"
            + "background-size: 200%;"
            + "background-position: left -10px bottom -6px;"
          } />
          Style
        </Button>
      </LabeledList.Item>
    </LabeledList>
  );
};

const ChemMasterProductionCondiment = (props, context) => {
  const { act } = useBackend(context);
  return (
    <Fragment>
      <Button
        icon="box"
        content="Create condiment pack (10u max)"
        mb="0.5rem"
        onClick={() => modalOpen(context, 'create_condi_pack')}
      /><br />
      <Button
        icon="wine-bottle"
        content="Create bottle (60u max)"
        mb="0"
        onClick={() => act('create_condi_bottle')}
      />
    </Fragment>
  );
};

// const ChemMasterCustomization = (props, context) => {
//   const { act, data } = useBackend(context);
//   if (!data.loaded_pill_bottle) {
//     return (
//       <Section title="Pill Bottle Customization">
//         <Box color="label">
//           None loaded.
//         </Box>
//       </Section>
//     );
//   }

//   return (
//     <Section title="Pill Bottle Customization">
//       <Button
//         disabled={!data.loaded_pill_bottle}
//         icon="eject"
//         content={data.loaded_pill_bottle
//           ? (
//             data.loaded_pill_bottle_name
//               + " ("
//               + data.loaded_pill_bottle_contents_len
//               + "/"
//               + data.loaded_pill_bottle_storage_slots
//               + ")"
//           )
//           : "None loaded"}
//         mb="0.5rem"
//         onClick={() => act('ejectp')}
//       />
//     </Section>
//   );
// };

modalRegisterBodyOverride('analyze', analyzeModalBodyOverride);
