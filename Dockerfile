FROM python:3.11-alpine

# The monitor uses docker exec to query nvidia-smi in the llama-swap
# container when it runs in a separate container.
RUN apk add --no-cache docker-cli procps

WORKDIR /app

COPY index.html serve.py ./

ENV PYTHONUNBUFFERED=1 \
    PORT=8090 \
    POWER_DB=/app/data/power.db

VOLUME ["/app/data"]

EXPOSE 8090

CMD ["sh", "-c", "exec python3 serve.py --host 0.0.0.0 --port ${PORT}"]
