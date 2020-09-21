<<<<<<< HEAD
import { useBackend } from '../backend';
import { AnimatedNumber, Box, Button, LabeledList, ProgressBar, Section } from '../components';
import { Window } from '../layouts';
=======
import { round } from 'common/math';
import { Fragment } from 'inferno';
import { useBackend } from "../backend";
import { AnimatedNumber, Box, Button, Divider, Flex, Icon, LabeledList, ProgressBar, Section } from "../components";
import { Window } from "../layouts";
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale

export const pAIDoorjack = (props, context) => {
  const { act, data } = useBackend(context);

<<<<<<< HEAD
  const { cable, machine, inprogress, progress_a, progress_b, aborted } = data;
=======
  const {
    cable,
    machine,
    inprogress,
    progress_a,
    progress_b,
    aborted,
  } = data;
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale

  return (
    <Window width={300} height={150} resizable>
      <Window.Content scrollable>
        <Section>
          <LabeledList>
            <LabeledList.Item label="Cable">
<<<<<<< HEAD
              {(machine && <Box color="good">Connected</Box>) || (cable && <Box color="average">Extended</Box>) || (
                <Box>
                  <Button icon="ethernet" content="Retracted" onClick={() => act('cable')} />
                </Box>
              )}
            </LabeledList.Item>
            {(!!machine && (
              <LabeledList.Item label="Hack">
                {(inprogress && (
=======
              {machine && (
                <Box color="good">
                  Connected
                </Box>
              ) || cable && (
                <Box color="average">
                  Extended
                </Box>
              ) || (
                <Box>
                  <Button
                    icon="ethernet"
                    content="Retracted"
                    onClick={() => act("cable")} />
                </Box>
              )}
            </LabeledList.Item>
            {!!machine && (
              <LabeledList.Item label="Hack">
                {inprogress && (
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
                  <Box>
                    <ProgressBar
                      value={progress_a}
                      maxValue={100}
                      ranges={{
                        good: [67, Infinity],
                        average: [33, 67],
                        bad: [-Infinity, 33],
                      }}>
                      <AnimatedNumber value={progress_a} />.<AnimatedNumber value={progress_b} />%
                    </ProgressBar>
<<<<<<< HEAD
                    <Button icon="ban" color="bad" onClick={() => act('cancel')} />
                  </Box>
                )) || <Button icon="virus" content="Start" onClick={() => act('jack')} />}
              </LabeledList.Item>
            )) ||
              (!!aborted && (
                <LabeledList.Item color="bad" mt={1}>
                  Hack aborted.
                </LabeledList.Item>
              ))}
=======
                    <Button
                      icon="ban"
                      color="bad"
                      onClick={() => act("cancel")} />
                  </Box>
                ) || (
                  <Button
                    icon="virus"
                    content="Start"
                    onClick={() => act("jack")} />
                )}
              </LabeledList.Item>
            ) || !!aborted && (
              <LabeledList.Item color="bad" mt={1}>
                Hack aborted.
              </LabeledList.Item>
            )}
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
<<<<<<< HEAD
};
=======
};
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
