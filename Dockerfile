FROM python:3.12-alpine

RUN pip install --no-cache-dir radicale bcrypt

WORKDIR /app


COPY entrypoint.sh .

EXPOSE 5232

ENTRYPOINT ["/app/entrypoint.sh"]
