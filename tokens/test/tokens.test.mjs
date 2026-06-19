import { test } from 'node:test';
import assert from 'node:assert/strict';
import { tokens } from '../dist/index.js';

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
