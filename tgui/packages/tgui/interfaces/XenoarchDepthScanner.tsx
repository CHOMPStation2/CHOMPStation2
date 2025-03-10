import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import { Box, Button, LabeledList, Section } from 'tgui-core/components';

type Data = {
  current: {
    index: string;
    time: string;
    coords: string;
    depth: number;
    material: string;
  };
  positive_locations: { index: string; time: string; coords: string }[];
};

export const XenoarchDepthScanner = (props) => {
  const { act, data } = useBackend<Data>();

  const { current, positive_locations } = data;

  return (
    <Window width={300} height={500}>
      <Window.Content scrollable>
        {(Object.keys(current).length && (
          <Section
            title="Selected"
            buttons={
              <Button.Confirm
                color="bad"
                icon="trash"
                confirmIcon="trash"
                onClick={() => act('clear', { index: current.index })}
              >
                Delete Entry
              </Button.Confirm>
            }
          >
            <LabeledList>
              <LabeledList.Item label="Time">{current.time}</LabeledList.Item>
              <LabeledList.Item label="Coords">
                {current.coords}
              </LabeledList.Item>
              <LabeledList.Item label="Anomaly Depth">
                {current.depth} cm
              </LabeledList.Item>
              <LabeledList.Item label="Anomaly Material">
                {current.material}
              </LabeledList.Item>
            </LabeledList>
          </Section>
        )) ||
          null}
        <Section
          title="Entries"
          buttons={
            <Button.Confirm
              color="red"
              icon="trash"
              confirmIcon="trash"
              onClick={() => act('clear')}
            >
              Delete All
            </Button.Confirm>
          }
        >
          {(positive_locations.length &&
            positive_locations.map((loc) => (
              <Button
                key={loc.index}
                icon="eye"
                onClick={() => act('select', { select: loc.index })}
              >
                {loc.time}, {loc.coords}
              </Button>
            ))) || <Box color="bad">No traces found.</Box>}
        </Section>
      </Window.Content>
    </Window>
  );
};
