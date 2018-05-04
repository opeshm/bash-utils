#!/bin/bash

for fn_file in ${BASHUTILS_DIR}/functions/*.sh
do
  source ${fn_file}
done
