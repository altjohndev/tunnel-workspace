FROM altjohndev/my-website:release AS release
FROM altjohndev/erlang:alpine

COPY --from=release /app/_build/prod/rel/my_website ./
CMD ["/app/bin/my_website", "start"]
