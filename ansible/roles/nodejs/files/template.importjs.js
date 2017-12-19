module.exports = {
  environments: ['node'],
  ignorePackagePrefixes: ['lodash.'],
  declarationKeyword: 'import',
  logLevel: 'debug',
  excludes: [
    './build/**',
    './lib/__mocks__/**',
  ],
  importDevDependencies: ({ pathToCurrentFile }) => testFilePattern.test(pathToCurrentFile),
};
