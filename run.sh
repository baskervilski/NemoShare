gunicorn --bind 0.0.0.0:5057 nemo_share:app \
    --daemon \ # for running in the background
    --reload   # for automatic reload on detected code changes
