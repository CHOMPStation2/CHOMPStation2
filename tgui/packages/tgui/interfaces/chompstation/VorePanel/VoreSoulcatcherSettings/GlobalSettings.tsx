import { BooleanLike } from 'common/react';

import { useBackend } from '../../../../backend';
import { Box, Button, LabeledList } from '../../../../components';

export const GlobalSettings = (props: {
  ext_hearing: BooleanLike;
  ext_vision: BooleanLike;
  mind_backups: BooleanLike;
  ar_projecting: BooleanLike;
  show_vore_sfx: BooleanLike;
}) => {
  const { act } = useBackend();

  const {
    ext_hearing,
    ext_vision,
    mind_backups,
    ar_projecting,
    show_vore_sfx,
  } = props;

  return (
    <LabeledList.Item label="Global Settings">
      <Box>
        <Button
          icon={ext_hearing ? 'ear-listen' : 'ear-deaf'}
          tooltip={
            (ext_hearing ? 'Allow' : 'Disallow') +
            ' your captured souls to hear.'
          }
          tooltipPosition="bottom"
          color={ext_hearing ? 'green' : 'red'}
          onClick={() => act('toggle_ext_hearing')}
        >
          Ext. Hearing
        </Button>
        <Button
          icon={ext_vision ? 'eye' : 'eye-slash'}
          tooltip={
            (ext_vision ? 'Allow' : 'Disallow') + ' your captured souls to see.'
          }
          tooltipPosition="bottom"
          color={ext_vision ? 'green' : 'red'}
          onClick={() => act('toggle_ext_vision')}
        >
          Ext. Vision
        </Button>
        <Button
          icon="database"
          tooltip={
            (mind_backups ? 'Allow' : 'Disallow') +
            ' your captured souls to have regular mind backups.'
          }
          tooltipPosition="bottom"
          color={mind_backups ? 'green' : 'red'}
          onClick={() => act('toggle_mind_backup')}
        >
          Mind Backups
        </Button>
        <Button
          icon="street-view"
          tooltip={
            (ar_projecting ? 'Allow' : 'Disallow') +
            ' your captured souls to AR project themselves.'
          }
          tooltipPosition="bottom"
          color={ar_projecting ? 'green' : 'red'}
          onClick={() => act('toggle_ar_projecting')}
        >
          AR Projecting
        </Button>
        <Button
          icon={show_vore_sfx ? 'circle-play' : 'circle-pause'}
          tooltip={
            (show_vore_sfx ? 'Show' : 'Hide') +
            ' the selected interior SFX to your captured souls.'
          }
          tooltipPosition="bottom"
          color={show_vore_sfx ? 'green' : 'red'}
          onClick={() => act('toggle_vore_sfx')}
        >
          Show SFX
        </Button>
      </Box>
    </LabeledList.Item>
  );
};
