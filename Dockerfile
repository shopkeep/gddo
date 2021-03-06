FROM google/golang:1.4

EXPOSE 8080

RUN apt-get update && apt-get install -y --no-install-recommends graphviz

# Create a shim runner to leverage environment variables
COPY script/gddo /usr/local/bin/

# Build the local gddo files.
COPY . ${GOPATH}/src/github.com/shopkeep/gddo
WORKDIR ${GOPATH}/src/github.com/shopkeep/gddo

RUN touch Makefile
RUN make install

# How to start it all.
CMD ["gddo"]
