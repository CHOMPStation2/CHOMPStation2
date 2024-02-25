import { capitalize } from 'common/string';

import { useBackend } from '../../../backend';
import { Button, Flex, LabeledList } from '../../../components';
import { VoreSelectedMobTypeBellyButtons } from './VoreSelectedMobTypeBellyButtons';

export const VoreSelectedBellyOptions = (props) => {
  const { act, data } = useBackend();

  const { belly } = props;
  const {
    can_taste,
    is_feedable,
    nutrition_percent,
    digest_brute,
    digest_burn,
    digest_oxy,
    digest_tox,
    digest_clone,
    bulge_size,
    display_absorbed_examine,
    shrink_grow_size,
    emote_time,
    emote_active,
    contaminates,
    contaminate_flavor,
    contaminate_color,
    egg_type,
    egg_name,
    recycling,
    storing_nutrition,
    entrance_logs,
    item_digest_logs,
    selective_preference,
    save_digest_mode,
    eating_privacy_local,
    vorespawn_blacklist,
    private_struggle,
  } = belly;

  return (
    <Flex wrap="wrap">
      <Flex.Item basis="49%" grow={1}>
        <LabeledList>
          <LabeledList.Item label="Can Taste">
            <Button
              onClick={() => act('set_attribute', { attribute: 'b_tastes' })}
              icon={can_taste ? 'toggle-on' : 'toggle-off'}
              selected={can_taste}
              content={can_taste ? 'Yes' : 'No'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Feedable">
            <Button
              onClick={() => act('set_attribute', { attribute: 'b_feedable' })}
              icon={is_feedable ? 'toggle-on' : 'toggle-off'}
              selected={is_feedable}
              content={is_feedable ? 'Yes' : 'No'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Contaminates">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_contaminates' })
              }
              icon={contaminates ? 'toggle-on' : 'toggle-off'}
              selected={contaminates}
              content={contaminates ? 'Yes' : 'No'}
            />
          </LabeledList.Item>
          {(contaminates && (
            <>
              <LabeledList.Item label="Contamination Flavor">
                <Button
                  onClick={() =>
                    act('set_attribute', {
                      attribute: 'b_contamination_flavor',
                    })
                  }
                  icon="pen"
                  content={contaminate_flavor}
                />
              </LabeledList.Item>
              <LabeledList.Item label="Contamination Color">
                <Button
                  onClick={() =>
                    act('set_attribute', { attribute: 'b_contamination_color' })
                  }
                  icon="pen"
                  content={capitalize(contaminate_color)}
                />
              </LabeledList.Item>
            </>
          )) ||
            null}
          <LabeledList.Item label="Nutritional Gain">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_nutritionpercent' })
              }
              content={nutrition_percent + '%'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Required Examine Size">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_bulge_size' })
              }
              content={bulge_size * 100 + '%'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Display Absorbed Examines">
            <Button
              onClick={() =>
                act('set_attribute', {
                  attribute: 'b_display_absorbed_examine',
                })
              }
              icon={display_absorbed_examine ? 'toggle-on' : 'toggle-off'}
              selected={display_absorbed_examine}
              content={display_absorbed_examine ? 'True' : 'False'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Toggle Vore Privacy">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_eating_privacy' })
              }
              content={capitalize(eating_privacy_local)}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Toggle Struggle Privacy">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_private_struggle' })
              }
              icon={private_struggle ? 'toggle-on' : 'toggle-off'}
              selected={private_struggle}
              content={private_struggle ? 'Private' : 'Loud'}
            />
          </LabeledList.Item>

          <LabeledList.Item label="Save Digest Mode">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_save_digest_mode' })
              }
              icon={save_digest_mode ? 'toggle-on' : 'toggle-off'}
              selected={save_digest_mode}
              content={save_digest_mode ? 'True' : 'False'}
            />
          </LabeledList.Item>
        </LabeledList>
        <VoreSelectedMobTypeBellyButtons belly={belly} />
      </Flex.Item>
      <Flex.Item basis="49%" grow={1}>
        <LabeledList>
          <LabeledList.Item label="Idle Emotes">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_emoteactive' })
              }
              icon={emote_active ? 'toggle-on' : 'toggle-off'}
              selected={emote_active}
              content={emote_active ? 'Active' : 'Inactive'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Idle Emote Delay">
            <Button
              onClick={() => act('set_attribute', { attribute: 'b_emotetime' })}
              content={emote_time + ' seconds'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Digest Brute Damage">
            <Button
              onClick={() => act('set_attribute', { attribute: 'b_brute_dmg' })}
              content={digest_brute}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Digest Burn Damage">
            <Button
              onClick={() => act('set_attribute', { attribute: 'b_burn_dmg' })}
              content={digest_burn}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Digest Suffocation Damage">
            <Button
              onClick={() => act('set_attribute', { attribute: 'b_oxy_dmg' })}
              content={digest_oxy}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Digest Toxins Damage">
            <Button
              onClick={() => act('set_attribute', { attribute: 'b_tox_dmg' })}
              content={digest_tox}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Digest Clone Damage">
            <Button
              onClick={() => act('set_attribute', { attribute: 'b_clone_dmg' })}
              content={digest_clone}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Shrink/Grow Size">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_grow_shrink' })
              }
              content={shrink_grow_size * 100 + '%'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Vore Spawn Blacklist">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_vorespawn_blacklist' })
              }
              icon={vorespawn_blacklist ? 'toggle-on' : 'toggle-off'}
              selected={vorespawn_blacklist}
              content={vorespawn_blacklist ? 'Yes' : 'No'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Egg Type">
            <Button
              onClick={() => act('set_attribute', { attribute: 'b_egg_type' })}
              icon="pen"
              content={capitalize(egg_type)}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Custom Egg Name">
            <Button
              onClick={() => act('set_attribute', { attribute: 'b_egg_name' })}
              icon="pen"
              content={egg_name ? egg_name : 'Default'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Recycling">
            <Button
              onClick={() => act('set_attribute', { attribute: 'b_recycling' })}
              icon={recycling ? 'toggle-on' : 'toggle-off'}
              selected={recycling}
              content={recycling ? 'Enabled' : 'Disabled'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Storing Nutrition">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_storing_nutrition' })
              }
              icon={storing_nutrition ? 'toggle-on' : 'toggle-off'}
              selected={storing_nutrition}
              content={storing_nutrition ? 'Storing' : 'Absorbing'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Entrance Logs">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_entrance_logs' })
              }
              icon={entrance_logs ? 'toggle-on' : 'toggle-off'}
              selected={entrance_logs}
              content={entrance_logs ? 'Enabled' : 'Disabled'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Item Digestion Logs">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_item_digest_logs' })
              }
              icon={item_digest_logs ? 'toggle-on' : 'toggle-off'}
              selected={item_digest_logs}
              content={item_digest_logs ? 'Enabled' : 'Disabled'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Selective Mode Preference">
            <Button
              onClick={() =>
                act('set_attribute', {
                  attribute: 'b_selective_mode_pref_toggle',
                })
              }
              content={capitalize(selective_preference)}
            />
          </LabeledList.Item>
        </LabeledList>
      </Flex.Item>
    </Flex>
  );
};
