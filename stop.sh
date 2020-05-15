kill -9 `ps aux | grep gunicorn | grep nemo_share | awk '{ print $2 }'`  # will kill all of the workers
