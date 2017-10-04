# Culturage Web Service
### You can see demo at [here](http://18.220.108.135)
## How to Use
To use this project, follow these steps:
1. Clone project to local.
2. Install Python 3
3. Install [MySQL](https://dev.mysql.com/doc/refman/5.7/en/installing.html)
4. Install Virtualenv (`$ pip3 install virtualenv`)
5. Create virtual environment for this project (`$ virtualenv venv`)
6. Switch to venv
    * If you are using Windows (`$ venv\Scripts\activate`)
    * If you are using UNIX (`$ source venv/bin/activate`)
7. Install dependencies locally (`$ pip3 install -r requirements.txt`)
8. Copy .env.example (`$ cp .env.example .env`)
9. Set your local environment variables via .env (such as database credentials)
10. Run database migrations (`$ python3 manage.py migrate`)
11. Run server locally (`$ python3 manage.py runserver`)
12. If you get success message, server’s running, visit `http://127.0.0.1:8000/`
