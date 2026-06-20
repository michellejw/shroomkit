import { test } from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { tokens } from '../dist/index.js';

const distFile = (name) => readFileSync(fileURLToPath(new URL(`../dist/${name}`, import.meta.url)), 'utf8');

test('forest colors match known-good', () => {
  assert.equal(tokens.color.forest.appBg, '#F3EFE4');
  assert.equal(tokens.color.forest.accent, '#6E8B4E');
  assert.equal(tokens.color.forest.sub, '#8C8C74');
  assert.equal(tokens.color.forest.tierBg, '#FBF9F1');
});

test('twilight colors match known-good', () => {
  assert.equal(tokens.color.twilight.appBg, '#161B22');
  assert.equal(tokens.color.twilight.accent, '#6FBFA8');
});

test('numberColors is the 1-8 list (no .clear)', () => {
  assert.equal(tokens.color.forest.numberColors.length, 8);
  assert.equal(tokens.color.forest.numberColors[0], '#5C8C57');
  assert.equal(tokens.color.twilight.numberColors[7], '#AEB4BC');
});

test('warn is not duplicated into the export', () => {
  assert.equal('warn' in tokens.color.forest, false);
});

test('scales are numbers', () => {
  assert.equal(tokens.radius.md, 12);
  assert.equal(tokens.radius.pill, 22);
  assert.equal(tokens.space.sm, 12);
  assert.equal(tokens.space.xl, 32);
  assert.equal(tokens.font.weight.semibold, 600);
  assert.equal(tokens.font.tracking.eyebrow, 1.3);
});

// Tripwire: the hand-authored theme.css references the generated --shroom-* vars
// by name. If a token's css name is renamed in tokens.json, tokens.css regenerates
// with the new name and theme.css would silently point at an undefined var. Assert
// every var(--x) used as a value in theme.css is defined in tokens.css.
test('every var() in theme.css resolves to a definition in tokens.css', () => {
  const themeCss = distFile('theme.css');
  const tokensCss = distFile('tokens.css');
  const defined = new Set([...tokensCss.matchAll(/(--[\w-]+)\s*:/g)].map((m) => m[1]));
  const referenced = [...themeCss.matchAll(/var\((--[\w-]+)\)/g)].map((m) => m[1]);
  assert.ok(referenced.length > 0, 'expected theme.css to reference vars');
  const missing = [...new Set(referenced)].filter((v) => !defined.has(v));
  assert.deepEqual(missing, [], `theme.css references vars not defined in tokens.css: ${missing.join(', ')}`);
});

// Tripwire: index.d.ts ThemeColors is a hand-maintained mirror of the color leaves.
// Assert its property names match the runtime export's keys for both themes.
test('index.d.ts ThemeColors keys match the runtime token keys', () => {
  const dts = distFile('index.d.ts');
  const block = dts.match(/interface ThemeColors \{([\s\S]*?)\}/);
  assert.ok(block, 'ThemeColors interface not found in index.d.ts');
  const dtsKeys = [...block[1].matchAll(/(\w+)\s*:/g)].map((m) => m[1]).sort();
  const runtimeKeys = (theme) => Object.keys(tokens.color[theme]).sort();
  assert.deepEqual(dtsKeys, runtimeKeys('forest'), 'd.ts keys differ from forest runtime keys');
  assert.deepEqual(runtimeKeys('forest'), runtimeKeys('twilight'), 'forest and twilight key sets differ');
});
