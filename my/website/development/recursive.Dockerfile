FROM altjohndev/my-website:development

RUN rm -rf assets/css assets/js assets/static assets/vendor config

COPY assets assets
COPY config config
COPY mix.exs mix.lock ./

RUN mix deps.get && \
    cd assets && \
      yarn install && \
      node node_modules/webpack/bin/webpack.js --mode development
