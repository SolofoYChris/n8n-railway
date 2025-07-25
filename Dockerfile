ARG NODE_VERSION=20
FROM n8nio/base:${NODE_VERSION}

ARG N8N_VERSION=1.89.2
RUN if [ -z "$N8N_VERSION" ] ; then echo "The N8N_VERSION argument is missing!" ; exit 1; fi

LABEL org.opencontainers.image.title="n8n"
LABEL org.opencontainers.image.description="Workflow Automation Tool"
LABEL org.opencontainers.image.source="https://github.com/n8n-io/n8n"
LABEL org.opencontainers.image.url="https://n8n.io"
LABEL org.opencontainers.image.version=${N8N_VERSION}

ENV N8N_VERSION=${N8N_VERSION}
ENV NODE_ENV=production
ENV N8N_RELEASE_TYPE=stable
RUN set -eux; 	npm install -g --omit=dev n8n@${N8N_VERSION} --ignore-scripts && 	npm rebuild --prefix=/usr/local/lib/node_modules/n8n sqlite3 && 	rm -rf /usr/local/lib/node_modules/n8n/node_modules/@n8n/chat && 	rm -rf /usr/local/lib/node_modules/n8n/node_modules/@n8n/design-system && 	rm -rf /usr/local/lib/node_modules/n8n/node_modules/n8n-editor-ui/node_modules && 	find /usr/local/lib/node_modules/n8n -type f -name "*.ts" -o -name "*.js.map" -o -name "*.vue" | xargs rm -f && 	rm -rf /root/.npm

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENV SHELL /bin/sh
USER node
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
EXPOSE 5678
