import { useBackend } from '../backend';
import { Button, LabeledList, Section } from '../components';
import { Window } from '../layouts';

export const PetrificationInterface = (props, context) => {
  const { act, data } = useBackend(context);

  const {
    material,
    identifier,
    adjective,
    tint,
    t,
    able_to_unpetrify,
    discard_clothes,
    target,
    can_remote,
  } = data;

  return (
    <Window width={425} height={313} resizable>
      <Window.Content scrollable>
        <Section title="Interface">
          <LabeledList>
            <LabeledList.Item label="Identifier">
              <Button
                fluid
                content={'Change Identifier: "' + identifier + '"'}
                tooltip="The identifier for the petrification. ie. 'A statue of (target)'"
                tooltipPosition="top"
                onClick={() => act('set_option', { option: 'identifier' })}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Material">
              <Button
                fluid
                content={'Change Material: "' + material + '"'}
                tooltip={
                  'The material for the petrification. ie. "(name)' +
                  "'" +
                  's skin rapidly (adjective) as they turn to (material)!"'
                }
                tooltipPosition="top"
                onClick={() => act('set_option', { option: 'material' })}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Adjective">
              <Button
                fluid
                content={'Change Adjective: "' + adjective + '"'}
                tooltip={
                  'The adjective for the petrification. ie. "(name)' +
                  "'" +
                  's skin rapidly (adjective) as they turn to (material)!"'
                }
                tooltipPosition="top"
                onClick={() => act('set_option', { option: 'adjective' })}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Color">
              <Button
                fluid
                content="Change Color"
                backgroundColor={tint}
                textColor={t ? '#000000' : '#ffffff'}
                tooltip="The color of the statue. Pure white is direct greyscale."
                tooltipPosition="top"
                onClick={() => act('set_option', { option: 'tint' })}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Can Unpetrify">
              <Button
                fluid
                content={able_to_unpetrify ? 'Yes' : 'No'}
                selected={able_to_unpetrify}
                tooltip="Whether or not the statue can be unpetrified. If yes, they will get a verb letting them turn back- if not, even if they're a gargoyle, it will be taken away. OOC Escape is always an option though."
                tooltipPosition="top"
                onClick={() =>
                  act('set_option', { option: 'able_to_unpetrify' })
                }
              />
            </LabeledList.Item>
            <LabeledList.Item label="Discard Clothes">
              <Button
                fluid
                content={discard_clothes ? 'Enabled' : 'Disabled'}
                selected={discard_clothes}
                tooltip="Whether the target's clothing falls off before the petrification happens. (Clothes do not change color when petrified, and cannot be removed while being a statue)"
                tooltipPosition="top"
                onClick={() => act('set_option', { option: 'discard_clothes' })}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Target">
              <Button
                fluid
                content={target}
                onClick={() => act('set_option', { option: 'target' })}
              />
            </LabeledList.Item>
          </LabeledList>
          <br />
          <Button
            ml={1}
            disabled={!can_remote}
            content="Petrify"
            tooltip={
              'Turn the target to ' +
              material +
              ". This is meant for roleplay/scene purposes. Please don't abuse it."
            }
            tooltipPosition="top"
            onClick={() => act('petrify')}
          />
          <Button
            mr={1}
            disabled={!can_remote}
            content="Create Remote"
            tooltip="Create a remote that will petrify the target with the given options when the button is pressed. It must be within 4 tiles of the target when pressed to work.. This is meant for roleplay/scene purposes. Please don't abuse it."
            tooltipPosition="top"
            onClick={() => act('remote')}
          />
        </Section>
      </Window.Content>
    </Window>
  );
};
