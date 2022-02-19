FROM ubuntu:xenial

# Install sudo
RUN apt-get update && apt-get install -y sudo

# Add non-root user
RUN addgroup --gid 1000 devuser
RUN adduser --disabled-password --gecos "" --uid 1000 --gid 1000 devuser

# Add user HOME and USER environment variables
ENV HOME /home/devuser
ENV USER devuser

# Add user to sudoers
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to non-root user
WORKDIR "$HOME"
USER devuser

