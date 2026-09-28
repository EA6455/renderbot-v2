# ASTRA6 Rebuilt Smooth - Simple Python, no Wine needed for free access version
FROM python:3.11-slim

WORKDIR /app

# Install Python dependencies only - no Wine/MT5 needed for free access rebuilt version
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt* ./
RUN pip install --no-cache-dir fastapi uvicorn python-dotenv oandapyV20 2>&1 | tail -5 || pip install fastapi uvicorn python-dotenv oandapyV20

COPY . .

EXPOSE 10000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]
