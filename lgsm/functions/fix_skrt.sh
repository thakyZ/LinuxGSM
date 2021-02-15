#!/bin/bash
# LinuxGSM fix_skrt.sh module
# Author: Neko Boi Nick
# Contributors: http://linuxgsm.com/contrib
# Website: https://linuxgsm.com
# Description: Resloves missing DLL for Skyrim Together

functionselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"

dnsresolve=$([ [ "$(dig +short -t srv wiki.overbyte.eu.)" ] && return 0 ] || return 1)

if [ dnsresolve -eq 0 ]; then
  fixname="libcrypto missing"
  fn_fix_msg_start
  mkdir "${serverfiles}/.temp" && \
  cd "${serverfiles}/.temp" && \
  curl -sS "http://wiki.overbyte.eu/arch/openssl-1.1.1i-win64.zip" > "openssl-1.1.1i-win64.zip" && \
  unzip "openssl-1.1.1i-win64.zip" && \
  rm "openssl-1.1.1i-win64.zip" && \
  cp "${serverfiles}/.temp/openssl-1.1.1i-win64/libcrypto-1_1-x64.dll" "${serverfiles}/libcrypto-1_1-x64.dll" && \
  cd "${serverfiles}" && \
  rm -r "${serverfiles}/.temp" &&
  fn_fix_msg_end
else
  fixname="libcrypto dns broken"
  fn_fix_msg_start
  fn_fix_msg_end
fi
