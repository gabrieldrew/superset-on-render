FROM apache/superset:latest

ENV SUPERSET_SECRET_KEY="UANgblsBYk4cW9mvAFN07dFY1-9g72CGzEG6v78l13wFYGs_h3LWCoNyByn2YanEvXQex6vPjQgG0r5Yvhsu5A"

EXPOSE 8088

CMD ["superset", "run", "-h", "0.0.0.0", "-p", "8088"]
