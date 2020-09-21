import { Fragment } from 'inferno';
import { useBackend } from '../backend';
import { Button, LabeledList, NoticeBox, Section } from '../components';
import { Window } from '../layouts';

export const PortableTurret = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    locked,
    on,
    lethal,
    lethal_is_configurable,
    targetting_is_configurable,
    check_weapons,
    neutralize_noaccess,
    neutralize_norecord,
    neutralize_criminals,
    neutralize_all,
    neutralize_nonsynth,
    neutralize_unidentified,
    neutralize_down,
  } = data;
  return (
    <Window width={500} height={400} resizable>
      <Window.Content scrollable>
<<<<<<< HEAD
        <NoticeBox>Swipe an ID card to {locked ? 'unlock' : 'lock'} this interface.</NoticeBox>
=======
        <NoticeBox>
          Swipe an ID card to {locked ? 'unlock' : 'lock'} this interface.
        </NoticeBox>
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
        <Section>
          <LabeledList>
            <LabeledList.Item label="Status">
              <Button
                icon={on ? 'power-off' : 'times'}
                content={on ? 'On' : 'Off'}
                selected={on}
                disabled={locked}
<<<<<<< HEAD
                onClick={() => act('power')}
              />
=======
                onClick={() => act('power')} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
            </LabeledList.Item>
            {!!lethal_is_configurable && (
              <LabeledList.Item label="Lethals">
                <Button
                  icon={lethal ? 'exclamation-triangle' : 'times'}
                  content={lethal ? 'On' : 'Off'}
<<<<<<< HEAD
                  color={lethal ? 'bad' : ''}
                  disabled={locked}
                  onClick={() => act('lethal')}
                />
=======
                  color={lethal ? "bad" : ""}
                  disabled={locked}
                  onClick={() => act('lethal')} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
              </LabeledList.Item>
            )}
          </LabeledList>
        </Section>
        {!!targetting_is_configurable && (
          <Fragment>
            <Section title="Humanoid Targets">
              <Button.Checkbox
                fluid
                checked={neutralize_criminals}
                content="Wanted Criminals"
                disabled={locked}
<<<<<<< HEAD
                onClick={() => act('autharrest')}
              />
=======
                onClick={() => act('autharrest')} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
              <Button.Checkbox
                fluid
                checked={neutralize_norecord}
                content="No Sec Record"
                disabled={locked}
<<<<<<< HEAD
                onClick={() => act('authnorecord')}
              />
=======
                onClick={() => act('authnorecord')} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
              <Button.Checkbox
                fluid
                checked={check_weapons}
                content="Unauthorized Weapons"
                disabled={locked}
<<<<<<< HEAD
                onClick={() => act('authweapon')}
              />
=======
                onClick={() => act('authweapon')} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
              <Button.Checkbox
                fluid
                checked={neutralize_noaccess}
                content="Unauthorized Access"
                disabled={locked}
<<<<<<< HEAD
                onClick={() => act('authaccess')}
              />
=======
                onClick={() => act('authaccess')} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
            </Section>
            <Section title="Other Targets">
              <Button.Checkbox
                fluid
                checked={neutralize_unidentified}
                content="Unidentified Lifesigns (Xenos, Animals, Etc)"
                disabled={locked}
<<<<<<< HEAD
                onClick={() => act('authxeno')}
              />
=======
                onClick={() => act('authxeno')} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
              <Button.Checkbox
                fluid
                checked={neutralize_nonsynth}
                content="All Non-Synthetics"
                disabled={locked}
<<<<<<< HEAD
                onClick={() => act('authsynth')}
              />
=======
                onClick={() => act('authsynth')} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
              <Button.Checkbox
                fluid
                checked={neutralize_down}
                content="Downed Targets"
                disabled={locked}
<<<<<<< HEAD
                onClick={() => act('authdown')}
              />
=======
                onClick={() => act('authdown')} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
              <Button.Checkbox
                fluid
                checked={neutralize_all}
                content="All Entities"
                disabled={locked}
<<<<<<< HEAD
                onClick={() => act('authall')}
              />
=======
                onClick={() => act('authall')} />
>>>>>>> d49640431d... Merge pull request #9062 from ShadowLarkens/tgui_finale
            </Section>
          </Fragment>
        )}
      </Window.Content>
    </Window>
  );
};
