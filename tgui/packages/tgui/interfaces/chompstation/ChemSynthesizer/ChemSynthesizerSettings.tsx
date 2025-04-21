import { useBackend } from 'tgui/backend';
import { modalOpen } from 'tgui/interfaces/common/ComplexModal';
import { Box, Button, LabeledList, Section, Stack } from 'tgui-core/components';
import { classes } from 'tgui-core/react';

import type { Data } from './types';

export const ChemSynthesizerSettings = (props) => {
  const { act, data } = useBackend<Data>();
  const {
    busy,
    production_mode,
    panel_open,
    rxn_vessel,
    drug_substance,
    bottle_icon,
    pill_icon,
    patch_icon,
  } = data;

  return (
    <Stack height="100%" width="100%" direction="column">
      <Stack.Item height={0} grow>
        <Section height="100%" title="Settings" overflowY="auto">
          <Stack direction="column">
            <Stack.Item
              style={{
                marginLeft: '0.5em', // Remove if tgui core implements gap
              }}
            >
              <Button
                color={production_mode ? 'green' : 'bad'}
                icon="wrench"
                onClick={() => act('mode_toggle')}
              >
                {production_mode
                  ? 'Recipe mode: Import'
                  : 'Recipe mode: Tutorial'}
              </Button>
            </Stack.Item>
            <Stack.Item>
              <Button
                disabled={!!busy}
                color={panel_open ? 'bad' : 'green'}
                icon="wrench"
                onClick={() => act('panel_toggle')}
              >
                {panel_open ? 'Panel Open' : 'Panel Closed'}
              </Button>
            </Stack.Item>
            <Stack.Item>
              {!busy && (
                <Button
                  disabled={!rxn_vessel.length}
                  color="bad"
                  icon="flask"
                  tooltip="For emptying the reaction vessel if the machine stalls."
                  onClick={() => act('bottle_product')}
                >
                  Bottle Manually
                </Button>
              )}
            </Stack.Item>
            <Stack.Item>
              <Button
                disabled={!busy}
                color="bad"
                icon="minus-circle"
                onClick={() => act('emergency_stop')}
              >
                EMERGENCY STOP
              </Button>
            </Stack.Item>
          </Stack>
        </Section>
      </Stack.Item>
      <Stack.Item height={0} grow>
        <Section height="100%" title="Drug Substance" overflowY="auto">
          <LabeledList>
            <LabeledList.Item label="Bottle">
              <Button
                icon="wine-bottle"
                selected={drug_substance === 1}
                mr="0.5rem"
                onClick={() => act('drug_form', { drug_index: 1 })}
              >
                Activate
              </Button>
              <Button onClick={() => modalOpen('change_bottle_style')}>
                <div
                  style={{
                    display: 'inline-block',
                    width: '16px',
                    height: '16px',
                    verticalAlign: 'middle',
                    backgroundSize: '200%',
                    backgroundPosition: 'left -10px bottom -6px',
                  }}
                >
                  <Box
                    className={classes([
                      'chem_master32x32',
                      'bottle-' + bottle_icon,
                    ])}
                    style={{
                      bottom: '10px',
                      right: '10px',
                      position: 'relative',
                    }}
                  />
                </div>
                Style
              </Button>
            </LabeledList.Item>
            <LabeledList.Item label="Pill">
              <Button
                icon="circle"
                selected={drug_substance === 2}
                mr="0.5rem"
                onClick={() => act('drug_form', { drug_index: 2 })}
              >
                Activate
              </Button>
              <Button onClick={() => modalOpen('change_pill_style')}>
                <div
                  style={{
                    display: 'inline-block',
                    width: '16px',
                    height: '16px',
                    verticalAlign: 'middle',
                    backgroundSize: '200%',
                    backgroundPosition: 'left -10px bottom -6px',
                  }}
                >
                  <Box
                    className={classes([
                      'chem_master32x32',
                      'pill' + pill_icon,
                    ])}
                    style={{
                      bottom: '10px',
                      right: '10px',
                      position: 'relative',
                    }}
                  />
                </div>
                Style
              </Button>
            </LabeledList.Item>
            <LabeledList.Item label="Patch">
              <Button
                icon="square"
                selected={drug_substance === 3}
                mr="0.5rem"
                onClick={() => act('drug_form', { drug_index: 3 })}
              >
                Activate
              </Button>
              <Button onClick={() => modalOpen('change_patch_style')}>
                <div
                  style={{
                    display: 'inline-block',
                    width: '16px',
                    height: '16px',
                    verticalAlign: 'middle',
                    backgroundSize: '200%',
                    backgroundPosition: 'left -10px bottom -6px',
                  }}
                >
                  <Box
                    className={classes([
                      'chem_master32x32',
                      'patch' + patch_icon,
                    ])}
                    style={{
                      bottom: '10px',
                      right: '10px',
                      position: 'relative',
                    }}
                  />
                </div>
                Style
              </Button>
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Stack.Item>
    </Stack>
  );
};
