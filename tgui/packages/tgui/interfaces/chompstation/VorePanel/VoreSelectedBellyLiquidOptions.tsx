import { useBackend } from '../../../backend';
import { Button, LabeledList, Section } from '../../../components';
import { reagentToColor } from './constants';
import { LiquidColorInput } from './LiquidColorInput';

export const VoreSelectedBellyLiquidOptions = (props) => {
  const { act } = useBackend();

  const { belly } = props;
  const { show_liq, liq_interacts } = belly;

  return (
    <Section
      title="Liquid Options"
      buttons={
        <Button
          onClick={() =>
            act('liq_set_attribute', { liq_attribute: 'b_show_liq' })
          }
          icon={show_liq ? 'toggle-on' : 'toggle-off'}
          selected={show_liq}
          tooltipPosition="left"
          tooltip={
            'These are the settings for liquid bellies, every belly has a liquid storage.'
          }
          content={show_liq ? 'Liquids On' : 'Liquids Off'}
        />
      }
    >
      {show_liq ? (
        <LabeledList>
          <LabeledList.Item label="Generate Liquids">
            <Button
              onClick={() =>
                act('liq_set_attribute', { liq_attribute: 'b_liq_reagent_gen' })
              }
              icon={liq_interacts.liq_reagent_gen ? 'toggle-on' : 'toggle-off'}
              selected={liq_interacts.liq_reagent_gen}
              content={liq_interacts.liq_reagent_gen ? 'On' : 'Off'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Liquid Type">
            <Button
              onClick={() =>
                act('liq_set_attribute', {
                  liq_attribute: 'b_liq_reagent_type',
                })
              }
              icon="pen"
              color={reagentToColor[liq_interacts.liq_reagent_type]}
              content={liq_interacts.liq_reagent_type}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Liquid Name">
            <Button
              onClick={() =>
                act('liq_set_attribute', {
                  liq_attribute: 'b_liq_reagent_name',
                })
              }
              content={liq_interacts.liq_reagent_name}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Transfer Verb">
            <Button
              onClick={() =>
                act('liq_set_attribute', {
                  liq_attribute: 'b_liq_reagent_transfer_verb',
                })
              }
              content={liq_interacts.liq_reagent_transfer_verb}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Generation Time">
            <Button
              onClick={() =>
                act('liq_set_attribute', {
                  liq_attribute: 'b_liq_reagent_nutri_rate',
                })
              }
              icon="clock"
              content={
                ((liq_interacts.liq_reagent_nutri_rate + 1) * 10) / 60 +
                ' Hours'
              }
            />
          </LabeledList.Item>
          <LabeledList.Item label="Liquid Capacity">
            <Button
              onClick={() =>
                act('liq_set_attribute', {
                  liq_attribute: 'b_liq_reagent_capacity',
                })
              }
              content={liq_interacts.liq_reagent_capacity}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Slosh Sounds">
            <Button
              onClick={() =>
                act('liq_set_attribute', { liq_attribute: 'b_liq_sloshing' })
              }
              icon={liq_interacts.liq_sloshing ? 'toggle-on' : 'toggle-off'}
              selected={liq_interacts.liq_sloshing}
              content={liq_interacts.liq_sloshing ? 'On' : 'Off'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Liquid Addons">
            {(liq_interacts.liq_reagent_addons.length &&
              liq_interacts.liq_reagent_addons.join(', ')) ||
              'None'}
            <Button
              onClick={() =>
                act('liq_set_attribute', {
                  liq_attribute: 'b_liq_reagent_addons',
                })
              }
              ml={1}
              icon="plus"
            />
          </LabeledList.Item>
          <LabeledList.Item label="Liquid Application to Prey">
            <Button
              onClick={() =>
                act('liq_set_attribute', { liq_attribute: 'b_reagent_touches' })
              }
              icon={liq_interacts.reagent_touches ? 'toggle-on' : 'toggle-off'}
              selected={liq_interacts.reagent_touches}
              content={liq_interacts.reagent_touches ? 'On' : 'Off'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Custom Liquid Color">
            <LiquidColorInput
              action_name="b_custom_reagentcolor"
              value_of={null}
              back_color={liq_interacts.custom_reagentcolor}
              name_of="Custom Liquid Color"
            />
          </LabeledList.Item>
          <LabeledList.Item label="Liquid Overlay">
            <Button
              onClick={() =>
                act('liq_set_attribute', { liq_attribute: 'b_liquid_overlay' })
              }
              icon={liq_interacts.liquid_overlay ? 'toggle-on' : 'toggle-off'}
              selected={liq_interacts.liquid_overlay}
              content={liq_interacts.liquid_overlay ? 'On' : 'Off'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Max Liquid Level">
            <Button
              onClick={() =>
                act('liq_set_attribute', {
                  liq_attribute: 'b_max_liquid_level',
                })
              }
              content={liq_interacts.max_liquid_level + '%'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Custom Liquid Alpha">
            <Button
              onClick={() =>
                act('liq_set_attribute', {
                  liq_attribute: 'b_custom_reagentalpha',
                })
              }
              content={liq_interacts.custom_reagentalpha}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Fullness Overlay">
            <Button
              onClick={() =>
                act('liq_set_attribute', { liq_attribute: 'b_mush_overlay' })
              }
              icon={liq_interacts.mush_overlay ? 'toggle-on' : 'toggle-off'}
              selected={liq_interacts.mush_overlay}
              content={liq_interacts.mush_overlay ? 'On' : 'Off'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Mush Overlay Color">
            <LiquidColorInput
              action_name="b_mush_color"
              value_of={null}
              back_color={liq_interacts.mush_color}
              name_of="Custom Mush Color"
            />
          </LabeledList.Item>
          <LabeledList.Item label="Mush Overlay Alpha">
            <Button
              onClick={() =>
                act('liq_set_attribute', {
                  liq_attribute: 'b_mush_alpha',
                })
              }
              content={liq_interacts.mush_alpha}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Mush Overlay Scaling">
            <Button
              onClick={() =>
                act('liq_set_attribute', {
                  liq_attribute: 'b_max_mush',
                })
              }
              content={liq_interacts.max_mush}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Minimum Mush Level">
            <Button
              onClick={() =>
                act('liq_set_attribute', {
                  liq_attribute: 'b_min_mush',
                })
              }
              content={liq_interacts.min_mush + '%'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Item Mush Value">
            <Button
              onClick={() =>
                act('liq_set_attribute', {
                  liq_attribute: 'b_item_mush_val',
                })
              }
              content={liq_interacts.item_mush_val + ' fullness per item'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Metabolism Overlay">
            <Button
              onClick={() =>
                act('liq_set_attribute', {
                  liq_attribute: 'b_metabolism_overlay',
                })
              }
              icon={
                liq_interacts.metabolism_overlay ? 'toggle-on' : 'toggle-off'
              }
              selected={liq_interacts.metabolism_overlay}
              content={liq_interacts.metabolism_overlay ? 'On' : 'Off'}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Metabolism Mush Ratio">
            <Button
              onClick={() =>
                act('liq_set_attribute', {
                  liq_attribute: 'b_metabolism_mush_ratio',
                })
              }
              content={
                liq_interacts.metabolism_mush_ratio +
                ' fullness per reagent unit'
              }
            />
          </LabeledList.Item>
          <LabeledList.Item label="Metabolism Overlay Scaling">
            <Button
              onClick={() =>
                act('liq_set_attribute', {
                  liq_attribute: 'b_max_ingested',
                })
              }
              content={liq_interacts.max_ingested}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Custom Metabolism Color">
            <LiquidColorInput
              action_name="b_custom_ingested_color"
              value_of={null}
              back_color={liq_interacts.custom_ingested_color}
              name_of="Custom Metabolism Color"
            />
          </LabeledList.Item>
          <LabeledList.Item label="Metabolism Overlay Alpha">
            <Button
              onClick={() =>
                act('liq_set_attribute', {
                  liq_attribute: 'b_custom_ingested_alpha',
                })
              }
              content={liq_interacts.custom_ingested_alpha}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Purge Liquids">
            <Button
              color="red"
              onClick={() =>
                act('liq_set_attribute', { liq_attribute: 'b_liq_purge' })
              }
              content="Purge Liquids"
            />
          </LabeledList.Item>
        </LabeledList>
      ) : (
        'These options only display while liquid settings are turned on.'
      )}
    </Section>
  );
};
