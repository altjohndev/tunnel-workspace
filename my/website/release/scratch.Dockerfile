FROM altjohndev/phoenix:alpine

ARG SECRET_KEY_BASE

COPY config config
COPY lib lib
COPY priv priv
COPY mix.exs mix.lock ./

RUN mix deps.get && \
    mix deps.compile

COPY assets assets

RUN cd assets && \
    yarn install && \
    yarn run deploy

RUN mix phx.digest && \
    mix compile && \
    mix release my_website
