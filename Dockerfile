
FROM python:alpine3.7 
COPY . /app
WORKDIR /app
RUN apk add --no-cache --virtual .build-deps gcc musl-dev \
     && pip install cython \
     && apk del .build-deps gcc musl-dev
RUN pip install -r requirements.txt 
EXPOSE 5001 
ENTRYPOINT [ "python" ] 
CMD [ "nemo_share.py" ]
