import { useBackend } from '../../../backend';
import { Box, Button, Stack } from '../../../components';

export const FeatureColorInput = (props) => {
  const { act } = useBackend();
  const { action_name, value_of, back_color, name_of } = props;
  return (
    <Button
      onClick={() => {
        act('set_attribute', { attribute: action_name, val: value_of });
      }}
    >
      <Stack align="center" fill>
        <Stack.Item>
          <Box
            style={{
              background: back_color.startsWith('#')
                ? back_color
                : `#${back_color}`,
              border: '2px solid white',
              boxSizing: 'content-box',
              height: '11px',
              width: '11px',
            }}
          />
        </Stack.Item>
        <Stack.Item>Change {name_of}</Stack.Item>
      </Stack>
    </Button>
  );
};
