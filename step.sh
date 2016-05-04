#!/bin/bash

function print_and_do_command {
  echo "-> $ $@"
  $@
}

function print_and_do_command_exit_on_error {
  print_and_do_command $@
  if [ $? -ne 0 ]; then
    echo " [!] Failed!"
    exit 1
  fi
}

# Check for web translate it
gem list web_translate_it -i >/dev/null
if [ $? -ne 0 ]; then
  print_and_do_command_exit_on_error gem install --no-ri --no-rdoc web_translate_it
fi

# Switch to working directory
if [ -z "${wti_working_directory}" ]; then
  WTI_WORKING_DIRECTORY="."
fi

# Change into working directory
print_and_do_command_exit_on_error cd "${wti_working_directory}"

# Check for `.wti` file or `$API_KEY`
if [ ! -f ".wti" -a -z "$wti_api_key" ]; then
  echo " [!] No .wti configuration file found neither wti_api_key was given."
  exit 1
fi

# Write `.wti` file, if none found
if [ ! -f ".wti" ]; then
  echo "api_key: ${wti_api_key}" > ".wti"
fi

print_and_do_command_exit_on_error wti pull
