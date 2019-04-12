FROM golang:alpine

ENV PACKER_DEV=1

RUN apk add --update git bash openssl && git config --global user.email "danports@gmail.com" && git config --global user.name "Dan Ports"
RUN go get github.com/mitchellh/gox
RUN go get github.com/hashicorp/packer

WORKDIR $GOPATH/src/github.com/hashicorp/packer

RUN git revert e189db97d && /bin/bash scripts/build.sh && rm -rf $GOPATH/src

WORKDIR $GOPATH
ENTRYPOINT ["bin/packer"]