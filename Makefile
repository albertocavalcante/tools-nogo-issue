.PHONY: fmt tidy gazelle

fmt:
	bazel run //:go -- fmt ./...

tidy:
	bazel run //:go -- mod tidy -v
	bazel run //:go -- -C tools/nogo mod tidy -v

gazelle:
	bazel run //:go -- run github.com/bazelbuild/bazel-gazelle/cmd/gazelle@latest
