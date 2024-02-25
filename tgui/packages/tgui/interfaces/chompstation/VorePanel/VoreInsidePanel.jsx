import { useBackend } from '../../../backend';
import { Box, Collapsible, Section } from '../../../components';
import { digestModeToPreyMode, reagentToColor } from './constants';
import { digestModeToColor } from './constants';
import { VoreContentsPanel } from './VoreContentsPanel';

export const VoreInsidePanel = (props) => {
  const { act, data } = useBackend();

  const {
    absorbed,
    belly_name,
    belly_mode,
    desc,
    pred,
    contents,
    ref,
    liq_lvl,
    liq_reagent_type,
    liuq_name,
  } = data.inside;

  if (!belly_name) {
    return <Section title="Inside">You aren&apos;t inside anyone.</Section>;
  }

  return (
    <Section title="Inside">
      <Box color="green" inline>
        You are currently {absorbed ? 'absorbed into' : 'inside'}
      </Box>
      &nbsp;
      <Box color="yellow" inline>
        {pred}&apos;s
      </Box>
      &nbsp;
      <Box color="red" inline>
        {belly_name}
      </Box>
      {liq_lvl > 0 ? (
        <>
          ,&nbsp;
          <Box color="yellow" inline>
            bathing in a pool of
          </Box>
          &nbsp;
          <Box color={reagentToColor[liq_reagent_type]} inline>
            {liuq_name}
          </Box>
        </>
      ) : (
        ''
      )}
      &nbsp;
      <Box color="yellow" inline>
        and you are
      </Box>
      &nbsp;
      <Box color={digestModeToColor[belly_mode]} inline>
        {digestModeToPreyMode[belly_mode]}
      </Box>
      &nbsp;
      <Box color="label">{desc}</Box>
      {(contents.length && (
        <Collapsible title="Belly Contents">
          <VoreContentsPanel contents={contents} belly={ref} />
        </Collapsible>
      )) ||
        'There is nothing else around you.'}
    </Section>
  );
};
