module.exports = {
    root: true,
    extends: ['prettier'],
    ignorePatterns: ['.eslintrc.*'],
    parserOptions: {
        tsconfigRootDir: __dirname,
        project: ['tsconfig.json'],
        sourceType: 'module',
        ecmaVersion: 2022
    },
    plugins: ['@typescript-eslint'],
}
