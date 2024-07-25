import { BooleanLike } from 'common/react';

import { useBackend } from '../../../../backend';
import { Box, Button, LabeledList } from '../../../../components';

export const CatchSettings = (props: {
  catch_self: BooleanLike;
  catch_prey: BooleanLike;
  catch_ghost: BooleanLike;
}) => {
  const { act } = useBackend();

  const { catch_self, catch_prey, catch_ghost } = props;

  return (
    <LabeledList.Item label="Catch Settings">
      <Box>
        <Button
          icon="circle-user"
          tooltip={
            (catch_self ? 'Allow' : 'Disallow') +
            ' your own soulcatcher to capture your own soul upon vore death.'
          }
          tooltipPosition="bottom"
          color={catch_self ? 'green' : 'red'}
          onClick={() => act('toggle_self_catching')}
        >
          Catch User
        </Button>
        <Button
          icon="person"
          tooltip={
            (catch_prey ? 'Allow' : 'Disallow') +
            ' your own soulcatcher to capture prey souls upon vore death.'
          }
          tooltipPosition="bottom"
          color={catch_prey ? 'green' : 'red'}
          onClick={() => act('toggle_prey_catching')}
        >
          Catch Prey
        </Button>
        <Button
          icon="ghost"
          tooltip={
            (catch_ghost ? 'Allow' : 'Disallow') +
            ' ghosts to join your soulcatcher.'
          }
          tooltipPosition="bottom"
          color={catch_ghost ? 'green' : 'red'}
          onClick={() => act('toggle_ghost_catching')}
        >
          Catch Ghost
        </Button>
      </Box>
    </LabeledList.Item>
  );
};
