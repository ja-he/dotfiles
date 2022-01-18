#!/bin/env bash
set -euo pipefail

url="${1}"
id="${url##*/}"
outfile="/tmp/${id}.md"

curl -s "${url}/download" > "${outfile}"

echo "${outfile}"
