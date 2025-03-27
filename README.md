# `tools/nogo` Issue

Reproducible of issues with `nogo`.

Verify the project is working with `bazel run //:repro`.

## Issue Reprodution

Clear the environment if cannot reproduce: `bazel clean --expunge`

1. Issue with Go 1.24

```sh
sed -i '' 's/1.23.7/1.24.1/' MODULE.bazel
bazel run //:go -- mod edit -go=1.24.1
bazel run //:go -- -C tools/nogo mod edit -go=1.24.1
bazel run //:repro
```

2. Issue with custom nogo `deps`

```sh
buildozer 'set deps @org_golang_x_tools//go/analysis/passes/fieldalignment' //:main_nogo
buildozer 'remove vet' //:main_nogo
bazel run //:repro
```
