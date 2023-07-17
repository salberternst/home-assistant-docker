FROM ghcr.io/home-assistant/home-assistant:2023.7

ARG HA_THINGSBOARD_VERSION=0.0.2

RUN mkdir -p /config/python_scripts \
    && mkdir -p /config/custom_components

RUN cd /config/python_scripts \
    && wget https://raw.githubusercontent.com/bieniu/ha-shellies-discovery/4.2.0/python_scripts/shellies_discovery.py

RUN cd /config/custom_components \
    && wget https://github.com/salberternst/ha_thingsboard/archive/refs/tags/v${HA_THINGSBOARD_VERSION}.tar.gz -O ha_thingsboard.tar.gz \
    && tar xzf ha_thingsboard.tar.gz \
    && mv ha_thingsboard-${HA_THINGSBOARD_VERSION}/thingsboard/ . \
    && rm -rf ha_thingsboard-${HA_THINGSBOARD_VERSION} \
    && rm ha_thingsboard.tar.gz

COPY ./config /config
