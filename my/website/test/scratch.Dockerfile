FROM altjohndev/elixir

ENV MIX_ENV=test

COPY config config
COPY lib lib
COPY priv priv
COPY test test
COPY .formatter.exs mix.exs mix.lock ./

RUN mix deps.get && \
    mix deps.compile

CMD [ "sleep", "infinity" ]
