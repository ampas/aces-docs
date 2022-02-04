FROM squidfunk/mkdocs-material

WORKDIR /tmp
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
WORKDIR /docs