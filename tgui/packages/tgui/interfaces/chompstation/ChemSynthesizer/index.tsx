import { ComplexModal } from 'tgui/interfaces/common/ComplexModal';
import { Window } from 'tgui/layouts';
import { Stack } from 'tgui-core/components';

import { ChemSynthesizerChemicals } from './ChemSynthesizerChemicals';
import { ChemSynthesizerQueueRecipes } from './ChemSynthesizerQueueRecipes';
import { ChemSynthesizerSettings } from './ChemSynthesizerSettings';

export const ChemSynthesizer = (props) => {
  return (
    <Window width={1100} height={640}>
      <ComplexModal />
      <Window.Content>
        <Stack height="100%">
          <Stack.Item grow maxWidth="32%">
            <ChemSynthesizerQueueRecipes />
          </Stack.Item>
          <Stack.Item grow>
            <ChemSynthesizerChemicals />
          </Stack.Item>
          <Stack.Item grow maxWidth="32%">
            <ChemSynthesizerSettings />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
