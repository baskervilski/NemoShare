import os
from flask import Flask, send_file, url_for, request
from werkzeug.utils import secure_filename

uploads_folder = './inbox/'
downloads_folder = './outbox/'

PORT = 5057

app = Flask(__name__)

os.mkdir(uploads_folder, exist_ok=True)
os.mkdir(downloads_folder, exist_ok=True)

app.config['UPLOAD_FOLDER'] = uploads_folder


@app.route('/')
def main():
    return "NemoShare, FTW!"


@app.route('/download/<filename>')
def download(filename):
    # flask.send_files('')
    return send_file('../data/' + filename)


@app.route('/upload')
def upload():
    # flask.send_files('')
    return f"""<html>
               <body>
                  <form action = { url_for('upload_file')} method = "POST" 
                     enctype = "multipart/form-data">
                     <input type = "file" name = "file" />
                     <input type = "submit"/>
                  </form>   
               </body>
            </html>
            """


@app.route('/uploader', methods = ['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        f = request.files['file']
        f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
        return 'file uploaded successfully'


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=PORT)
