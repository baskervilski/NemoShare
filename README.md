# NemoShare
A simple file sharing application (Flask based)

## Setup

1. Clone repo to the target machine
2. Setup a virtual environment (use requirements.txt)
3. Activate the virtual environment
4. run `bash run.sh` to start the gunicorn server.
 - It will run as a background process (`--daemon`), so you can freely log out.
 - It will listen for code changes (`--reload`) and automatically reload the app.
5. run `bash stop.sh` to stop the server. It will look for process ids of the gunicorn workers and kill 'em all.
