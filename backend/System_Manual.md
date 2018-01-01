# Culturage Django App System Manual
### Our API base url is [http://52.90.34.144:85](http://52.90.34.144:85)
### You can see Postman API Documentation at [here](https://documenter.getpostman.com/view/2986669/culturage-api/71FWB4x)
### You can see Doxygen Documentation at [here](http://52.90.34.144:85/static/doc/)

## Requirements
- Python 3

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

## Apache Deployment
1. Follow `Setup Instructions` to step 10
2. Configure your server based on `apache.conf` file

## Sample Data
It has more than 100 cultural heritage items.
1. Import sample data from`sample-data/sample-data.sql` file to your database.
2. Put `sample-data/media` folder to your root directory for sample item images.
