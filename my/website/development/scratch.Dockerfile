FROM altjohndev/phoenix

COPY assets assets
COPY config config
COPY mix.exs mix.lock ./

RUN mix deps.get && \
    mix deps.compile && \
    MIX_ENV=test mix deps.compile && \
    cd assets && \
      yarn install && \
      node node_modules/webpack/bin/webpack.js --mode development

CMD [ "sleep", "infinity" ]
