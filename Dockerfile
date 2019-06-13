FROM ubuntu as builder

RUN export DEBIAN_FRONTED=noninteractive \
  && apt update \
  && apt -y install g++ gcc make

COPY . /gba-mus-ripper

RUN make -C /gba-mus-ripper

FROM ubuntu

ENV GOLDENSUN_SYNTH_PATH /goldensun_synth.raw

COPY ./goldensun_synth.raw $GOLDENSUN_SYNTH_PATH

COPY --from=builder /gba-mus-ripper/out/* /usr/local/bin/
