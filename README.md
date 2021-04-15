# codacy-coverage-reporter action

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
      - uses: actions/checkout@master
      - name: Run codacy-coverage-reporter
        uses: codacy/codacy-coverage-reporter-action@master
        with:
          project-token: ${{ secrets.CODACY_PROJECT_TOKEN }}
          # or
          # api-token: ${{ secrets.CODACY_API_TOKEN }}
          coverage-reports: cobertura.xml
```

## Workflow options

Change these options in the workflow `.yml` file to meet your GitHub project needs.

| Setting            | Description                                      | Default value                         |
| ------------------ | ------------------------------------------------ | ------------------------------------- |
| `api-token`        | An account API token                             | `${{ secrets.CODACY_API_TOKEN }}`     |
| `project-token`    | The project API token                            | `${{ secrets.CODACY_PROJECT_TOKEN }}` |
| `coverage-reports` | Optional Comma separated list of reports to send | `''`                                  |
