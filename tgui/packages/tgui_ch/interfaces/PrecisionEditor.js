import { useBackend } from '../backend';
import { Button, LabeledList, Section, ColorBox, NoticeBox, Box } from '../components';
import { Window } from '../layouts';

export const PrecisionEditor = (props, context) => {
  const { act, data } = useBackend(context);
  // Extract `health` and `color` variables from the `data` object.
  const { screenstate } = data;
  return (
    <Window resizable>
      <Window.Content scrollable>
        <Section title="Seed status">
          {screenstate === 'main' && <SeedStatus />}
          {screenstate === 'colors' && <ColorEditor />}
          {screenstate === 'reagents' && <BiochemEditor />}
        </Section>
      </Window.Content>
    </Window>
  );
};

const SeedStatus = (props, context) => {
  const { act, data } = useBackend(context);
  const { health, plantcolor, fruitcolor, chems, seedname } = data;

  return (
    <LabeledList>
      {chems ? (
        <>
          <LabeledList.Item label="Name">{seedname}</LabeledList.Item>
          {health < 100 ? (
            <LabeledList.Item label="Genetic Integrity">{100 - health + '%'}</LabeledList.Item>
          ) : (
            <LabeledList.Item label="Genetic Integrity">{'UNVIABLE'}</LabeledList.Item>
          )}

          <LabeledList.Item label="Plant Color">{plantcolor}</LabeledList.Item>
          <LabeledList.Item label="Fruit Color">{fruitcolor}</LabeledList.Item>
          <LabeledList.Divider size={2} />
          <LabeledList.Item label="Chems produced in fruit (click to splice out)">
            {chems.map((item) => (
              <Button
                fluid
                key={item.displayname}
                content={item.displayname}
                onClick={() => act('prune', { gene_name: item.name })}
              />
            ))}
          </LabeledList.Item>
          <Button content="Edit Colors" onClick={() => act('change_focus', { window: 'colors' })} />
          <Button content="Add Reagents" onClick={() => act('change_focus', { window: 'reagents' })} />
          <LabeledList.Divider size={2} />
          <Button content="Eject Seed" onClick={() => act('eject')} />
        </>
      ) : (
        <LabeledList.Item label="Waiting">{'There is currently no seed loaded.'}</LabeledList.Item>
      )}
    </LabeledList>
  );
};

const ColorEditor = (props, context) => {
  const { act, data } = useBackend(context);
  const { plantcolor, fruitcolor } = data;

  return (
    <LabeledList>
      <LabeledList.Item label="Plant Color">{plantcolor}</LabeledList.Item>
      <ColorBox color={plantcolor} />
      <LabeledList.Item label="Fruit Color">{fruitcolor}</LabeledList.Item>
      <ColorBox color={fruitcolor} />
      <Button content="Change plant color" onClick={() => act('change_color', { option: 0 })} />
      <Button content="Change fruit color" onClick={() => act('change_color', { option: 1 })} />
      <LabeledList.Divider size={2} />
      <Button content="Return" onClick={() => act('change_focus', { window: 'main' })} />
    </LabeledList>
  );
};

const BiochemEditor = (props, context) => {
  const { act, data } = useBackend(context);
  const { beakerchems, health } = data;

  return (
    <LabeledList>
      {health < 100 ? (
        <LabeledList.Item label="Genetic Integrity">{100 - health + '%'}</LabeledList.Item>
      ) : (
        <LabeledList.Item label="Genetic Integrity">{'UNVIABLE'}</LabeledList.Item>
      )}
      <NoticeBox info={1} width={19} height={9} ml={1}>
        {'Available chems to choose are based on the reagents stored in the beaker. '}
        {' A minimum of 100 units of reagent is required to generate a viable sequence. '}
        {'The chosen reagent will be consumed in the process.'}
        <Box bold={1} mt={1}>
          {'This process severely damages genetic integrity.'}
        </Box>
      </NoticeBox>
      <Box width={20} opacity={0.5} ml={1} mt={6} mb={2}>
        {'Plant will produce 1 additional unit for every 25 units beyond 100'}
        {' (modified by potency)'}
      </Box>
      {beakerchems ? (
        <>
          {health < 100 ? (
            <LabeledList.Item label="Available reagents">
              {beakerchems.map((item) => (
                <Button
                  key={item.displayname}
                  fluid
                  content={item.displayname}
                  onClick={() => act('add_chem', { target_chem: item.name })}
                />
              ))}
            </LabeledList.Item>
          ) : (
            <NoticeBox warning={1}>{'WARNING: Genetic integrity of seed is too poor to proceed.'}</NoticeBox>
          )}

          <Button content="Eject Beaker" onClick={() => act('eject_beaker')} />
        </>
      ) : (
        <LabeledList.Item label="Waiting">{'There is currently no beaker loaded.'}</LabeledList.Item>
      )}

      <Button content="Return" onClick={() => act('change_focus', { window: 'main' })} />
    </LabeledList>
  );
};
