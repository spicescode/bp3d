BP3D_BIN_NAME = example

GO_PACKAGES = $(shell go list ./... | grep -v '/vendor/')
GO_FLAGS = "-X version.GitCommit=${GIT_COMMIT}${GIT_DIRTY} -X version.Version=${ASIR_VERSION}"

SRCS := $(shell find . -type f -name '*.go')


bin/$(BP3D_BIN_NAME): $(SRCS)
	@echo "building ${BP3D_BIN_NAME} ${GO_BIN_VERSION}"
	@echo "GOPATH=${GOPATH}"
	cd ./example && CGO_ENABLED=0 go build -buildvcs=false -ldflags $(GO_FLAGS) -o ../bin/$(BP3D_BIN_NAME)


.PHONY: build
build: bin/$(BP3D_BIN_NAME)