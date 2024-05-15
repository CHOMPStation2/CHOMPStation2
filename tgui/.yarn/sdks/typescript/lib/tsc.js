#!/usr/bin/env node

<<<<<<< HEAD
const { existsSync } = require(`fs`);
const { createRequire } = require(`module`);
const { resolve } = require(`path`);
=======
const {existsSync} = require(`fs`);
const {createRequire} = require(`module`);
const {resolve} = require(`path`);
>>>>>>> 67c7afe3a1... tgui 5.0.1 (#15898)

const relPnpApiPath = '../../../../.pnp.cjs';

const absPnpApiPath = resolve(__dirname, relPnpApiPath);
const absRequire = createRequire(absPnpApiPath);

if (existsSync(absPnpApiPath)) {
  if (!process.versions.pnp) {
    // Setup the environment to be able to require typescript/lib/tsc.js
    require(absPnpApiPath).setup();
  }
}

// Defer to the real typescript/lib/tsc.js your application uses
module.exports = absRequire(`typescript/lib/tsc.js`);
