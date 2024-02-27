import { useBackend } from '../../../backend';
import { Button, LabeledList } from '../../../components';

export const VoreSelectedBellyDescriptions = (props) => {
  const { act } = useBackend();

  const { belly } = props;
  const { verb, release_verb, desc, absorbed_desc } = belly;

  return (
    <LabeledList>
      <LabeledList.Item
        label="Description"
        buttons={
          <Button
            onClick={() => act('set_attribute', { attribute: 'b_desc' })}
            icon="pen"
          />
        }
      >
        {desc}
      </LabeledList.Item>
      <LabeledList.Item
        label="Description (Absorbed)"
        buttons={
          <Button
            onClick={() =>
              act('set_attribute', { attribute: 'b_absorbed_desc' })
            }
            icon="pen"
          />
        }
      >
        {absorbed_desc}
      </LabeledList.Item>
      <LabeledList.Item label="Vore Verb">
        <Button
          onClick={() => act('set_attribute', { attribute: 'b_verb' })}
          content={verb}
        />
      </LabeledList.Item>
      <LabeledList.Item label="Release Verb">
        <Button
          onClick={() => act('set_attribute', { attribute: 'b_release_verb' })}
          content={release_verb}
        />
      </LabeledList.Item>
      <LabeledList.Item label="Examine Messages">
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'em' })
          }
          content="Examine Message (when full)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'ema' })
          }
          content="Examine Message (with absorbed victims)"
        />
      </LabeledList.Item>
      <LabeledList.Item label="Struggle Messages">
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'smo' })
          }
          content="Struggle Message (outside)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'smi' })
          }
          content="Struggle Message (inside)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'asmo' })
          }
          content="Absorbed Struggle Message (outside)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'asmi' })
          }
          content="Absorbed Struggle Message (inside)"
        />
      </LabeledList.Item>
      <LabeledList.Item label="Escape Messages">
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'escap' })
          }
          content="Escape Attempt Message (to prey)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'escao' })
          }
          content="Escape Attempt Message (to you)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'escp' })
          }
          content="Escape Message (to prey)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'esco' })
          }
          content="Escape Message (to you)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'escout' })
          }
          content="Escape Message (outside)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'escip' })
          }
          content="Escape Item Message (to prey)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'escio' })
          }
          content="Escape Item Message (to you)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'esciout' })
          }
          content="Escape Item Message (outside)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'escfp' })
          }
          content="Escape Fail Message (to prey)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'escfo' })
          }
          content="Escape Fail Message (to you)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'aescap' })
          }
          content="Absorbed Escape Attempt Message (to prey)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'aescao' })
          }
          content="Absorbed Escape Attempt Message (to you)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'aescp' })
          }
          content="Absorbed Escape Message (to prey)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'aesco' })
          }
          content="Absorbed Escape Message (to you)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'aescout' })
          }
          content="Absorbed Escape Message (outside)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'aescfp' })
          }
          content="Absorbed Escape Fail Message (to prey)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'aescfo' })
          }
          content="Absorbed Escape Fail Message (to you)"
        />
      </LabeledList.Item>
      <LabeledList.Item label="Transfer Messages">
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'trnspp' })
          }
          content="Primary Transfer Message (to prey)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'trnspo' })
          }
          content="Primary Transfer Message (to you)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'trnssp' })
          }
          content="Secondary Transfer Message (to prey)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'trnsso' })
          }
          content="Secondary Transfer Message (to you)"
        />
      </LabeledList.Item>
      <LabeledList.Item label="Interaction Chance Messages">
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'stmodp' })
          }
          content="Interaction Chance Digest Message (to prey)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'stmodo' })
          }
          content="Interaction Chance Digest Message (to you)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'stmoap' })
          }
          content="Interaction Chance Absorb Message (to prey)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'stmoao' })
          }
          content="Interaction Chance Absorb Message (to you)"
        />
      </LabeledList.Item>
      <LabeledList.Item label="Bellymode Messages">
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'dmp' })
          }
          content="Digest Message (to prey)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'dmo' })
          }
          content="Digest Message (to you)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'amp' })
          }
          content="Absorb Message (to prey)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'amo' })
          }
          content="Absorb Message (to you)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'uamp' })
          }
          content="Unabsorb Message (to prey)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'uamo' })
          }
          content="Unabsorb Message (to you)"
        />
      </LabeledList.Item>
      <LabeledList.Item label="Idle Messages">
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_hold' })
          }
          content="Idle Messages (Hold)"
        />
        <Button
          onClick={() =>
            act('set_attribute', {
              attribute: 'b_msgs',
              msgtype: 'im_holdabsorbed',
            })
          }
          content="Idle Messages (Hold Absorbed)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_digest' })
          }
          content="Idle Messages (Digest)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_absorb' })
          }
          content="Idle Messages (Absorb)"
        />
        <Button
          onClick={() =>
            act('set_attribute', {
              attribute: 'b_msgs',
              msgtype: 'im_unabsorb',
            })
          }
          content="Idle Messages (Unabsorb)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_drain' })
          }
          content="Idle Messages (Drain)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_heal' })
          }
          content="Idle Messages (Heal)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_steal' })
          }
          content="Idle Messages (Size Steal)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_shrink' })
          }
          content="Idle Messages (Shrink)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_grow' })
          }
          content="Idle Messages (Grow)"
        />
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_egg' })
          }
          content="Idle Messages (Encase In Egg)"
        />
      </LabeledList.Item>
      <LabeledList.Item label="Reset Messages">
        <Button
          color="red"
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'reset' })
          }
          content="Reset Messages"
        />
      </LabeledList.Item>
    </LabeledList>
  );
};
