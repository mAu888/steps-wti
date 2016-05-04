# Web Translate It

This step ensures that the web translate it gem is installed and performs a `wti pull`.

## Inputs

This step requires either a `.wti` file or the  `$WTI_API_KEY` variable to be set. In the latter case it will create a temporary `.wti` file and do a `wti pull`.

You can specify the director of the `.wti` file by passing the `$WTI_WORKING_DIRECTORY` parameter. The step will then `cd` into this directory and perform the `wti pull` from there.

## How to use this Step

Can be run directly with the [bitrise CLI](https://github.com/bitrise-io/bitrise),
just `git clone` this repository, `cd` into it's folder in your Terminal/Command Line
and call `bitrise run test`.

*Check the `bitrise.yml` file for required inputs which have to be
added to your `.bitrise.secrets.yml` file!*
