FROM python:3.12-slim
# Installer python3-venv pour créer un environnement virtuel
RUN apt-get update && apt-get install -y python3-venv gcc libc-dev && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir --upgrade pip
RUN mkdir -p /app
COPY api.py /app/
COPY marina /app/
WORKDIR /app
# Créer un environnement virtuel
RUN python3 -m venv /app/venv
# Mettre à jour PATH pour utiliser l'environnement virtuel
ENV PATH="/app/venv/bin:$PATH"
# Installer Flask dans l'environnement virtuel
RUN pip install --no-cache-dir flask
RUN chmod +x /app/marina
EXPOSE 5000
CMD ["python3", "api.py"]
