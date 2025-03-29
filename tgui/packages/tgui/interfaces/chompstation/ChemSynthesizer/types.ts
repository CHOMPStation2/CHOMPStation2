import type { BooleanLike } from 'tgui-core/react';

export type Data = {
  busy: BooleanLike;
  production_mode: BooleanLike;
  panel_open: BooleanLike;
  use_catalyst: BooleanLike;
  drug_substance: number;
  bottle_icon: string;
  pill_icon: string;
  patch_icon: string;
  queue: { name: string; index: number }[];
  recipes: { name: string }[];
  rxn_vessel: reagent[];
  catalyst: BooleanLike;
  catalyst_reagents: reagent[];
  catalystCurrentVolume: number | null;
  catalystMaxVolume: number | null;
  chemicals: { title: string; id: string; amount: number }[];
  modal: modalData;
};

export type reagent = {
  name: string;
  volume: number;
  description: string;
  id: string;
};

export type modalData = {
  id: string;
  text: string;
  args: {};
  type: string;
};
