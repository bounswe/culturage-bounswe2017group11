from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
# @csrf_exempt
def index(request):
    return HttpResponse("Çalışıyor. Tebrikler!")
