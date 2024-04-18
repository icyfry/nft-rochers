FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl git ca-certificates unzip sudo \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash foundryuser && \
    usermod -aG sudo foundryuser && \
    echo "foundryuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#RUN git config --global --add safe.directory /home/foundryuser/app

USER foundryuser
WORKDIR /home/foundryuser

# Foundry
RUN curl -L https://foundry.paradigm.xyz | bash && \
    ~/.foundry/bin/foundryup

# Task
RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/bin

ENV PATH="/home/foundryuser/.foundry/bin:/home/foundryuser/.local/bin:${PATH}"

RUN mkdir -p /home/foundryuser/app/lib
RUN mkdir -p /home/foundryuser/app/out
RUN mkdir -p /home/foundryuser/app/cache

WORKDIR /home/foundryuser/app

CMD ["task", "--version"]
