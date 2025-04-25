#!/bin/sh

# Исправляем права на папку /home/node/.n8n если они неправильные
if [ -d /home/node/.n8n ]; then
    echo "Fixing permissions for /home/node/.n8n"
    chown -R node:node /home/node/.n8n
fi

# Если нужен симлинк для второго mount path
if [ ! -d /data ]; then
    ln -s /home/node/.n8n /data
fi

# Запускаем n8n
exec n8n