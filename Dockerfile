FROM ocaml/opam:ubuntu-24.04-ocaml-5.2
RUN sudo apt-get update && sudo apt-get install -y git make python3 python3-pip && sudo rm -rf /var/lib/apt/lists/*
RUN opam update && opam install -y ocamlfind ounit2
RUN git clone https://github.com/hei-school/marina.git /app/marina
WORKDIR /app/marina
RUN make
COPY api.py /app/
RUN pip3 install flask
WORKDIR /app
EXPOSE 5000
CMD ["python3", "api.py"]
