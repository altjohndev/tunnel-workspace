FROM altjohndev/my-website:test

RUN rm -rf config lib priv test

COPY config config
COPY lib lib
COPY priv priv
COPY test test
COPY .formatter.exs mix.exs mix.lock ./

RUN mix deps.get
