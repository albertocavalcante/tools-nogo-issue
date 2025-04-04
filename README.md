# `tools/nogo` Issue

Reproducible of issues with `nogo`.

Verify the project is working with `bazel run //:repro`. Use `git reset --hard` to return to the current state.

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

## Workarounds

### Issue 2

1. Flip back the experimental isolated extension:

```sh
sed -i '' 's/--experimental_isolated_extension_usages/--noexperimental_isolated_extension_usages/' .bazelrc
```

2. Remove `nogo_deps` isolated extension:

```sh
sed -i '' '/nogo_deps = use_extension/,/use_repo(nogo_deps, "org_golang_x_tools")/d' MODULE.bazel
```

3. Add `golang.org/x/tools` as part of a manual entry to `go_deps.module`

```sh
sed -i '' '/use_repo/i\
go_deps.module(\
    path = "golang.org/x/tools",\
    sum = "h1:0EedkvKDbh+qistFTd0Bcwe/YLh4vHwWEkiI0toFIBU=",\
    version = "v0.31.0",\
)\
' MODULE.bazel
```

4. Update `use_repo` with `buildozer` (`bazel mod tidy` should also work)

```sh
buildozer 'use_repo_add go_deps org_golang_x_tools' //MODULE.bazel:all
```

5. Optional but why not, we can nuke `tools/nogo`

```sh
rm -rf tools/nogo
```

6. Add an analyzer from `golang.org/x/tools` and remove `vet`:

```sh
buildozer 'set deps @org_golang_x_tools//go/analysis/passes/fieldalignment' //:main_nogo
buildozer 'remove vet' //:main_nogo
```

7. Confirm it works: `bazel run //:repro`
