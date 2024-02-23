import { BooleanLike } from 'common/react';

import { useBackend } from '../../../backend';
import { Button, Flex, LabeledList } from '../../../components';
import { stats } from './constants';

export const VoreContentsPanel = (props) => {
  const { act, data } = useBackend<{ show_pictures: BooleanLike }>();
  const { show_pictures } = data;
  const { contents, belly, outside = false } = props;

  return (
    <>
      {(outside && (
        <Button
          textAlign="center"
          fluid
          mb={1}
          onClick={() => act('pick_from_outside', { pickall: true })}
        >
          All
        </Button>
      )) ||
        null}
      {(show_pictures && (
        <Flex wrap="wrap" justify="center" align="center">
          {contents.map((thing) => (
            <Flex.Item key={thing.name} basis="33%">
              <Button
                width="64px"
                color={thing.absorbed ? 'purple' : stats[thing.stat]}
                style={{
                  'vertical-align': 'middle',
                  'margin-right': '5px',
                  'border-radius': '20px',
                }}
                onClick={() =>
                  act(
                    thing.outside ? 'pick_from_outside' : 'pick_from_inside',
                    {
                      pick: thing.ref,
                      belly: belly,
                    },
                  )
                }
              >
                <img
                  src={'data:image/jpeg;base64, ' + thing.icon}
                  width="64px"
                  height="64px"
                  style={{
                    // This style property has been made obsolete since Internet Explorer 9
                    // '-ms-interpolation-mode': 'nearest-neighbor',
                    marginLeft: '-5px',
                  }}
                />
              </Button>
              {thing.name}
            </Flex.Item>
          ))}
        </Flex>
      )) || (
        <LabeledList>
          {contents.map((thing) => (
            <LabeledList.Item key={thing.ref} label={thing.name}>
              <Button
                fluid
                mt={-1}
                mb={-1}
                color={thing.absorbed ? 'purple' : stats[thing.stat]}
                onClick={() =>
                  act(
                    thing.outside ? 'pick_from_outside' : 'pick_from_inside',
                    {
                      pick: thing.ref,
                      belly: belly,
                    },
                  )
                }
              >
                Interact
              </Button>
            </LabeledList.Item>
          ))}
        </LabeledList>
      )}
    </>
  );
};
