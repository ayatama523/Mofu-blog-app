module.exports = {
  'env': {
    'browser': true,
    'es6': true
  },
  'extends': [
    'plugin:react-app/recommended',
    "prettier",
  ],
  'globals': {
    'Atomics': 'readonly',
    'SharedArrayBuffer': 'readonly',
    '$': 'readonly',
    'jQuery': 'readonly',
    'Popper': 'readonly'
  },
  'parserOptions': {
    'ecmaFeatures': {
      'jsx': true
    },
    'ecmaVersion': 2018,
    'sourceType': 'module'
  },
  'plugins': [
    'react',
    'react-app',
    '@typescript-eslint'
  ],
  'parser': '@typescript-eslint/parser',
  'rules': {
    'class-methods-use-this': 'off',
    'import/no-unresolved': 'off',
    'react/jsx-filename-extension': [
      'error',
      { 'extensions': ['.js', '.jsx', '.ts', '.tsx'] }
    ]
  }
};
