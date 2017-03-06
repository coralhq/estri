FROM nginx:1.11.6-alpine

COPY default.conf run.sh /app/

CMD /app/run.sh
