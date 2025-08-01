import { useBackend } from 'tgui/backend';
import { Box, Button, Section, Table } from 'tgui-core/components';

type Data = { note: string; notename: string };

export const pda_notekeeper = (props) => {
  const { act, data } = useBackend<Data>();

  const { note, notename } = data;

  return (
    <Box>
      <Section>
        {/* Lets just be nice and lazy with this, multinote support!. */}
        <Table>
          <Table.Row header>
            <Table.Cell>
              <Button icon="sticky-note-o" onClick={() => act('Note1')}>
                Note A
              </Button>
            </Table.Cell>
            <Table.Cell>
              <Button icon="sticky-note-o" onClick={() => act('Note2')}>
                Note B
              </Button>
            </Table.Cell>
            <Table.Cell>
              <Button icon="sticky-note-o" onClick={() => act('Note3')}>
                Note C
              </Button>
            </Table.Cell>
            <Table.Cell>
              <Button icon="sticky-note-o" onClick={() => act('Note4')}>
                Note D
              </Button>
            </Table.Cell>
            <Table.Cell>
              <Button icon="sticky-note-o" onClick={() => act('Note5')}>
                Note E
              </Button>
            </Table.Cell>
            <Table.Cell>
              <Button icon="sticky-note-o" onClick={() => act('Note6')}>
                Note F
              </Button>
            </Table.Cell>
          </Table.Row>
          <Table.Row header>
            <Table.Cell>
              <Button icon="sticky-note-o" onClick={() => act('Note7')}>
                Note G
              </Button>
            </Table.Cell>
            <Table.Cell>
              <Button icon="sticky-note-o" onClick={() => act('Note8')}>
                Note H
              </Button>
            </Table.Cell>
            <Table.Cell>
              <Button icon="sticky-note-o" onClick={() => act('Note9')}>
                Note I
              </Button>
            </Table.Cell>
            <Table.Cell>
              <Button icon="sticky-note-o" onClick={() => act('Note10')}>
                Note J
              </Button>
            </Table.Cell>
            <Table.Cell>
              <Button icon="sticky-note-o" onClick={() => act('Note11')}>
                Note K
              </Button>
            </Table.Cell>
            <Table.Cell>
              <Button icon="sticky-note-o" onClick={() => act('Note12')}>
                Note L
              </Button>
            </Table.Cell>
          </Table.Row>
        </Table>
      </Section>
      <Section title={notename}>
        <Button icon="pen" onClick={() => act('Edit')}>
          Edit Note
        </Button>
        <Button icon="file-word" onClick={() => act('Titleset')}>
          Edit Title
        </Button>
        <Button icon="sticky-note-o" onClick={() => act('Print')}>
          Print Note
        </Button>
      </Section>
      <Section>
        {/** biome-ignore lint/security/noDangerouslySetInnerHtml: Markdown in PDA notes */}
        <div dangerouslySetInnerHTML={{ __html: note }} />
      </Section>
    </Box>
  );
};
