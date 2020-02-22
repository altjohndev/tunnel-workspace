FROM altjohndev/my-website:release

ARG SECRET_KEY_BASE

RUN rm -rf assets/css assets/js assets/static assets/vendor config lib priv

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
    mix release my_website --overwrite
