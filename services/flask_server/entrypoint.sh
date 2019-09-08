#!/bin/sh

echo "Starting Flask Server and Gunicorn..."

gunicorn flask_server:flask_server --config=gunicorn_config.py