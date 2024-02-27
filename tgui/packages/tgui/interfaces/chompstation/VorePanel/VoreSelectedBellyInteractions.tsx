import { useBackend } from '../../../backend';
import { Button, LabeledList, Section } from '../../../components';

export const VoreSelectedBellyInteractions = (props) => {
  const { act } = useBackend();

  const { belly } = props;
  const { escapable, interacts, autotransfer_enabled, autotransfer } = belly;

  return (
    <Section
      title="Belly Interactions"
      buttons={
        <Button
          onClick={() => act('set_attribute', { attribute: 'b_escapable' })}
          icon={escapable ? 'toggle-on' : 'toggle-off'}
          selected={escapable}
          content={escapable ? 'Interactions On' : 'Interactions Off'}
        />
      }
    >
      {escapable ? (
        <LabeledList>
          <LabeledList.Item label="Escape Chance">
            <Button
              content={interacts.escapechance + '%'}
              onClick={() =>
                act('set_attribute', { attribute: 'b_escapechance' })
              }
            />
          </LabeledList.Item>
          <LabeledList.Item label="Absorbed Escape Chance">
            <Button
              content={interacts.escapechance_absorbed + '%'}
              onClick={() =>
                act('set_attribute', { attribute: 'b_escapechance_absorbed' })
              }
            />
          </LabeledList.Item>
          <LabeledList.Item label="Escape Time">
            <Button
              content={interacts.escapetime / 10 + 's'}
              onClick={() =>
                act('set_attribute', { attribute: 'b_escapetime' })
              }
            />
          </LabeledList.Item>
          <LabeledList.Divider />
          <LabeledList.Item label="Transfer Chance">
            <Button
              content={interacts.transferchance + '%'}
              onClick={() =>
                act('set_attribute', { attribute: 'b_transferchance' })
              }
            />
          </LabeledList.Item>
          <LabeledList.Item label="Transfer Location">
            <Button
              content={
                interacts.transferlocation
                  ? interacts.transferlocation
                  : 'Disabled'
              }
              onClick={() =>
                act('set_attribute', { attribute: 'b_transferlocation' })
              }
            />
          </LabeledList.Item>
          <LabeledList.Divider />
          <LabeledList.Item label="Secondary Transfer Chance">
            <Button
              content={interacts.transferchance_secondary + '%'}
              onClick={() =>
                act('set_attribute', {
                  attribute: 'b_transferchance_secondary',
                })
              }
            />
          </LabeledList.Item>
          <LabeledList.Item label="Secondary Transfer Location">
            <Button
              content={
                interacts.transferlocation_secondary
                  ? interacts.transferlocation_secondary
                  : 'Disabled'
              }
              onClick={() =>
                act('set_attribute', {
                  attribute: 'b_transferlocation_secondary',
                })
              }
            />
          </LabeledList.Item>
          <LabeledList.Divider />
          <LabeledList.Item label="Absorb Chance">
            <Button
              content={interacts.absorbchance + '%'}
              onClick={() =>
                act('set_attribute', { attribute: 'b_absorbchance' })
              }
            />
          </LabeledList.Item>
          <LabeledList.Item label="Digest Chance">
            <Button
              content={interacts.digestchance + '%'}
              onClick={() =>
                act('set_attribute', { attribute: 'b_digestchance' })
              }
            />
          </LabeledList.Item>
          <LabeledList.Divider />
        </LabeledList>
      ) : (
        'These options only display while interactions are turned on.'
      )}
      <Section
        title="Auto-Transfer Options"
        buttons={
          <Button
            onClick={() =>
              act('set_attribute', { attribute: 'b_autotransfer_enabled' })
            }
            icon={autotransfer_enabled ? 'toggle-on' : 'toggle-off'}
            selected={autotransfer_enabled}
            content={
              autotransfer_enabled
                ? 'Auto-Transfer Enabled'
                : 'Auto-Transfer Disabled'
            }
          />
        }
      >
        {autotransfer_enabled ? (
          <LabeledList>
            <LabeledList.Item label="Auto-Transfer Time">
              <Button
                content={autotransfer.autotransferwait / 10 + 's'}
                onClick={() =>
                  act('set_attribute', { attribute: 'b_autotransferwait' })
                }
              />
            </LabeledList.Item>
            <LabeledList.Item label="Auto-Transfer Min Amount">
              <Button
                content={autotransfer.autotransfer_min_amount}
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_autotransfer_min_amount',
                  })
                }
              />
            </LabeledList.Item>
            <LabeledList.Item label="Auto-Transfer Max Amount">
              <Button
                content={autotransfer.autotransfer_max_amount}
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_autotransfer_max_amount',
                  })
                }
              />
            </LabeledList.Item>
            <LabeledList.Divider />
            <LabeledList.Item label="Auto-Transfer Primary Chance">
              <Button
                content={autotransfer.autotransferchance + '%'}
                onClick={() =>
                  act('set_attribute', { attribute: 'b_autotransferchance' })
                }
              />
            </LabeledList.Item>
            <LabeledList.Item label="Auto-Transfer Primary Location">
              <Button
                content={
                  autotransfer.autotransferlocation
                    ? autotransfer.autotransferlocation
                    : 'Disabled'
                }
                onClick={() =>
                  act('set_attribute', { attribute: 'b_autotransferlocation' })
                }
              />
            </LabeledList.Item>
            <LabeledList.Item label="Auto-Transfer Primary Whitelist (Mobs)">
              {(autotransfer.autotransfer_whitelist.length &&
                autotransfer.autotransfer_whitelist.join(', ')) ||
                'Everything'}
              <Button
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_autotransfer_whitelist',
                  })
                }
                ml={1}
                icon="plus"
              />
            </LabeledList.Item>
            <LabeledList.Item label="Auto-Transfer Primary Whitelist (Items)">
              {(autotransfer.autotransfer_whitelist_items.length &&
                autotransfer.autotransfer_whitelist_items.join(', ')) ||
                'Everything'}
              <Button
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_autotransfer_whitelist_items',
                  })
                }
                ml={1}
                icon="plus"
              />
            </LabeledList.Item>
            <LabeledList.Item label="Auto-Transfer Primary Blacklist (Mobs)">
              {(autotransfer.autotransfer_blacklist.length &&
                autotransfer.autotransfer_blacklist.join(', ')) ||
                'Nothing'}
              <Button
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_autotransfer_blacklist',
                  })
                }
                ml={1}
                icon="plus"
              />
            </LabeledList.Item>
            <LabeledList.Item label="Auto-Transfer Primary Blacklist (Items)">
              {(autotransfer.autotransfer_blacklist_items.length &&
                autotransfer.autotransfer_blacklist_items.join(', ')) ||
                'Nothing'}
              <Button
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_autotransfer_blacklist_items',
                  })
                }
                ml={1}
                icon="plus"
              />
            </LabeledList.Item>
            <LabeledList.Divider />
            <LabeledList.Item label="Auto-Transfer Secondary Chance">
              <Button
                content={autotransfer.autotransferchance_secondary + '%'}
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_autotransferchance_secondary',
                  })
                }
              />
            </LabeledList.Item>
            <LabeledList.Item label="Auto-Transfer Secondary Location">
              <Button
                content={
                  autotransfer.autotransferlocation_secondary
                    ? autotransfer.autotransferlocation_secondary
                    : 'Disabled'
                }
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_autotransferlocation_secondary',
                  })
                }
              />
            </LabeledList.Item>
            <LabeledList.Item label="Auto-Transfer Secondary Whitelist (Mobs)">
              {(autotransfer.autotransfer_secondary_whitelist.length &&
                autotransfer.autotransfer_secondary_whitelist.join(', ')) ||
                'Everything'}
              <Button
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_autotransfer_secondary_whitelist',
                  })
                }
                ml={1}
                icon="plus"
              />
            </LabeledList.Item>
            <LabeledList.Item label="Auto-Transfer Secondary Whitelist (Items)">
              {(autotransfer.autotransfer_secondary_whitelist_items.length &&
                autotransfer.autotransfer_secondary_whitelist_items.join(
                  ', ',
                )) ||
                'Everything'}
              <Button
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_autotransfer_secondary_whitelist_items',
                  })
                }
                ml={1}
                icon="plus"
              />
            </LabeledList.Item>
            <LabeledList.Item label="Auto-Transfer Secondary Blacklist (Mobs)">
              {(autotransfer.autotransfer_secondary_blacklist.length &&
                autotransfer.autotransfer_secondary_blacklist.join(', ')) ||
                'Nothing'}
              <Button
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_autotransfer_secondary_blacklist',
                  })
                }
                ml={1}
                icon="plus"
              />
            </LabeledList.Item>
            <LabeledList.Item label="Auto-Transfer Secondary Blacklist (Items)">
              {(autotransfer.autotransfer_secondary_blacklist_items.length &&
                autotransfer.autotransfer_secondary_blacklist_items.join(
                  ', ',
                )) ||
                'Nothing'}
              <Button
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_autotransfer_secondary_blacklist_items',
                  })
                }
                ml={1}
                icon="plus"
              />
            </LabeledList.Item>
          </LabeledList>
        ) : (
          'These options only display while Auto-Transfer is enabled.'
        )}
      </Section>
    </Section>
  );
};
