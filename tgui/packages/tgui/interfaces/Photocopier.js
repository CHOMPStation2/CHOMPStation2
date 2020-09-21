import { ProgressBar, NumberInput, Button, Section, Box, Flex } from '../components';
import { useBackend } from '../backend';
import { Window } from '../layouts';

export const Photocopier = (props, context) => {
  const { data } = useBackend(context);
<<<<<<< HEAD
  const { isAI, has_toner, has_item } = data;

  return (
    <Window title="Photocopier" width={240} height={isAI ? 309 : 234}>
=======
  const {
    isAI,
    has_toner,
    has_item,
  } = data;

  return (
    <Window
      title="Photocopier"
      width={240}
      height={isAI ? 309 : 234}>
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
      <Window.Content>
        {has_toner ? (
          <Toner />
        ) : (
          <Section title="Toner">
<<<<<<< HEAD
            <Box color="average">No inserted toner cartridge.</Box>
=======
            <Box color="average">
              No inserted toner cartridge.
            </Box>
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
          </Section>
        )}
        {has_item ? (
          <Options />
        ) : (
          <Section title="Options">
<<<<<<< HEAD
            <Box color="average">No inserted item.</Box>
          </Section>
        )}
        {!!isAI && <AIOptions />}
=======
            <Box color="average">
              No inserted item.
            </Box>
          </Section>
        )}
        {!!isAI && (
          <AIOptions />
        )}
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
      </Window.Content>
    </Window>
  );
};

const Toner = (props, context) => {
  const { act, data } = useBackend(context);
<<<<<<< HEAD
  const { max_toner, current_toner } = data;
=======
  const {
    max_toner,
    current_toner,
  } = data;
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale

  const average_toner = max_toner * 0.66;
  const bad_toner = max_toner * 0.33;

  return (
<<<<<<< HEAD
    <Section title="Toner">
=======
    <Section
      title="Toner">
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
      <ProgressBar
        ranges={{
          good: [average_toner, max_toner],
          average: [bad_toner, average_toner],
          bad: [0, bad_toner],
        }}
        value={current_toner}
        minValue={0}
<<<<<<< HEAD
        maxValue={max_toner}
      />
=======
        maxValue={max_toner} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
    </Section>
  );
};

const Options = (props, context) => {
  const { act, data } = useBackend(context);
<<<<<<< HEAD
  const { num_copies, has_enough_toner } = data;
=======
  const {
    num_copies,
    has_enough_toner,
  } = data;
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale

  return (
    <Section title="Options">
      <Flex>
<<<<<<< HEAD
        <Flex.Item mt={0.4} width={11} color="label">
=======
        <Flex.Item
          mt={0.4}
          width={11}
          color="label">
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
          Make copies:
        </Flex.Item>
        <Flex.Item>
          <NumberInput
            animate
            width={2.6}
            height={1.65}
            step={1}
            stepPixelSize={8}
            minValue={1}
            maxValue={10}
            value={num_copies}
<<<<<<< HEAD
            onDrag={(e, value) =>
              act('set_copies', {
                num_copies: value,
              })
            }
          />
        </Flex.Item>
        <Flex.Item>
          <Button ml={0.2} icon="copy" textAlign="center" onClick={() => act('make_copy')}>
=======
            onDrag={(e, value) => act('set_copies', {
              num_copies: value,
            })} />
        </Flex.Item>
        <Flex.Item>
          <Button
            ml={0.2}
            icon="copy"
            textAlign="center"
            onClick={() => act('make_copy')}>
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
            Copy
          </Button>
        </Flex.Item>
      </Flex>
<<<<<<< HEAD
      <Button mt={0.5} textAlign="center" icon="reply" fluid onClick={() => act('remove')}>
=======
      <Button
        mt={0.5}
        textAlign="center"
        icon="reply"
        fluid
        onClick={() => act('remove')}>
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
        Remove item
      </Button>
    </Section>
  );
};

const AIOptions = (props, context) => {
  const { act, data } = useBackend(context);
  const { can_AI_print } = data;

  return (
    <Section title="AI Options">
      <Box>
<<<<<<< HEAD
        <Button fluid icon="images" textAlign="center" disabled={!can_AI_print} onClick={() => act('ai_photo')}>
=======
        <Button
          fluid
          icon="images"
          textAlign="center"
          disabled={!can_AI_print}
          onClick={() => act('ai_photo')}>
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
          Print photo from database
        </Button>
      </Box>
    </Section>
  );
};
