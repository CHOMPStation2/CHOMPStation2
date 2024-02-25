import { classes } from 'common/react';

import { useBackend } from '../../../backend';
import { Box, Button, Flex, LabeledList, Section } from '../../../components';
import { FeatureColorInput } from './FeatureColorInput';

export const VoreSelectedBellyVisuals = (props) => {
  const { act } = useBackend();

  const { belly } = props;
  const {
    belly_fullscreen,
    belly_fullscreen_color,
    belly_fullscreen_color2,
    belly_fullscreen_color3,
    belly_fullscreen_color4,
    colorization_enabled,
    possible_fullscreens,
    disable_hud,
    vore_sprite_flags,
    affects_voresprite,
    absorbed_voresprite,
    absorbed_multiplier,
    liquid_voresprite,
    liquid_multiplier,
    item_voresprite,
    item_multiplier,
    health_voresprite,
    resist_animation,
    voresprite_size_factor,
    belly_sprite_option_shown,
    belly_sprite_to_affect,
    undergarment_chosen,
    undergarment_if_none,
    undergarment_color,
    tail_option_shown,
    tail_to_change_to,
  } = belly;

  return (
    <>
      <Section title="Vore Sprites">
        <Flex direction="row">
          <LabeledList>
            <LabeledList.Item label="Affect Vore Sprites">
              <Button
                onClick={() =>
                  act('set_attribute', { attribute: 'b_affects_vore_sprites' })
                }
                icon={affects_voresprite ? 'toggle-on' : 'toggle-off'}
                selected={affects_voresprite}
                content={affects_voresprite ? 'Yes' : 'No'}
              />
            </LabeledList.Item>
            {affects_voresprite ? (
              <span>
                <LabeledList.Item label="Vore Sprite Mode">
                  {(vore_sprite_flags.length && vore_sprite_flags.join(', ')) ||
                    'None'}
                  <Button
                    onClick={() =>
                      act('set_attribute', { attribute: 'b_vore_sprite_flags' })
                    }
                    ml={1}
                    icon="plus"
                  />
                </LabeledList.Item>
                <LabeledList.Item label="Count Absorbed prey for vore sprites">
                  <Button
                    onClick={() =>
                      act('set_attribute', {
                        attribute: 'b_count_absorbed_prey_for_sprites',
                      })
                    }
                    icon={absorbed_voresprite ? 'toggle-on' : 'toggle-off'}
                    selected={absorbed_voresprite}
                    content={absorbed_voresprite ? 'Yes' : 'No'}
                  />
                </LabeledList.Item>
                <LabeledList.Item label="Absorbed Multiplier">
                  <Button
                    onClick={() =>
                      act('set_attribute', {
                        attribute: 'b_absorbed_multiplier',
                      })
                    }
                    content={absorbed_multiplier}
                  />
                </LabeledList.Item>
                <LabeledList.Item label="Count liquid reagents for vore sprites">
                  <Button
                    onClick={() =>
                      act('set_attribute', {
                        attribute: 'b_count_liquid_for_sprites',
                      })
                    }
                    icon={liquid_voresprite ? 'toggle-on' : 'toggle-off'}
                    selected={liquid_voresprite}
                    content={liquid_voresprite ? 'Yes' : 'No'}
                  />
                </LabeledList.Item>
                <LabeledList.Item label="Liquid Multiplier">
                  <Button
                    onClick={() =>
                      act('set_attribute', { attribute: 'b_liquid_multiplier' })
                    }
                    content={liquid_multiplier}
                  />
                </LabeledList.Item>
                <LabeledList.Item label="Count items for vore sprites">
                  <Button
                    onClick={() =>
                      act('set_attribute', {
                        attribute: 'b_count_items_for_sprites',
                      })
                    }
                    icon={item_voresprite ? 'toggle-on' : 'toggle-off'}
                    selected={item_voresprite}
                    content={item_voresprite ? 'Yes' : 'No'}
                  />
                </LabeledList.Item>
                <LabeledList.Item label="Items Multiplier">
                  <Button
                    onClick={() =>
                      act('set_attribute', { attribute: 'b_item_multiplier' })
                    }
                    content={item_multiplier}
                  />
                </LabeledList.Item>
                <LabeledList.Item label="Prey health affects vore sprites">
                  <Button
                    onClick={() =>
                      act('set_attribute', {
                        attribute: 'b_health_impacts_size',
                      })
                    }
                    icon={health_voresprite ? 'toggle-on' : 'toggle-off'}
                    selected={health_voresprite}
                    content={health_voresprite ? 'Yes' : 'No'}
                  />
                </LabeledList.Item>
                <LabeledList.Item label="Animation when prey resist">
                  <Button
                    onClick={() =>
                      act('set_attribute', { attribute: 'b_resist_animation' })
                    }
                    icon={resist_animation ? 'toggle-on' : 'toggle-off'}
                    selected={resist_animation}
                    content={resist_animation ? 'Yes' : 'No'}
                  />
                </LabeledList.Item>
                <LabeledList.Item label="Vore Sprite Size Factor">
                  <Button
                    onClick={() =>
                      act('set_attribute', {
                        attribute: 'b_size_factor_sprites',
                      })
                    }
                    content={voresprite_size_factor}
                  />
                </LabeledList.Item>
                {belly_sprite_option_shown ? (
                  <LabeledList.Item label="Belly Sprite to affect">
                    <Button
                      onClick={() =>
                        act('set_attribute', {
                          attribute: 'b_belly_sprite_to_affect',
                        })
                      }
                      content={belly_sprite_to_affect}
                    />
                  </LabeledList.Item>
                ) : (
                  <LabeledList.Item label="Belly Sprite to affect">
                    <span style={{ color: 'red' }}>
                      You do not have any bellysprites.
                    </span>
                  </LabeledList.Item>
                )}
                {tail_option_shown &&
                vore_sprite_flags.includes('Undergarment addition') ? (
                  <div>
                    <LabeledList.Item label="Undergarment type to affect">
                      <Button
                        onClick={() =>
                          act('set_attribute', {
                            attribute: 'b_undergarment_choice',
                          })
                        }
                        content={undergarment_chosen}
                      />
                    </LabeledList.Item>
                    <LabeledList.Item label="Undergarment if none equipped">
                      <Button
                        onClick={() =>
                          act('set_attribute', {
                            attribute: 'b_undergarment_if_none',
                          })
                        }
                        content={undergarment_if_none}
                      />
                    </LabeledList.Item>
                    <FeatureColorInput
                      action_name="b_undergarment_color"
                      value_of={null}
                      back_color={undergarment_color}
                      name_of="Undergarment Color if none"
                    />
                  </div>
                ) : (
                  ''
                )}
                {tail_option_shown &&
                vore_sprite_flags.includes('Tail adjustment') ? (
                  <LabeledList.Item label="Tail to change to">
                    <Button
                      onClick={() =>
                        act('set_attribute', {
                          attribute: 'b_tail_to_change_to',
                        })
                      }
                      content={tail_to_change_to}
                    />
                  </LabeledList.Item>
                ) : (
                  ''
                )}
              </span>
            ) : (
              ''
            )}
          </LabeledList>
        </Flex>
      </Section>
      <Section title="Belly Fullscreens Preview and Coloring">
        <Flex direction="row">
          <FeatureColorInput
            action_name="b_fullscreen_color"
            value_of={null}
            back_color={belly_fullscreen_color}
            name_of="1"
          />
          <FeatureColorInput
            action_name="b_fullscreen_color2"
            value_of={null}
            back_color={belly_fullscreen_color2}
            name_of="2"
          />
          <FeatureColorInput
            action_name="b_fullscreen_color3"
            value_of={null}
            back_color={belly_fullscreen_color3}
            name_of="3"
          />
          <FeatureColorInput
            action_name="b_fullscreen_color4"
            value_of={null}
            back_color={belly_fullscreen_color4}
            name_of="4"
          />
          <FeatureColorInput
            action_name="b_fullscreen_alpha"
            value_of={null}
            back_color="#FFFFFF"
            name_of="Alpha"
          />
        </Flex>
        <LabeledList.Item label="Enable Coloration">
          <Button
            onClick={() =>
              act('set_attribute', { attribute: 'b_colorization_enabled' })
            }
            icon={colorization_enabled ? 'toggle-on' : 'toggle-off'}
            selected={colorization_enabled}
            content={colorization_enabled ? 'Yes' : 'No'}
          />
        </LabeledList.Item>
        <LabeledList.Item label="Preview Belly">
          <Button
            onClick={() =>
              act('set_attribute', { attribute: 'b_preview_belly' })
            }
            content={'Preview'}
          />
        </LabeledList.Item>
        <LabeledList.Item label="Clear Preview">
          <Button
            onClick={() =>
              act('set_attribute', { attribute: 'b_clear_preview' })
            }
            content={'Clear'}
          />
        </LabeledList.Item>
      </Section>
      <Section>
        <Section title="Vore FX">
          <LabeledList>
            <LabeledList.Item label="Disable Prey HUD">
              <Button
                onClick={() =>
                  act('set_attribute', { attribute: 'b_disable_hud' })
                }
                icon={disable_hud ? 'toggle-on' : 'toggle-off'}
                selected={disable_hud}
                content={disable_hud ? 'Yes' : 'No'}
              />
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section title="Belly Fullscreens Styles" width="800px">
          Belly styles:
          <Button
            fluid
            selected={belly_fullscreen === '' || belly_fullscreen === null}
            onClick={() =>
              act('set_attribute', { attribute: 'b_fullscreen', val: null })
            }
          >
            Disabled
          </Button>
          {Object.keys(possible_fullscreens).map((key, index) => (
            <span key={index} style={{ width: '256px' }}>
              <Button
                key={key}
                width="256px"
                height="256px"
                selected={key === belly_fullscreen}
                onClick={() =>
                  act('set_attribute', { attribute: 'b_fullscreen', val: key })
                }
              >
                <Box
                  className={classes(['vore240x240', key])}
                  style={{
                    transform: 'translate(0%, 4%)',
                  }}
                />
              </Button>
            </span>
          ))}
        </Section>
      </Section>
    </>
  );
};
