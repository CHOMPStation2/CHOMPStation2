<<<<<<< HEAD
import { useBackend, useSharedState } from '../backend';
import { Box, Button, LabeledList, Input, Section, Table, Tabs } from '../components';
import { Window } from '../layouts';
=======
import { round } from 'common/math';
import { Fragment } from 'inferno';
import { useBackend, useSharedState } from "../backend";
import { Box, Button, Flex, Icon, LabeledList, Input, Section, Table, Tabs } from "../components";
import { Window } from "../layouts";
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale

export const AccountsTerminal = (props, context) => {
  const { act, data } = useBackend(context);

<<<<<<< HEAD
  const { id_inserted, id_card, access_level, machine_id } = data;
=======
  const {
    id_inserted,
    id_card,
    access_level,
    machine_id,
  } = data;
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale

  return (
    <Window width={400} height={640}>
      <Window.Content scrollable>
        <Section>
          <LabeledList>
            <LabeledList.Item label="Machine" color="average">
              {machine_id}
            </LabeledList.Item>
            <LabeledList.Item label="ID">
              <Button
<<<<<<< HEAD
                icon={id_inserted ? 'eject' : 'sign-in-alt'}
                fluid
                content={id_card}
                onClick={() => act('insert_card')}
              />
=======
                icon={id_inserted ? "eject" : "sign-in-alt"}
                fluid
                content={id_card}
                onClick={() => act("insert_card")} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
            </LabeledList.Item>
          </LabeledList>
        </Section>
        {access_level > 0 && <AccountTerminalContent />}
      </Window.Content>
    </Window>
  );
};

const AccountTerminalContent = (props, context) => {
  const { act, data } = useBackend(context);

<<<<<<< HEAD
  const { creating_new_account, detailed_account_view } = data;
=======
  const {
    creating_new_account,
    detailed_account_view,
  } = data;
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale

  return (
    <Section title="Menu">
      <Tabs>
        <Tabs.Tab
          selected={!creating_new_account && !detailed_account_view}
          icon="home"
<<<<<<< HEAD
          onClick={() => act('view_accounts_list')}>
          Home
        </Tabs.Tab>
        <Tabs.Tab selected={creating_new_account} icon="cog" onClick={() => act('create_account')}>
          New Account
        </Tabs.Tab>
        <Tabs.Tab disabled={creating_new_account} icon="print" onClick={() => act('print')}>
          Print
        </Tabs.Tab>
      </Tabs>
      {(creating_new_account && <NewAccountView />) || (detailed_account_view && <DetailedView />) || <ListView />}
=======
          onClick={() => act("view_accounts_list")}>
          Home
        </Tabs.Tab>
        <Tabs.Tab
          selected={creating_new_account}
          icon="cog"
          onClick={() => act("create_account")}>
          New Account
        </Tabs.Tab>
        <Tabs.Tab
          disabled={creating_new_account}
          icon="print"
          onClick={() => act("print")}>
          Print
        </Tabs.Tab>
      </Tabs>
      {creating_new_account && (
        <NewAccountView />
      ) || detailed_account_view && (
        <DetailedView />
      ) || (
        <ListView />
      )}
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
    </Section>
  );
};

const NewAccountView = (props, context) => {
  const { act } = useBackend(context);

<<<<<<< HEAD
  const [holder, setHolder] = useSharedState(context, 'holder', '');
  const [newMoney, setMoney] = useSharedState(context, 'money', '');
=======
  const [holder, setHolder] = useSharedState(context, "holder", "");
  const [newMoney, setMoney] = useSharedState(context, "money", "");
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale

  return (
    <Section title="Create Account" level={2}>
      <LabeledList>
        <LabeledList.Item label="Account Holder">
<<<<<<< HEAD
          <Input value={holder} fluid onInput={(e, val) => setHolder(val)} />
        </LabeledList.Item>
        <LabeledList.Item label="Initial Deposit">
          <Input value={newMoney} fluid onInput={(e, val) => setMoney(val)} />
=======
          <Input
            value={holder}
            fluid
            onInput={(e, val) => setHolder(val)} />
        </LabeledList.Item>
        <LabeledList.Item label="Initial Deposit">
          <Input
            value={newMoney}
            fluid
            onInput={(e, val) => setMoney(val)} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
        </LabeledList.Item>
      </LabeledList>
      <Button
        disabled={!holder || !newMoney}
        mt={1}
        fluid
        icon="plus"
<<<<<<< HEAD
        onClick={() =>
          act('finalise_create_account', {
            holder_name: holder,
            starting_funds: newMoney,
          })
        }
        content="Create"
      />
=======
        onClick={() => act("finalise_create_account", {
          holder_name: holder,
          starting_funds: newMoney,
        })}
        content="Create" />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
    </Section>
  );
};

