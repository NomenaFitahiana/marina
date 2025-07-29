FROM ubuntu:24.04
RUN apt-get update && apt-get install -y python3 python3-pip && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /app
COPY api.py /app/
COPY requirements.txt /app/
COPY marina /app/
RUN pip3 install -r /app/requirements.txt
WORKDIR /app
RUN chmod +x /app/marina
EXPOSE 5000
CMD ["python3", "api.py"]
