from flask import Flask, render_template, request
import os

app = Flask(__name__, 
    template_folder=os.path.abspath('frontend/template'),
    static_folder=os.path.abspath('frontend/static'))

@app.route('/', methods=["GET", "POST"])
def index():
    return render_template('index.html')

@app.route('/main', methods=["GET", "POST"])
def main():
    r = request.form.get("q")
    return render_template('main.html', r=r)

@app.route('/store_money', methods=["GET", "POST"])
def store_money():
    return render_template('store_money.html')

@app.route('/transfer_money', methods=["GET", "POST"])
def transfer_money():
    return render_template('transfer_money.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=10000)