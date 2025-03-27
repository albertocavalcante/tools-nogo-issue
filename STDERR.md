# Issues Output

## Issue 1

```sh
❯ bazel run //:repro                       

INFO: Analyzed target //:repro (1 packages loaded, 26 targets configured).
ERROR: /Users/albertocavalcante/dev/workspace/tools-nogo-issue/BUILD.bazel:22:10: Running nogo on //:repro failed: (Exit 1): builder failed: error executing RunNogo command (from target //:repro) bazel-out/darwin_arm64-opt-exec-ST-d57f47055a04/bin/external/rules_go++go_sdk+tools-nogo-issue__download_0/builder_reset/builder nogo -sdk external/rules_go++go_sdk+tools-nogo-issue__download_0 -goroot ... (remaining 21 arguments skipped)

Use --sandbox_debug to see verbose messages from the sandbox and retain the sandbox build root for debugging
nogo: nogo: error running analyzers: 4 analyzers skipped due to type-checking error: main.go:4:6: could not import github.com/sirupsen/logrus (internal error in importing "github.com/sirupsen/logrus" (unsupported version: 2); please report an issue)
ERROR: /Users/albertocavalcante/dev/workspace/tools-nogo-issue/BUILD.bazel:14:11: Running nogo on //:tools-nogo-issue_lib failed: (Exit 1): builder failed: error executing RunNogo command (from target //:tools-nogo-issue_lib) bazel-out/darwin_arm64-opt-exec-ST-d57f47055a04/bin/external/rules_go++go_sdk+tools-nogo-issue__download_0/builder_reset/builder nogo -sdk external/rules_go++go_sdk+tools-nogo-issue__download_0 -goroot ... (remaining 21 arguments skipped)

Use --sandbox_debug to see verbose messages from the sandbox and retain the sandbox build root for debugging
nogo: nogo: error running analyzers: 4 analyzers skipped due to type-checking error: main.go:4:6: could not import github.com/sirupsen/logrus (internal error in importing "github.com/sirupsen/logrus" (unsupported version: 2); please report an issue)
Target //:repro failed to build
Use --verbose_failures to see the command lines of failed build steps.
ERROR: /Users/albertocavalcante/dev/workspace/tools-nogo-issue/BUILD.bazel:14:11 Validating nogo output for //:tools-nogo-issue_lib failed: (Exit 1): builder failed: error executing RunNogo command (from target //:tools-nogo-issue_lib) bazel-out/darwin_arm64-opt-exec-ST-d57f47055a04/bin/external/rules_go++go_sdk+tools-nogo-issue__download_0/builder_reset/builder nogo -sdk external/rules_go++go_sdk+tools-nogo-issue__download_0 -goroot ... (remaining 21 arguments skipped)

Use --sandbox_debug to see verbose messages from the sandbox and retain the sandbox build root for debugging
INFO: Elapsed time: 1.016s, Critical Path: 0.05s
INFO: 3 processes: 6 action cache hit, 3 internal.
ERROR: Build did NOT complete successfully
ERROR: Build failed. Not running target
```

## Issue 2

```sh
❯ bazel run //:repro                                                                                                         

INFO: Analyzed target //:repro (1 packages loaded, 26 targets configured).
ERROR: /Users/albertocavalcante/dev/workspace/tools-nogo-issue/BUILD.bazel:3:5: GoCompilePkg main_nogo_actual~nogo.a [for tool] failed: (Exit 1): builder failed: error executing GoCompilePkg command (from target //:main_nogo_actual) bazel-out/darwin_arm64-opt-exec-ST-6172c64807bb/bin/external/rules_go++go_sdk+tools-nogo-issue__download_0/builder_reset/builder compilepkg -sdk external/rules_go++go_sdk+tools-nogo-issue__download_0 ... (remaining 54 arguments skipped)

Use --sandbox_debug to see verbose messages from the sandbox and retain the sandbox build root for debugging
external/rules_go+/go/tools/builders/nogo_main.go:400:3: cannot use inputs (type map[*analysis.Analyzer]interface {}) as type func(analysis.Diagnostic) in field value
external/rules_go+/go/tools/builders/nogo_main.go:401:3: cannot use ignoreNolintReporter (type func(analysis.Diagnostic)) as type *analysis.Module in field value
external/rules_go+/go/tools/builders/nogo_main.go:402:3: cannot use act.pkg.facts.ImportPackageFact (type func(*types.Package, analysis.Fact) bool) as type func(types.Object, analysis.Fact) bool in field value
external/rules_go+/go/tools/builders/nogo_main.go:403:3: cannot use act.pkg.facts.ExportPackageFact (type func(analysis.Fact)) as type func(types.Object, analysis.Fact) in field value
external/rules_go+/go/tools/builders/nogo_main.go:404:3: cannot use act.pkg.facts.ImportObjectFact (type func(types.Object, analysis.Fact) bool) as type func(string) ([]byte, error) in field value
external/rules_go+/go/tools/builders/nogo_main.go:405:3: cannot use act.pkg.facts.ExportObjectFact (type func(types.Object, analysis.Fact)) as type func(*types.Package, analysis.Fact) bool in field value
external/rules_go+/go/tools/builders/nogo_main.go:406:3: cannot use func literal (type func() []analysis.PackageFact) as type func(analysis.Fact) in field value
external/rules_go+/go/tools/builders/nogo_main.go:407:3: cannot use func literal (type func() []analysis.ObjectFact) as type func() []analysis.PackageFact in field value
compilepkg: error running subcommand external/rules_go++go_sdk+tools-nogo-issue__download_0/pkg/tool/darwin_arm64/compile: exit status 2
Target //:repro failed to build
```