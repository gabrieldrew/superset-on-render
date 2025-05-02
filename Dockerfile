# Dockerfile

FROM apache/superset:latest

# Install PostgreSQL client libraries and build tools for psycopg2
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libpq-dev \
        build-essential && \
    pip install psycopg2-binary && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Restore default user
USER superset

# Superset Secret Key
ENV SUPERSET_SECRET_KEY="UANgblsBYk4cW9mvAFN07dFY1-9g72CGzEG6v78l13wFYGs_h3LWCoNyByn2YanEvXQex6vPjQgG0r5Yvhsu5A"

# Expose port for Render
EXPOSE 8088

# Initialize and run Superset
CMD /bin/bash -c "\
  superset db upgrade && \
  superset fab create-admin \
    --username admin \
    --firstname Superset \
    --lastname Admin \
    --email admin@superset.com \
    --password admin && \
  superset init && \
  superset run -h 0.0.0.0 -p 8088"
