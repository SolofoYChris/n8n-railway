# Use official image n8n
FROM n8nio/n8n:latest

# Switch to root to install the utility
USER root

# Install the basic utilities
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    nano \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create working folder for data n8n
RUN mkdir -p /home/node/.n8n

# Assign rights to node user
RUN chown -R node:node /home/node/.n8n

# Switch back to node user
USER node

# Install working director
WORKDIR /home/node
EXPOSE 5678
CMD ["n8n"]