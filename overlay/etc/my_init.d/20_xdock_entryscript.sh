#!/bin/bash

if [[ -n "${ENTRYPOINT_SCRIPT}" && -x "${ENTRYPOINT_SCRIPT}" ]]; then
  source "${ENTRYPOINT_SCRIPT}"
fi
