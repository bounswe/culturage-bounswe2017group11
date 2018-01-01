from django.http import HttpResponse

def index(request):
	html = "<br><br><h1>Welcome to <strong>Culturage Web Service</strong></h1>"
	html += "<h4>Culturage is a crowdsourced website where users can add, view or contribute to items that are considered as cultural heritages.</h4><br><ul>"
	html += "<li>You can see our website at <a target='_blank' href='http://culturage.s3-website-us-east-1.amazonaws.com'>here</a></li><br>"
	html += "<li>You can see Postman API Documentation at <a target='_blank' href='https://documenter.getpostman.com/view/2986669/culturage-api/71FWB4x'>here</a></li><br>"
	html += "<li>You can see Doxygen Documentation at <a target='_blank' href='http://52.90.34.144:85/static/doc/'>here</a></li></ul><br>"
	return HttpResponse(html)
