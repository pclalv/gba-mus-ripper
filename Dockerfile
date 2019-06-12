FROM ubuntu as builder

RUN export DEBIAN_FRONTED=noninteractive \
  && apt update \
  && apt -y install g++ gcc make

COPY . /gba-mus-ripper

RUN make -C /gba-mus-ripper

FROM ubuntu

COPY --from=builder /gba-mus-ripper/out/* /usr/local/bin/
