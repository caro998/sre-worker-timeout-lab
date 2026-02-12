# SRE Worker Timeout Lab

## Overview
This project simulates how slow endpoints impact application reliability 
when running inside Docker using Gunicorn and Flask.

It demonstrates:
- Worker timeouts
- Slow endpoints
- Environment variables
- Debugging with Docker logs

---

## Tech Stack
- Python 3.11
- Flask
- Gunicorn
- Docker

---

## Endpoints

| Endpoint | Description |
|----------|------------|
| `/` | Fast response |
| `/health` | Health check endpoint |
| `/slow` | Simulates delay using environment variable |

---

## Build

docker build -t hello-sre .

---

## Run (Normal)

docker run -d -p 5000:5000 --name hello-sre hello-sre

---

## Run With Delay

docker run -d -p 5000:5000 -e DELAY=40 --name hello-sre hello-sre

If delay exceeds Gunicorn timeout, a 500 error occurs.

---

## Debug

docker logs hello-sre

---

## Key Learning

- Availability vs Reliability
- Worker lifecycle
- Container debugging
- Production-style failure simulation
