# Culturage Web Service
### You can see demo at [here](http://18.220.108.135)
### You can see API Documentation at [here](https://app.swaggerhub.com/apis/enescakir/culturage/1.0.0)

## How to Use
1. Switch to venv
    * If you are using Windows (`$ venv\Scripts\activate`)
    * If you are using UNIX (`$ source venv/bin/activate`)
2. Reinstall dependencies for any updates (`$ pip3 install -r requirements.txt`)
3. Run database migrations for any change (`$ python3 manage.py migrate`)
4. Run server locally (`$ python3 manage.py runserver`)
5. If you get success message, server’s running, visit `http://127.0.0.1:8000/`

## Testing API
1. Install [Postman](https://www.getpostman.com) app
2. Import [Culturage Collection](https://raw.githubusercontent.com/bounswe/bounswe2017group11/master/backend/culturage.postman_collection)
3. Create a new environment from "_Manage Enviroments_" option
4. Add two key:value pair `url:http://18.220.108.135` and `token:YOUR_TOKEN`
5. You can get token from `login` or `register` endpoint
6. Don't forget to select current environment as environment that you created newly

## How to Setup
To setup this project, follow these steps:
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