const DetailedView = (props, context) => {
  const { act, data } = useBackend(context);

<<<<<<< HEAD
  const { access_level, station_account_number, account_number, owner_name, money, suspended, transactions } = data;

  return (
    <Section
      title="Account Details"
      level={2}
      buttons={<Button icon="ban" selected={suspended} content="Suspend" onClick={() => act('toggle_suspension')} />}>
      <LabeledList>
        <LabeledList.Item label="Account Number">#{account_number}</LabeledList.Item>
        <LabeledList.Item label="Holder">{owner_name}</LabeledList.Item>
        <LabeledList.Item label="Balance">{money}₮</LabeledList.Item>
        <LabeledList.Item label="Status" color={suspended ? 'bad' : 'good'}>
          {suspended ? 'SUSPENDED' : 'Active'}
=======
  const {
    access_level,
    station_account_number,
    account_number,
    owner_name,
    money,
    suspended,
    transactions,
  } = data;
  
  return (
    <Section title="Account Details" level={2} buttons={
      <Button
        icon="ban"
        selected={suspended}
        content="Suspend"
        onClick={() => act("toggle_suspension")} />
    }>
      <LabeledList>
        <LabeledList.Item label="Account Number">
          #{account_number}
        </LabeledList.Item>
        <LabeledList.Item label="Holder">
          {owner_name}
        </LabeledList.Item>
        <LabeledList.Item label="Balance">
          {money}₮
        </LabeledList.Item>
        <LabeledList.Item label="Status" color={suspended ? "bad" : "good"}>
          {suspended ? "SUSPENDED" : "Active"}
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
        </LabeledList.Item>
      </LabeledList>
      <Section title="CentCom Administrator" level={2} mt={1}>
        <LabeledList>
          <LabeledList.Item label="Payroll">
            <Button.Confirm
              color="bad"
              fluid
              icon="ban"
              confirmIcon="ban"
              content="Revoke"
              confirmContent="This cannot be undone."
              disabled={account_number === station_account_number}
<<<<<<< HEAD
              onClick={() => act('revoke_payroll')}
            />
=======
              onClick={() => act("revoke_payroll")} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
          </LabeledList.Item>
        </LabeledList>
      </Section>
      {access_level >= 2 && (
        <Section title="Silent Funds Transfer" level={2}>
<<<<<<< HEAD
          <Button icon="plus" onClick={() => act('add_funds')} content="Add Funds" />
          <Button icon="plus" onClick={() => act('remove_funds')} content="Remove Funds" />
=======
          <Button
            icon="plus"
            onClick={() => act("add_funds")}
            content="Add Funds" />
          <Button
            icon="plus"
            onClick={() => act("remove_funds")}
            content="Remove Funds" />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
        </Section>
      )}
      <Section title="Transactions" level={2} mt={1}>
        <Table>
          <Table.Row header>
            <Table.Cell>Timestamp</Table.Cell>
            <Table.Cell>Target</Table.Cell>
            <Table.Cell>Reason</Table.Cell>
            <Table.Cell>Value</Table.Cell>
            <Table.Cell>Terminal</Table.Cell>
          </Table.Row>
          {transactions.map((trans, i) => (
            <Table.Row key={i}>
<<<<<<< HEAD
              <Table.Cell>
                {trans.date} {trans.time}
              </Table.Cell>
=======
              <Table.Cell>{trans.date} {trans.time}</Table.Cell>
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
              <Table.Cell>{trans.target_name}</Table.Cell>
              <Table.Cell>{trans.purpose}</Table.Cell>
              <Table.Cell>{trans.amount}₮</Table.Cell>
              <Table.Cell>{trans.source_terminal}</Table.Cell>
            </Table.Row>
          ))}
        </Table>
      </Section>
    </Section>
  );
};

const ListView = (props, context) => {
  const { act, data } = useBackend(context);

<<<<<<< HEAD
  const { accounts } = data;

  return (
    <Section title="NanoTrasen Accounts" level={2}>
      {(accounts.length && (
        <LabeledList>
          {accounts.map((acc) => (
            <LabeledList.Item
              label={acc.owner_name + acc.suspended}
              color={acc.suspended ? 'bad' : null}
              key={acc.account_index}>
              <Button
                fluid
                content={'#' + acc.account_number}
                onClick={() => act('view_account_detail', { 'account_index': acc.account_index })}
              />
            </LabeledList.Item>
          ))}
        </LabeledList>
      )) || <Box color="bad">There are no accounts available.</Box>}
=======
  const {
    accounts,
  } = data;
  
  return (
    <Section title="NanoTrasen Accounts" level={2}>
      {accounts.length && (
        <LabeledList>
          {accounts.map(acc => (
            <LabeledList.Item
              label={acc.owner_name + acc.suspended}
              color={acc.suspended ? "bad" : null}
              key={acc.account_index}>
              <Button
                fluid
                content={"#" + acc.account_number}
                onClick={() => act("view_account_detail", { "account_index": acc.account_index })} />
            </LabeledList.Item>
          ))}
        </LabeledList>
      ) || (
        <Box color="bad">
          There are no accounts available.
        </Box>
      )}
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
    </Section>
  );
};
