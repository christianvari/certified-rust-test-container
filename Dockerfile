FROM registry.access.redhat.com/ubi8/ubi-minimal

LABEL maintainer="info@christianvari.dev"

COPY entrypoint.sh .

ENV RUST_BACKTRACE=1
ENV PATH=/root/.cargo/bin:$PATH

RUN microdnf install -y gcc openssl-devel

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y

RUN cargo install cargo-audit && \
    cargo install cargo-tarpaulin

RUN mkdir test && chmod +x entrypoint.sh

CMD ["./entrypoint.sh"]