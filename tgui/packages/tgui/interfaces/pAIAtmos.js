import { filter } from 'common/collections';
<<<<<<< HEAD
import { decodeHtmlEntities } from 'common/string';
import { useBackend } from '../backend';
import { LabeledList, Section } from '../components';
import { Window } from '../layouts';

const getItemColor = (value, min2, min1, max1, max2) => {
  if (value < min2) {
    return 'bad';
  } else if (value < min1) {
    return 'average';
  } else if (value > max1) {
    return 'average';
  } else if (value > max2) {
    return 'bad';
  }
  return 'good';
=======
import { Fragment } from 'inferno';
import { decodeHtmlEntities, toTitleCase } from 'common/string';
import { useBackend } from "../backend";
import { AnimatedNumber, Box, Button, Divider, Flex, Icon, LabeledList, ProgressBar, Section } from "../components";
import { Window } from "../layouts";

const getItemColor = (value, min2, min1, max1, max2) => {
  if (value < min2) {
    return "bad";
  } else if (value < min1) {
    return "average";
  } else if (value > max1) {
    return "average";
  } else if (value > max2) {
    return "bad";
  }
  return "good";
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
};

export const pAIAtmos = (props, context) => {
  const { act, data } = useBackend(context);

<<<<<<< HEAD
  const { aircontents } = data;
=======
  const {
    aircontents,
  } = data;
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale

  return (
    <Window width={450} height={600} resizable>
      <Window.Content scrollable>
        <Section>
          <LabeledList>
<<<<<<< HEAD
            {filter((i) => i.val !== '0' || i.entry === 'Pressure' || i.entry === 'Temperature')(aircontents).map(
              (item) => (
=======
            {filter(
              i => (i.val !== "0") || i.entry === "Pressure" || i.entry === "Temperature"
            )(aircontents)
              .map(item => (
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
                <LabeledList.Item
                  key={item.entry}
                  label={item.entry}
                  color={getItemColor(item.val, item.bad_low, item.poor_low, item.poor_high, item.bad_high)}>
<<<<<<< HEAD
                  {item.val}
                  {decodeHtmlEntities(item.units)}
                </LabeledList.Item>
              )
            )}
=======
                  {item.val}{decodeHtmlEntities(item.units)}
                </LabeledList.Item>
              ))}
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
