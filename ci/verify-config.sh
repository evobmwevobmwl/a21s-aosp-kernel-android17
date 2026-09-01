#!/usr/bin/env bash
set -euo pipefail

config="${1:-out/.config}"

required=(
  CONFIG_64BIT
  CONFIG_MODULES
  CONFIG_KPROBES
  CONFIG_BPF
  CONFIG_BPF_SYSCALL
  CONFIG_BPF_JIT
  CONFIG_BPF_JIT_ALWAYS_ON
  CONFIG_CGROUP_BPF
  CONFIG_NET_CLS_BPF
  CONFIG_NET_ACT_BPF
  CONFIG_EXT4_FS
  CONFIG_EROFS_FS
  CONFIG_KSU
)

failed=0
for symbol in "${required[@]}"; do
  if ! grep -qx "${symbol}=y" "$config"; then
    echo "::error::${symbol} is not enabled"
    failed=1
  fi
done

if [[ "$failed" -ne 0 ]]; then
  exit 1
fi

echo "Required Android 17/BPF/filesystem/KernelSU options are enabled."

