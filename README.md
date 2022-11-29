# Codacy Coverage Reporter GitHub Action

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/db5eda4c50b24c008b2c19f1117c9cef)](https://www.codacy.com/gh/codacy/codacy-coverage-reporter-action/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=codacy/codacy-coverage-reporter-action&amp;utm_campaign=Badge_Grade)

GitHub Action for [uploading coverage reports to Codacy](https://docs.codacy.com/coverage-reporter/#uploading-coverage) on all commits and pull requests, tracking code coverage, and returning code coverage issues.

[Codacy](https://www.codacy.com/) is an automated code review tool that makes it easy to ensure your team is writing high-quality code by analyzing more than 40 programming languages such as PHP, JavaScript, Python, Java, and Ruby. Codacy allows you to define your own quality rules, code patterns and quality settings you'd like to enforce to prevent issues on your codebase.

<br/>

<a href="https://www.codacy.com" target="_blank"><img src="images/codacy-logo.svg" alt="Codacy" width="400"/></a>

<br/>

## Uploading coverage to Codacy

Before setting up Codacy Coverage Reporter GitHub Action you must have tests and use tools to [generate coverage reports](https://docs.codacy.com/coverage-reporter/#generating-coverage) for the source code files in your repository.

The Codacy Coverage Reporter GitHub Action:

-   Uploads coverage report data to Codacy.
-   Prints the coverage report upload status on the console, which is visible on the workflow panel of the GitHub Action.
-   Fails the workflow if code coverage falls below your project’s [quality settings](https://docs.codacy.com/repositories-configure/adjusting-quality-settings/#gates).

To use the GitHub Action with default settings:

1.  Set up an API token to allow the GitHub Action to authenticate on Codacy:

    -   **If you're setting up one repository**, [obtain a project API token](https://docs.codacy.com/codacy-api/api-tokens/#project-api-tokens) and store it as an [encrypted secret for your **repository**](https://docs.github.com/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-a-repository) with the name `CODACY_PROJECT_TOKEN`.
    -   **If you're setting up multiple repositories**, [obtain an account API token](https://docs.codacy.com/codacy-api/api-tokens/#account-api-tokens) and store it as an [encrypted secret for your **organization**](https://docs.github.com/en/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-an-organization) with the name `CODACY_API_TOKEN`.

    > ⚠️ **Never write API tokens to your configuration files** and keep your API tokens well protected, as they grant owner permissions to your projects on Codacy.

2.  [Generate a supported code coverage report](https://docs.codacy.com/coverage-reporter/#adding-coverage-to-your-repository) before each push to your repository.

3.  Add the following to a file `.github/workflows/codacy-coverage-reporter.yaml` in your repository. Update the sample code with the name of the environment storing the access token and the paths to the report files generated previously:

    ```yaml
    name: Codacy Coverage Reporter

    on: ["push"]

    jobs:
      codacy-coverage-reporter:
        runs-on: ubuntu-latest
        name: codacy-coverage-reporter
        environment: production # Environment storing the access token
        steps:
          - uses: actions/checkout@v2
          - name: Run codacy-coverage-reporter
            uses: codacy/codacy-coverage-reporter-action@v1
            with:
              project-token: ${{ secrets.CODACY_PROJECT_TOKEN }}
              # or
              # api-token: ${{ secrets.CODACY_API_TOKEN }}
              coverage-reports: path/to/coverage.xml
              # or a comma-separated list for multiple reports
              # coverage-reports: package1/coverage.xml, package2/coverage.xml
              # language: '' # Optionally force associating a language with your coverage report
              # force-coverage-parser: '' # Optionally force using a specific coverage report parser
    ```

4.  Optionally, to have information about the coverage results directly on your pull requests, [enable the GitHub integration](https://docs.codacy.com/repositories-configure/integrations/github-integration/) on Codacy.

5.  Optionally, to add coverage results to GitHub status checks, [configure a quality gate for coverage](https://docs.codacy.com/repositories-configure/integrations/github-integration/#status-checks) and [enable sending status checks](https://docs.codacy.com/repositories-configure/integrations/github-integration/#status-checks) on Codacy.
