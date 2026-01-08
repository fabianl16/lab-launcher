#!/bin/bash
set -e

# Start RabbitMQ in background
rabbitmq-server -detached

echo "[*] Esperando a que RabbitMQ arranque..."
rabbitmqctl await_startup

echo "[*] Importando definiciones..."
rabbitmqctl import_definitions /etc/rabbitmq/definitions.json

echo "[*] Reiniciando RabbitMQ en modo foreground..."
exec rabbitmq-server
