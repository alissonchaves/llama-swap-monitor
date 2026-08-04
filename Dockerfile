FROM python:3.11-alpine

WORKDIR /app

COPY index.html serve.py ./

ENV PYTHONUNBUFFERED=1 \
    PORT=8090 \
    POWER_DB=/app/data/power.db

VOLUME ["/app/data"]

EXPOSE 8090

CMD ["sh", "-c", "exec python3 serve.py --host 0.0.0.0 --port ${PORT}"]
