FROM rust:alpine3.22 as build
WORKDIR /app
COPY . .
RUN cargo build --release

FROM alpine:3.22
COPY --from=build /app/target/release/api /usr/bin/
EXPOSE 3000
ENTRYPOINT [ "/usr/bin/api" ]
torben@debian-4gb-fsn1-1:~/rust-
