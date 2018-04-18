from flask import request, jsonify, session, Flask, render_template, send_from_directory
from flask.views import View

import os

import MySQLdb

import time

flask_app = Flask(__name__, template_folder='view', static_url_path='/static')

db = None
config = {}

@flask_app.route("/")
def hello():
    hasil_query = []
    try:
        cur = db.cursor()

        cur.execute("SELECT * FROM reservasi")

        hasil_query = cur.fetchall()
    except Exception as e:
        pass

    return render_template('index.html', data = hasil_query)

def env_parser():
    with open(".env") as file:  
        data = file.read()
    
    config_parsers = data.split('\n')

    for data_config in config_parsers:
        data = data_config.split('=')
        config[data[0]] = data[1]


if __name__ == '__main__':

    for i in range(0, 2):
        time.sleep(20)
        try:
            db = MySQLdb.connect(host=os.environ['DB_HOST'],    # your host, usually localhost
                        user=os.environ['DB_USERNAME'],         # your username
                        passwd=os.environ['DB_PASSWORD'],  # your password
                        db=os.environ['DB_NAME'])
            break
        except Exception as e:
            raise e
            pass
    
    flask_app.run(debug=True, host= '0.0.0.0', port=80)
