import { useBackend } from '../backend';
import { Box, Section, Table } from '../components';
import { Window } from '../layouts';
import { COLORS } from '../constants';
import { decodeHtmlEntities } from 'common/string';

/*
 * Shared by the following templates (and used individually too)
 * - Communicator.js
 * - IdentificationComputer.js
 * - pda/pda_manifest.js
 * In order to fuel this UI, you must use the following code in your ui_data (or static data, doesn't really matter)
 * ```dm
if(data_core)
    data_core.get_manifest_list()
data["manifest"] = PDA_Manifest
 * ```
 */

export const CrewManifest = () => {
  return (
    <Window width={400} height={600}>
      <Window.Content scrollable>
        <CrewManifestContent />
      </Window.Content>
    </Window>
  );
};

export const CrewManifestContent = (props, context) => {
  const {
    data: { manifest, positions },
  } = useBackend(context);

  return (
    <Section title="Crew Manifest" noTopPadding>
      {Object.entries(manifest).map(([dept, crew]) => (
        <Section
          key={dept}
          title={
            <Box
              backgroundColor={COLORS.manifest[dept.toLowerCase()]}
              m={-1}
              pt={1}
              pb={1}>
              <Box ml={1} textAlign="center" fontSize={1.4}>
                {dept}
              </Box>
            </Box>
          }>
          <Table>
            <Table.Row header color="white">
              <Table.Cell>Name</Table.Cell>
              <Table.Cell>Rank</Table.Cell>
              <Table.Cell>Active</Table.Cell>
            </Table.Row>
            {Object.entries(crew).map(([crewIndex, crewMember]) => (
              <Table.Row color="average" key={crewIndex}>
                <Table.Cell>{decodeHtmlEntities(crewMember.name)}</Table.Cell>
                <Table.Cell>{crewMember.rank}</Table.Cell>
                <Table.Cell>{crewMember.active}</Table.Cell>
              </Table.Row>
            ))}
          </Table>
        </Section>
      ))}
    </Section>
  );
};
