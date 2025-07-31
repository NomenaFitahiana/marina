FROM ubuntu:24.04
RUN apt-get update && apt-get install -y python3 python3-venv python3-pip gcc libc-dev && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir --upgrade pip
RUN mkdir -p /app
COPY api.py /app/
COPY marina /app/
WORKDIR /app
# Créer un environnement virtuel
RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"
# Installer Flask et gunicorn
RUN pip install --no-cache-dir flask gunicorn
RUN chmod +x /app/marina
EXPOSE 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "api:app"]
