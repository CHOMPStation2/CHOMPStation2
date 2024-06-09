import { useBackend } from '../../../backend';
import { Button, LabeledList } from '../../../components';

export const VoreSelectedBellyDescriptions = (props) => {
  const { act } = useBackend();

  const { belly } = props;
  const {
    verb,
    release_verb,
    desc,
    absorbed_desc,
    mode,
    message_mode,
    escapable,
    interacts,
    autotransfer_enabled,
    autotransfer,
    emote_active,
  } = belly;

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
      <LabeledList.Item label="Show All Messages">
        <Button
          onClick={() =>
            act('set_attribute', {
              attribute: 'b_message_mode',
            })
          }
          icon={message_mode ? 'toggle-on' : 'toggle-off'}
          selected={message_mode}
        >
          {message_mode ? 'True' : 'False'}
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
      {message_mode || escapable ? (
        <>
          <VoreSelectedBellyDescriptionsStruggle />
          <VoreSelectedBellyDescriptionsEscape
            message_mode={message_mode}
            interacts={interacts}
          />
        </>
      ) : (
        ''
      )}
      {message_mode ||
      !!interacts.transferlocation ||
      !!interacts.transferlocation_secondary ||
      (autotransfer_enabled &&
        (!!autotransfer.autotransferlocation ||
          !!autotransfer.autotransferlocation_secondary)) ? (
        <VoreSelectedBellyDescriptionsTransfer
          message_mode={message_mode}
          interacts={interacts}
          autotransfer={autotransfer}
        />
      ) : (
        ''
      )}
      {message_mode ||
      (escapable &&
        (interacts.digestchance > 0 || interacts.absorbchance > 0)) ? (
        <VoreSelectedBellyDescriptionsInteractionChance
          message_mode={message_mode}
          interacts={interacts}
        />
      ) : (
        ''
      )}
      {(message_mode ||
        mode === 'Digest' ||
        mode === 'Selective' ||
        mode === 'Absorb' ||
        mode === 'Unabsorb') && (
        <VoreSelectedBellyDescriptionsBellymode
          message_mode={message_mode}
          mode={mode}
        />
      )}
      {emote_active ? (
        <VoreSelectedBellyDescriptionsIdle
          message_mode={message_mode}
          mode={mode}
        />
      ) : (
        ''
      )}
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

const VoreSelectedBellyDescriptionsStruggle = (props) => {
  const { act } = useBackend();

  return (
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
  );
};

const VoreSelectedBellyDescriptionsEscape = (props) => {
  const { act } = useBackend();

  const { message_mode, interacts } = props;

  return (
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
      {(message_mode || interacts.escapechance > 0) && (
        <>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'escp',
              })
            }
          >
            Escape Message (to prey)
          </Button>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'esco',
              })
            }
          >
            Escape Message (to you)
          </Button>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'escout',
              })
            }
          >
            Escape Message (outside)
          </Button>
        </>
      )}
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
          act('set_attribute', {
            attribute: 'b_msgs',
            msgtype: 'esciout',
          })
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
      {(message_mode || interacts.escapechance_absorbed > 0) && (
        <>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'aescp',
              })
            }
          >
            Absorbed Escape Message (to prey)
          </Button>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'aesco',
              })
            }
          >
            Absorbed Escape Message (to you)
          </Button>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'aescout',
              })
            }
          >
            Absorbed Escape Message (outside)
          </Button>
        </>
      )}
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
  );
};

const VoreSelectedBellyDescriptionsTransfer = (props) => {
  const { act } = useBackend();

  const { message_mode, interacts, autotransfer } = props;

  return (
    <LabeledList.Item label="Transfer Messages">
      {(message_mode || !!interacts.transferlocation) && (
        <>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'trnspp',
              })
            }
          >
            Primary Transfer Message (to prey)
          </Button>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'trnspo',
              })
            }
          >
            Primary Transfer Message (to you)
          </Button>
        </>
      )}
      {(message_mode || !!interacts.transferlocation_secondary) && (
        <>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'trnssp',
              })
            }
          >
            Secondary Transfer Message (to prey)
          </Button>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'trnsso',
              })
            }
          >
            Secondary Transfer Message (to you)
          </Button>
        </>
      )}
      {(message_mode || !!autotransfer.autotransferlocation) && (
        <>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'atrnspp',
              })
            }
          >
            Primary Auto-Transfer Message (to prey)
          </Button>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'atrnspo',
              })
            }
          >
            Primary Auto-Transfer Message (to you)
          </Button>
        </>
      )}
      {(message_mode || !!autotransfer.autotransferlocation_secondary) && (
        <>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'atrnssp',
              })
            }
          >
            Secondary Auto-Transfer Message (to prey)
          </Button>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'atrnsso',
              })
            }
          >
            Secondary Auto-Transfer Message (to you)
          </Button>
        </>
      )}
    </LabeledList.Item>
  );
};

