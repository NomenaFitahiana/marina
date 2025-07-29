FROM ubuntu:24.04
RUN apt-get update && apt-get install -y python3 python3-pip && rm -rf /var/lib/apt/lists/*
COPY api.py /app/
COPY requirements.txt /app/
COPY marina /app/  # Copie le binaire marina depuis le dépôt
RUN pip3 install -r requirements.txt
WORKDIR /app
RUN chmod +x /app/marina  # Assure que le binaire est exécutable
EXPOSE 5000
CMD ["python3", "api.py"]
