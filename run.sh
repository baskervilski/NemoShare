gunicorn --bind 0.0.0.0:8000 nemo_share:app --daemon --reload

# docker run -dp 5057:8000 -it -v "$(pwd)/:/app/" nemo-share