const VoreSelectedBellyDescriptionsInteractionChance = (props) => {
  const { act } = useBackend();

  const { message_mode, interacts } = props;

  return (
    <LabeledList.Item label="Interaction Chance Messages">
      {(message_mode || interacts.digestchance > 0) && (
        <>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'stmodp',
              })
            }
          >
            Interaction Chance Digest Message (to prey)
          </Button>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'stmodo',
              })
            }
          >
            Interaction Chance Digest Message (to you)
          </Button>
        </>
      )}
      {(message_mode || interacts.absorbchance > 0) && (
        <>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'stmoap',
              })
            }
          >
            Interaction Chance Absorb Message (to prey)
          </Button>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'stmoao',
              })
            }
          >
            Interaction Chance Absorb Message (to you)
          </Button>
        </>
      )}
    </LabeledList.Item>
  );
};

const VoreSelectedBellyDescriptionsBellymode = (props) => {
  const { act } = useBackend();

  const { message_mode, mode } = props;

  return (
    <LabeledList.Item label="Bellymode Messages">
      {(message_mode || mode === 'Digest' || mode === 'Selective') && (
        <>
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
        </>
      )}
      {(message_mode || mode === 'Absorb' || mode === 'Selective') && (
        <>
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
        </>
      )}
      {(message_mode || mode === 'Unabsorb') && (
        <>
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
        </>
      )}
    </LabeledList.Item>
  );
};

const VoreSelectedBellyDescriptionsIdle = (props) => {
  const { act } = useBackend();

  const { message_mode, mode } = props;

  return (
    <LabeledList.Item label="Idle Messages">
      {(message_mode || mode === 'Hold' || mode === 'Selective') && (
        <>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'im_hold',
              })
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
        </>
      )}
      {(message_mode || mode === 'Digest' || mode === 'Selective') && (
        <Button
          onClick={() =>
            act('set_attribute', {
              attribute: 'b_msgs',
              msgtype: 'im_digest',
            })
          }
        >
          Idle Messages (Digest)
        </Button>
      )}
      {(message_mode || mode === 'Absorb' || mode === 'Selective') && (
        <Button
          onClick={() =>
            act('set_attribute', {
              attribute: 'b_msgs',
              msgtype: 'im_absorb',
            })
          }
        >
          Idle Messages (Absorb)
        </Button>
      )}
      {(message_mode || mode === 'Unabsorb') && (
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
      )}
      {(message_mode || mode === 'Drain' || mode === 'Selective') && (
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_drain' })
          }
        >
          Idle Messages (Drain)
        </Button>
      )}
      {(message_mode || mode === 'Heal') && (
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_heal' })
          }
        >
          Idle Messages (Heal)
        </Button>
      )}
      {(message_mode || mode === 'Size Steal') && (
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_steal' })
          }
        >
          Idle Messages (Size Steal)
        </Button>
      )}
      {(message_mode || mode === 'Shrink') && (
        <Button
          onClick={() =>
            act('set_attribute', {
              attribute: 'b_msgs',
              msgtype: 'im_shrink',
            })
          }
        >
          Idle Messages (Shrink)
        </Button>
      )}
      {(message_mode || mode === 'Grow') && (
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_grow' })
          }
        >
          Idle Messages (Grow)
        </Button>
      )}
      {(message_mode || mode === 'Encase In Egg') && (
        <Button
          onClick={() =>
            act('set_attribute', { attribute: 'b_msgs', msgtype: 'im_egg' })
          }
        >
          Idle Messages (Encase In Egg)
        </Button>
      )}
    </LabeledList.Item>
  );
};
