FROM nginx:1.11.6-alpine

COPY default.conf run.sh /app/

EXPOSE 80
CMD /app/run.sh
