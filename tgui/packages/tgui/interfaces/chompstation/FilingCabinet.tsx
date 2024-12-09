import { useBackend } from '../../backend';
import { Box, Button, Flex, Section } from '../../components';
import { Window } from '../../layouts';

type Data = {
  cabinet_name: string;
  contents: string[];
  contents_ref: string[];
};

export const FilingCabinet = (props) => {
  const { act, data } = useBackend<Data>();
  const { cabinet_name, contents, contents_ref } = data;
  return (
    <Window title={cabinet_name || 'Filing Cabinet'} width={350} height={300}>
      <Window.Content backgroundColor="#B88F3D" scrollable>
        {contents.map((object, index) => (
          <Flex
            key={contents_ref[index]}
            color="black"
            backgroundColor="white"
            style={{ padding: '2px' }}
            mb={0.5}
          >
            <Flex.Item align="center" grow={1}>
              <Box align="center">{object}</Box>
            </Flex.Item>
            <Flex.Item>
              <Button
                icon="eject"
                onClick={() =>
                  act('remove_object', { ref: contents_ref[index] })
                }
              />
            </Flex.Item>
          </Flex>
        ))}
        {contents.length === 0 && (
          <Section>
            <Box color="white" align="center">
              The {cabinet_name} is empty!
            </Box>
          </Section>
        )}
      </Window.Content>
    </Window>
  );
};
