import { Flex } from '../../../components';
import { Window } from '../../../layouts';
import { ComplexModal } from '../.././common/ComplexModal';
import { ChemSynthesizerChemicals } from './ChemSynthesizerChemicals';
import { ChemSynthesizerQueueRecipes } from './ChemSynthesizerQueueRecipes';
import { ChemSynthesizerSettings } from './ChemSynthesizerSettings';

export const ChemSynthesizer = (props) => {
  return (
    <Window width={1100} height={640}>
      <ComplexModal />
      <Window.Content>
        <Flex height="100%">
          <Flex.Item grow={1} maxWidth="33%">
            <ChemSynthesizerQueueRecipes />
          </Flex.Item>
          <Flex.Item grow={1}>
            <ChemSynthesizerChemicals />
          </Flex.Item>
          <Flex.Item grow={1} maxWidth="33%">
            <ChemSynthesizerSettings />
          </Flex.Item>
        </Flex>
      </Window.Content>
    </Window>
  );
};
