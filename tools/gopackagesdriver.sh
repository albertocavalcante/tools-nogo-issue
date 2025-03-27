#!/usr/bin/env bash
# https://github.com/bazel-contrib/rules_go/wiki/Editor-setup#2-launcher-script
exec bazel run -- @rules_go//go/tools/gopackagesdriver "${@}"