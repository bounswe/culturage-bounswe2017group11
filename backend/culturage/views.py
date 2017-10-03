from django.http import HttpResponse

def index(request):
    return HttpResponse("Congratulations. It's worked.<br><h2>Welcome to <strong>Culturage</strong></h2>")
