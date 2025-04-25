import {
  CheckboxInput,
  type FeatureToggle,
} from 'tgui/interfaces/PreferencesMenu/preferences/features/base';

export const EMOTE_VARY: FeatureToggle = {
  name: 'Random emote pitch',
  category: 'GAMEPLAY',
  description: 'Enable random emote pitch.',
  component: CheckboxInput,
};

export const AUTOTRANSCORE: FeatureToggle = {
  name: 'Automatic transcore notification',
  category: 'GAMEPLAY',
  description: 'Enable automatic transcore notification.',
  component: CheckboxInput,
};
