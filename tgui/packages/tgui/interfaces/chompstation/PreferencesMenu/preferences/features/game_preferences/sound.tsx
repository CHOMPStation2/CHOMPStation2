import {
  CheckboxInput,
  type FeatureToggle,
} from 'tgui/interfaces/PreferencesMenu/preferences/features/base';

export const SOUND_ALARMLOOP: FeatureToggle = {
  name: 'Looping Alarm Sounds',
  category: 'SOUNDS',
  description: 'Enable looping alarm sounds.',
  component: CheckboxInput,
};

export const SOUND_FRIDGEHUM: FeatureToggle = {
  name: 'Fridge Humming',
  category: 'SOUNDS',
  description: 'Enable fridge humming.',
  component: CheckboxInput,
};

export const SLEEP_MUSIC: FeatureToggle = {
  name: 'Sleeping Music',
  category: 'SOUNDS',
  description: 'Enable sleeping music.',
  component: CheckboxInput,
};
