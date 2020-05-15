# NemoShare
A simple file sharing application.

**Motivating use case**
People send you data to analyze/crunch via email, or share it with you via SharePoint, ShareDrive, OneDrive, ... then you have to manually upload that data to your Workbench/Analytical Server, just to run a script and send the result back to them. Hell on Earth v2.0.

Using this app, you give the user the options to:
- upload data directly to your Workbench/Server,
- retrieve the results directly and almost immediately (depending on how fast your code is, bucko).

And everyone's happy.

Of course, you need to setup an independent app that reads, processes and writes back the data -- this just gives you a general purpose "inbox" and "outbox".

## Setup & Deployment

1. Clone repo to the target machine
2. Setup a virtual environment (use requirements.txt)
3. Activate the virtual environment
4. run `bash run.sh` to start the gunicorn server.
  - It will run as a background process (`--daemon`), so you can freely log out.
  - It will listen for code changes (`--reload`) and automatically reload the app.
5. run `bash stop.sh` to stop the server. It will look for process ids of the gunicorn workers and kill 'em all.

## Usage

1. The user navigates to the `<your_server_url>/upload` endpoint, where he uploads the file(s) he wants to have processed.
- as mentioned above, it's up to you to run the listening and data processing app, which writes back the results to the sharing outbox folder.
2. The user downloads the files using the `<your_server_url>/download/<result_filename>`.
- in this simplest version of the app, the user needs to know the exact filename in advance, there are no fancy interfaces at this point, but feel free to develop one.

Share & enjoy!
