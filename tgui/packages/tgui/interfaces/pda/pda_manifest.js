<<<<<<< HEAD
import { useBackend } from '../../backend';
import { Box } from '../../components';
=======
import { filter } from 'common/collections';
import { Fragment } from 'inferno';
import { useBackend, useLocalState } from "../../backend";
import { Box, Button, Flex, Icon, LabeledList, ProgressBar, Section } from "../../components";
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
import { CrewManifestContent } from '../CrewManifest';

export const pda_manifest = (props, context) => {
  const { act, data } = useBackend(context);

  return (
    <Box color="white">
      <CrewManifestContent />
    </Box>
  );
};
