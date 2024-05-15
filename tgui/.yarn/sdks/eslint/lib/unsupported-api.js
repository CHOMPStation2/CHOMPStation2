#!/usr/bin/env node

<<<<<<< HEAD
const { existsSync } = require(`fs`);
const { createRequire } = require(`module`);
const { resolve } = require(`path`);

const relPnpApiPath = '../../../../.pnp.cjs';
=======
const {existsSync} = require(`fs`);
const {createRequire} = require(`module`);
const {resolve} = require(`path`);

const relPnpApiPath = "../../../../.pnp.cjs";
>>>>>>> 67c7afe3a1... tgui 5.0.1 (#15898)

const absPnpApiPath = resolve(__dirname, relPnpApiPath);
const absRequire = createRequire(absPnpApiPath);

if (existsSync(absPnpApiPath)) {
  if (!process.versions.pnp) {
    // Setup the environment to be able to require eslint/use-at-your-own-risk
    require(absPnpApiPath).setup();
  }
}

// Defer to the real eslint/use-at-your-own-risk your application uses
module.exports = absRequire(`eslint/use-at-your-own-risk`);
