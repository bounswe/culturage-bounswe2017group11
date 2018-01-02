# Culturage Web Service API User Manual
### Our API base url is [http://52.90.34.144:85](http://52.90.34.144:85)
### You can see Postman API Documentation at [here](https://documenter.getpostman.com/view/2986669/culturage-api/71FWB4x)
### You can see Doxygen Documentation at [here](http://52.90.34.144:85/static/doc/)

Our web service is using `JWT` tokens for authorization.
You can get your token from `api/auth/login` or `api/auth/register` endpoints.
You have to send token in request header via `Authorization` key with `JWT [YOUR_TOKEN]` value.
You can study our API from [Postman Documentation](https://documenter.getpostman.com/view/2986669/culturage-api/71FWB4x)

## Testing API
1. Install [Postman](https://www.getpostman.com) app
2. Import [Culturage Collection](https://raw.githubusercontent.com/bounswe/bounswe2017group11/master/backend/culturage.postman_collection.json) or use "Run in Postman" in [documentation](https://documenter.getpostman.com/view/2986669/culturage-api/71FWB4x)
3. Create a new environment from "_Manage Enviroments_" option
4. Add two key:value pair `url:http://18.220.108.135` and `token:YOUR_TOKEN`
5. You can get token from `login` or `register` endpoint
6. Don't forget to select current environment as environment that you created newly
