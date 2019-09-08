from flask import Flask
from flask_cors import CORS
from os import urandom, environ
import datetime as dt


''' Flask Server Configuration '''
flask_server = Flask(__name__)
flask_server.config['SECRET_KEY'] = urandom(16)
CORS(flask_server)

''' Flask Server Routes '''
@flask_server.route("/", methods=['GET', 'POST'])
def root():
    #now = dt.datetime.utcnow() - dt.timedelta(hours=3)
    #now_str = dt.datetime.strftime(now, "%H:%M:%S - %d/%m/%Y")
    return str(environ.get("PORT", 5000))

''' Running Flask Server '''
if __name__ == '__main__':
    flask_server.run(
        host="0.0.0.0", 
        port=int(environ.get("PORT", 5000)), 
        debug=True
    )