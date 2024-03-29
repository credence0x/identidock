FROM python:3.8
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==0.10.1 uWSGI requests==2.5.1 redis==2.10.3
WORKDIR /app
COPY app /app
COPY cmd.sh / 
RUN chmod +x /cmd.sh
EXPOSE 9090 9191
USER uwsgi
CMD ["/cmd.sh"]

