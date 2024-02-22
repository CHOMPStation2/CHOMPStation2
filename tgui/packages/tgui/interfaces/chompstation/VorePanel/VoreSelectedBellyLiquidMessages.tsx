import { useBackend } from '../../../backend';
import { Button, LabeledList, Section } from '../../../components';

export const VoreSelectedBellyLiquidMessages = (props) => {
  const { act } = useBackend();

  const { belly } = props;
  const { show_liq_fullness, liq_messages } = belly;

  return (
    <Section
      title="Liquid Messages"
      buttons={
        <Button
          onClick={() =>
            act('liq_set_messages', { liq_messages: 'b_show_liq_fullness' })
          }
          icon={show_liq_fullness ? 'toggle-on' : 'toggle-off'}
          selected={show_liq_fullness}
          tooltipPosition="left"
          tooltip={
            'These are the settings for belly visibility when involving liquids fullness.'
          }
          content={show_liq_fullness ? 'Messages On' : 'Messages Off'}
        />
      }
    >
      {show_liq_fullness ? (
        <LabeledList>
          <LabeledList.Item label="0 to 20%">
            <Button
              onClick={() =>
                act('liq_set_messages', { liq_messages: 'b_liq_msg_toggle1' })
              }
              icon={liq_messages.liq_msg_toggle1 ? 'toggle-on' : 'toggle-off'}
              selected={liq_messages.liq_msg_toggle1}
              content={liq_messages.liq_msg_toggle1 ? 'On' : 'Off'}
            />
            <Button
              onClick={() =>
                act('liq_set_messages', { liq_messages: 'b_liq_msg1' })
              }
              content="Examine Message (0 to 20%)"
            />
          </LabeledList.Item>
          <LabeledList.Item label="20 to 40%">
            <Button
              onClick={() =>
                act('liq_set_messages', { liq_messages: 'b_liq_msg_toggle2' })
              }
              icon={liq_messages.liq_msg_toggle2 ? 'toggle-on' : 'toggle-off'}
              selected={liq_messages.liq_msg_toggle2}
              content={liq_messages.liq_msg_toggle2 ? 'On' : 'Off'}
            />
            <Button
              onClick={() =>
                act('liq_set_messages', { liq_messages: 'b_liq_msg2' })
              }
              content="Examine Message (20 to 40%)"
            />
          </LabeledList.Item>
          <LabeledList.Item label="40 to 60%">
            <Button
              onClick={() =>
                act('liq_set_messages', { liq_messages: 'b_liq_msg_toggle3' })
              }
              icon={liq_messages.liq_msg_toggle3 ? 'toggle-on' : 'toggle-off'}
              selected={liq_messages.liq_msg_toggle3}
              content={liq_messages.liq_msg_toggle3 ? 'On' : 'Off'}
            />
            <Button
              onClick={() =>
                act('liq_set_messages', { liq_messages: 'b_liq_msg3' })
              }
              content="Examine Message (40 to 60%)"
            />
          </LabeledList.Item>
          <LabeledList.Item label="60 to 80%">
            <Button
              onClick={() =>
                act('liq_set_messages', { liq_messages: 'b_liq_msg_toggle4' })
              }
              icon={liq_messages.liq_msg_toggle4 ? 'toggle-on' : 'toggle-off'}
              selected={liq_messages.liq_msg_toggle4}
              content={liq_messages.liq_msg_toggle4 ? 'On' : 'Off'}
            />
            <Button
              onClick={() =>
                act('liq_set_messages', { liq_messages: 'b_liq_msg4' })
              }
              content="Examine Message (60 to 80%)"
            />
          </LabeledList.Item>
          <LabeledList.Item label="80 to 100%">
            <Button
              onClick={() =>
                act('liq_set_messages', { liq_messages: 'b_liq_msg_toggle5' })
              }
              icon={liq_messages.liq_msg_toggle5 ? 'toggle-on' : 'toggle-off'}
              selected={liq_messages.liq_msg_toggle5}
              content={liq_messages.liq_msg_toggle5 ? 'On' : 'Off'}
            />
            <Button
              onClick={() =>
                act('liq_set_messages', { liq_messages: 'b_liq_msg5' })
              }
              content="Examine Message (80 to 100%)"
            />
          </LabeledList.Item>
        </LabeledList>
      ) : (
        'These options only display while liquid examination settings are turned on.'
      )}
    </Section>
  );
};
