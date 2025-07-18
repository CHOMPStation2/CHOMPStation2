import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import { Box, Button, Icon, LabeledList, Section } from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import { FullscreenNotice } from './common/FullscreenNotice';

type Data = {
  enabled: BooleanLike;
  dos_capacity: number;
  dos_overload: number;
  dos_crashed: BooleanLike;
};

export const NTNetRelay = (props) => {
  const { data } = useBackend<Data>();

  const { dos_crashed } = data;

  let body: React.JSX.Element = <NTNetRelayContent />;

  if (dos_crashed) {
    body = <NTNetRelayCrash />;
  }

  return (
    <Window width={dos_crashed ? 700 : 500} height={dos_crashed ? 600 : 300}>
      <Window.Content scrollable>{body}</Window.Content>
    </Window>
  );
};

const NTNetRelayContent = (props) => {
  const { act, data } = useBackend<Data>();

  const { enabled, dos_overload, dos_capacity } = data;

  return (
    <Section
      title="Status"
      buttons={
        <Button
          icon="power-off"
          selected={enabled}
          onClick={() => act('toggle')}
        >
          {`Relay ${enabled ? 'On' : 'Off'}`}
        </Button>
      }
    >
      <LabeledList>
        <LabeledList.Item label="Network Buffer Status">
          {dos_overload} / {dos_capacity} GQ
        </LabeledList.Item>
        <LabeledList.Item label="Options">
          <Button icon="exclamation-triangle" onClick={() => act('purge')}>
            Purge network blacklist
          </Button>
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};

const NTNetRelayCrash = (props) => {
  const { act } = useBackend();

  return (
    <FullscreenNotice title="ERROR">
      <Box fontSize="1.5rem" bold color="bad">
        <Icon
          name="exclamation-triangle"
          verticalAlign="middle"
          size={3}
          mr="1rem"
        />
        <h2>NETWORK BUFFERS OVERLOADED</h2>
        <h3>Overload Recovery Mode</h3>
        <i>
          This system is suffering temporary outage due to overflow of traffic
          buffers. Until buffered traffic is processed, all further requests
          will be dropped. Frequent occurences of this error may indicate
          insufficient hardware capacity of your network. Please contact your
          network planning department for instructions on how to resolve this
          issue.
        </i>
        <h3>ADMINISTRATIVE OVERRIDE</h3>
        <b> CAUTION - Data loss may occur </b>
      </Box>
      <Box>
        <Button icon="exclamation-triangle" onClick={() => act('restart')}>
          Purge buffered traffic
        </Button>
      </Box>
    </FullscreenNotice>
  );
};
