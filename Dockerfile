FROM ghcr.io/home-assistant/home-assistant:2022.6.1

COPY ./config /config

# COPY ./scripts/entrypoint.sh /entrypoint.sh

# RUN chmod 755 /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]