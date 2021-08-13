# Codacy Coverage Reporter GitHub Action

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/db5eda4c50b24c008b2c19f1117c9cef)](https://www.codacy.com/gh/codacy/codacy-coverage-reporter-action/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=codacy/codacy-coverage-reporter-action&amp;utm_campaign=Badge_Grade)

> 🤖 Automated multi-language coverage reporter for Codacy

This action runs the [codacy-coverage-reporter](https://github.com/codacy/codacy-coverage-reporter) for all commits and pull requests with your Codacy configuration.

## Usage

Create a new workflow `.yml` file in the `.github/workflows/` directory.

### .github/workflows/codacy-coverage-reporter.yml

```yml
name: codacy-coverage-reporter

on: ["push"]

jobs:
  codacy-coverage-reporter:
    runs-on: ubuntu-latest
    name: codacy-coverage-reporter
    steps:
      - uses: actions/checkout@v2
      - name: Run codacy-coverage-reporter
        uses: codacy/codacy-coverage-reporter-action@v1
        with:
          project-token: ${{ secrets.CODACY_PROJECT_TOKEN }}
          # or
          # api-token: ${{ secrets.CODACY_API_TOKEN }}
          coverage-reports: cobertura.xml
```

> Get the latest version from the [Releases page](https://github.com/codacy/codacy-coverage-reporter-action/releases).

## Workflow options

Change these options in the workflow `.yml` file to meet your GitHub project needs:

| Setting            | Description                                                                            | Recommended value                         |
| ------------------ | -------------------------------------------------------------------------------------- | ------------------------------------- |
| `api-token`        | [Account API token](https://docs.codacy.com/codacy-api/api-tokens/#account-api-tokens) | `${{ secrets.CODACY_API_TOKEN }}`     |
| `project-token`    | [Project API token](https://docs.codacy.com/codacy-api/api-tokens/#project-api-tokens) | `${{ secrets.CODACY_PROJECT_TOKEN }}` |
| `coverage-reports` | Optional comma-separated list of reports to send                                       | `''`                                  |
