# Use official Python slim image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements first (Docker layer caching)
COPY requirements.txt .

# Install packages with trusted hosts to avoid SSL issues
RUN python3 -m pip install --upgrade pip && \
    pip install --no-cache-dir \
        --trusted-host pypi.org \
        --trusted-host files.pythonhosted.org \
        -r requirements.txt

# Copy the Flask app
COPY app.py .

# Expose port
EXPOSE 5000

# Default environment variable (can override with -e)


# Run Gunicorn with 4 workers
CMD ["gunicorn", "-w", "8", "-b", "0.0.0.0:5000", "app:app"]
