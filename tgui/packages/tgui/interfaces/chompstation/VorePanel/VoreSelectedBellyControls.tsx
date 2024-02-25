import { useBackend } from '../../../backend';
import { Button, LabeledList } from '../../../components';
import { digestModeToColor } from './constants';

export const VoreSelectedBellyControls = (props) => {
  const { act } = useBackend();

  const { belly } = props;
  const { belly_name, mode, item_mode, addons } = belly;

  return (
    <LabeledList>
      <LabeledList.Item
        label="Name"
        buttons={
          <>
            <Button
              icon="arrow-up"
              tooltipPosition="left"
              tooltip="Move this belly tab up."
              onClick={() => act('move_belly', { dir: -1 })}
            />
            <Button
              icon="arrow-down"
              tooltipPosition="left"
              tooltip="Move this belly tab down."
              onClick={() => act('move_belly', { dir: 1 })}
            />
          </>
        }
      >
        <Button
          onClick={() => act('set_attribute', { attribute: 'b_name' })}
          content={belly_name}
        />
      </LabeledList.Item>
      <LabeledList.Item label="Mode">
        <Button
          color={digestModeToColor[mode]}
          onClick={() => act('set_attribute', { attribute: 'b_mode' })}
          content={mode}
        />
      </LabeledList.Item>
      <LabeledList.Item label="Mode Addons">
        {(addons.length && addons.join(', ')) || 'None'}
        <Button
          onClick={() => act('set_attribute', { attribute: 'b_addons' })}
          ml={1}
          icon="plus"
        />
      </LabeledList.Item>
      <LabeledList.Item label="Item Mode">
        <Button
          onClick={() => act('set_attribute', { attribute: 'b_item_mode' })}
          content={item_mode}
        />
      </LabeledList.Item>
      <LabeledList.Item>
        <Button.Confirm
          fluid
          icon="exclamation-triangle"
          confirmIcon="trash"
          color="red"
          content="Delete Belly"
          confirmContent="This is irreversable!"
          onClick={() => act('set_attribute', { attribute: 'b_del' })}
        />
      </LabeledList.Item>
    </LabeledList>
  );
};
