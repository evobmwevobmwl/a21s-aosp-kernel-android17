# Galaxy A21s Android 17 kernel

This branch is the device kernel used by the LineageOS 24.0 A21s bring-up.
It is Linux 4.19.325 with Android and BPF backports, not a mainline kernel.

The workflow adds:

- KernelSU v3.3.0 by default;
- eBPF syscall, JIT, cgroup, tc and LSM configuration;
- EXT4 and EROFS support;
- an optional userspace kernel-release value of
  `5.15.136-a21s-a17-ebpf-ksu` for Android 17 netbpfloader experiments.

The reported 5.15 release does not turn Linux 4.19 into Linux 5.15. It is
enabled only because this source already carries a large BPF backport set.
Always test boot and collect pstore before distributing an image.

The workflow currently uploads the raw `Image`, compiled DTBs, config and
build log. It deliberately does not create a flashable ZIP: boot image
packing must use the ramdisk and DTB/DTBO that match the target ROM build.
