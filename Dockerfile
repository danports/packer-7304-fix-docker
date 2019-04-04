FROM golang:alpine

ENV PACKER_DEV=1

RUN apk add --update git bash openssl
RUN go get github.com/mitchellh/gox
RUN export GO111MODULE=on && go get github.com/paulmey/packer@revert-7203

WORKDIR $GOPATH/src/github.com/paulmey/packer

RUN /bin/bash scripts/build.sh

WORKDIR $GOPATH
ENTRYPOINT ["bin/packer"]