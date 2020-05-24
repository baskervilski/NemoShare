
FROM python:3.8-slim
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 5001 
#ENTRYPOINT [ "gunicorn" ] 
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "nemo_share:app"]
