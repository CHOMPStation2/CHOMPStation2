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
        <Button onClick={() => act('set_attribute', { attribute: 'b_verb' })}>
          {verb}
        </Button>
      </LabeledList.Item>
      <LabeledList.Item label="Release Verb">
        <Button
          onClick={() => act('set_attribute', { attribute: 'b_release_verb' })}
        >
          {release_verb}
        </Button>
      </LabeledList.Item>
      <LabeledList.Item label="Examine Messages">
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'em' })
          }
        >
          Examine Message (when full)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'ema' })
          }
        >
          Examine Message (with absorbed victims)
        </Button>
      </LabeledList.Item>
      <LabeledList.Item label="Struggle Messages">
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'smo' })
          }
        >
          Struggle Message (outside)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'smi' })
          }
        >
          Struggle Message (inside)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'asmo' })
          }
        >
          Absorbed Struggle Message (outside)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'asmi' })
          }
        >
          Absorbed Struggle Message (inside)
        </Button>
      </LabeledList.Item>
      <LabeledList.Item label="Escape Messages">
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'escap' })
          }
        >
          Escape Attempt Message (to prey)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'escao' })
          }
        >
          Escape Attempt Message (to you)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'escp' })
          }
        >
          Escape Message (to prey)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'esco' })
          }
        >
          Escape Message (to you)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'escout' })
          }
        >
          Escape Message (outside)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'escip' })
          }
        >
          Escape Item Message (to prey)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'escio' })
          }
        >
          Escape Item Message (to you)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'esciout' })
          }
        >
          Escape Item Message (outside)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'escfp' })
          }
        >
          Escape Fail Message (to prey)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'escfo' })
          }
        >
          Escape Fail Message (to you)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'aescap' })
          }
        >
          Absorbed Escape Attempt Message (to prey)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'aescao' })
          }
        >
          Absorbed Escape Attempt Message (to you)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'aescp' })
          }
        >
          Absorbed Escape Message (to prey)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'aesco' })
          }
        >
          Absorbed Escape Message (to you)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'aescout' })
          }
        >
          Absorbed Escape Message (outside)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'aescfp' })
          }
        >
          Absorbed Escape Fail Message (to prey)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'aescfo' })
          }
        >
          Absorbed Escape Fail Message (to you)
        </Button>
      </LabeledList.Item>
      <LabeledList.Item label="Transfer Messages">
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'trnspp' })
          }
        >
          Primary Transfer Message (to prey)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'trnspo' })
          }
        >
          Primary Transfer Message (to you)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'trnssp' })
          }
        >
          Secondary Transfer Message (to prey)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'trnsso' })
          }
        >
          Secondary Transfer Message (to you)
        </Button>
      </LabeledList.Item>
      <LabeledList.Item label="Interaction Chance Messages">
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'stmodp' })
          }
        >
          Interaction Chance Digest Message (to prey)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'stmodo' })
          }
        >
          Interaction Chance Digest Message (to you)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'stmoap' })
          }
        >
          Interaction Chance Absorb Message (to prey)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'stmoao' })
          }
        >
          Interaction Chance Absorb Message (to you)
        </Button>
      </LabeledList.Item>
      <LabeledList.Item label="Bellymode Messages">
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'dmp' })
          }
        >
          Digest Message (to prey)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'dmo' })
          }
        >
          Digest Message (to you)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'amp' })
          }
        >
          Absorb Message (to prey)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'amo' })
          }
        >
          Absorb Message (to you)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'uamp' })
          }
        >
          Unabsorb Message (to prey)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'uamo' })
          }
        >
          Unabsorb Message (to you)
        </Button>
      </LabeledList.Item>
      <LabeledList.Item label="Idle Messages">
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_hold' })
          }
        >
          Idle Messages (Hold)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', {
              attribute: 'b_msgs',
              msgtype: 'im_holdabsorbed',
            })
          }
        >
          Idle Messages (Hold Absorbed)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_digest' })
          }
        >
          Idle Messages (Digest)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_absorb' })
          }
        >
          Idle Messages (Absorb)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', {
              attribute: 'b_msgs',
              msgtype: 'im_unabsorb',
            })
          }
        >
          Idle Messages (Unabsorb)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_drain' })
          }
        >
          Idle Messages (Drain)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_heal' })
          }
        >
          Idle Messages (Heal)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_steal' })
          }
        >
          Idle Messages (Size Steal)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_shrink' })
          }
        >
          Idle Messages (Shrink)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_grow' })
          }
        >
          Idle Messages (Grow)
        </Button>
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_egg' })
          }
        >
          Idle Messages (Encase In Egg)
        </Button>
      </LabeledList.Item>
      <LabeledList.Item label="Reset Messages">
        <Button
          color="red"
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'reset' })
          }
        >
          Reset Messages
        </Button>
      </LabeledList.Item>
    </LabeledList>
  );
};
