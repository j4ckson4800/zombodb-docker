FROM postgres:15-alpine

ENV RUSTFLAGS="-C target-feature=-crt-static"

RUN apk add --no-cache \
  git \
	curl \
	bash \
	ruby-dev \
	ruby-etc \
	musl-dev \
	make \
	gcc \
	coreutils \
	util-linux-dev \
	musl-dev \
	openssl-dev \
	clang-libs \
  clang-dev \
	tar

RUN gem install --no-document fpm

WORKDIR /root

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN cargo install --version 0.9.8 cargo-pgrx

RUN cargo pgrx init --pg15=$(which pg_config)

RUN mkdir -p /zombodb
RUN chmod 777 -R /zombodb
WORKDIR /zombodb

RUN git clone https://github.com/zombodb/zombodb.git --branch v3000.2.3 .

RUN cargo pgrx install --release