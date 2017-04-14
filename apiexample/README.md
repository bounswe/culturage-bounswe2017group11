## How to Use
To use this project, follow these steps:
1. Clone project to local.
2. Install Python 3
3. Install Virtualenv (`$ pip3 install virtualenv`)
4. Switch to venv
    * If you are using Windows (`$ venv\Scripts\activate`)
    * If you are using UNIX (`$ source venv/bin/activate`)
5. Install dependencies locally (`$ pip3 install -r requirements.txt`)
6. Run server locally (`$ python3 manage.py runserver`)
7. If you get success message, server’s running, visit `http://127.0.0.1:8000/`

## How to Write
1. Check out `http://127.0.0.1:8000/example` path. It comes from `def example(request)` method at `twitter/views.py`
2. Add your endpoint to `twitter/urls.py`
3. Add your function to `twitter/views.py`
4. More info for [Django](https://docs.djangoproject.com/en/1.11/intro/tutorial01/)
5. More info for [Tweepy](http://tweepy.readthedocs.io/en/v3.5.0/getting_started.html)
