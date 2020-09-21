import { useBackend } from '../backend';
import { Box, Button, Flex, LabeledList, ProgressBar, Section } from '../components';
import { Window } from '../layouts';

export const ArcadeBattle = (props, context) => {
  const { act, data } = useBackend(context);

<<<<<<< HEAD
  const { name, temp, enemyAction, enemyName, playerHP, playerMP, enemyHP, enemyMP, gameOver } = data;
=======
  const {
    name,
    temp,
    enemyAction,
    enemyName,
    playerHP,
    playerMP,
    enemyHP,
    enemyMP,
    gameOver,
  } = data;
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale

  return (
    <Window width={400} height={240} resizable>
      <Window.Content>
        <Section title={enemyName} textAlign="center">
          <Section color="label">
            <Box>{temp}</Box>
            <Box>{!gameOver && enemyAction}</Box>
          </Section>
          <Flex spacing={1}>
            <Flex.Item>
              <LabeledList>
                <LabeledList.Item label="Player Health">
                  <ProgressBar
                    value={playerHP}
                    minValue={0}
                    maxValue={30}
                    ranges={{
                      olive: [31, Infinity],
                      good: [20, 31],
                      average: [10, 20],
                      bad: [-Infinity, 10],
                    }}>
                    {playerHP}HP
                  </ProgressBar>
                </LabeledList.Item>
                <LabeledList.Item label="Player Magic">
                  <ProgressBar
                    value={playerMP}
                    minValue={0}
                    maxValue={10}
                    ranges={{
                      purple: [11, Infinity],
                      violet: [3, 11],
                      bad: [-Infinity, 3],
                    }}>
                    {playerMP}MP
                  </ProgressBar>
                </LabeledList.Item>
              </LabeledList>
            </Flex.Item>
            <Flex.Item>
              <LabeledList>
                <LabeledList.Item label="Enemy HP">
                  <ProgressBar
                    value={enemyHP}
                    minValue={0}
                    maxValue={45}
                    ranges={{
                      olive: [31, Infinity],
                      good: [20, 31],
                      average: [10, 20],
                      bad: [-Infinity, 10],
                    }}>
                    {enemyHP}HP
                  </ProgressBar>
                </LabeledList.Item>
              </LabeledList>
            </Flex.Item>
          </Flex>
<<<<<<< HEAD
          {(gameOver && <Button fluid mt={1} color="green" content="New Game" onClick={() => act('newgame')} />) || (
=======
          {gameOver && (
            <Button
              fluid
              mt={1}
              color="green"
              content="New Game"
              onClick={() => act("newgame")} />
          ) || (
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
            <Flex mt={2} justify="space-between" spacing={1}>
              <Flex.Item grow={1}>
                <Button
                  fluid
                  icon="fist-raised"
                  tooltip="Go in for the kill!"
                  tooltipPosition="top"
                  onClick={() => act('attack')}
<<<<<<< HEAD
                  content="Attack!"
                />
=======
                  content="Attack!" />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
              </Flex.Item>
              <Flex.Item grow={1}>
                <Button
                  fluid
                  icon="band-aid"
                  tooltip="Heal yourself!"
                  tooltipPosition="top"
                  onClick={() => act('heal')}
<<<<<<< HEAD
                  content="Heal!"
                />
=======
                  content="Heal!" />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
              </Flex.Item>
              <Flex.Item grow={1}>
                <Button
                  fluid
                  icon="magic"
                  tooltip="Recharge your magic!"
                  tooltipPosition="top"
                  onClick={() => act('charge')}
<<<<<<< HEAD
                  content="Recharge!"
                />
=======
                  content="Recharge!" />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
              </Flex.Item>
            </Flex>
          )}
        </Section>
      </Window.Content>
    </Window>
  );
<<<<<<< HEAD
};
=======
};
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
