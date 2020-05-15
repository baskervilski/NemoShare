
FROM python:alpine3.7 
COPY . /app
WORKDIR /app
RUN apk --update add python py-pip openssl ca-certificates py-openssl wget
RUN apk --update add --virtual build-dependencies libffi-dev openssl-dev python-dev py-pip build-base \
  && pip install --upgrade pip \
  && pip install -r requirements.txt \
  && apk del build-dependencies
EXPOSE 5001 
#ENTRYPOINT [ "gunicorn" ] 
CMD ["gunicorn", "--bind", "0.0.0.0:5057", "nemo_share:app"]
