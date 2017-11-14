from django.shortcuts import render
from django.http import HttpResponse, JsonResponse

# Create your views here.


# class searchItem(APIView):
# 	def get(self, request):
# 		data = JSONParser().parse(request)
# 		query = data.get("query")
# 		users = Item.objects.filter(Q(name__icontains=query) | Q(description__icontains=query))
# 		serializer = NewsfeedSerializer(users, many=True, context={'request': request})
# 		return Response(serializer.data)

def searchItem(request):
	"""
    API endpoint that search items.
    """
	if request.method == 'GET':
		return JsonResponse('Naber', status=200)
	return HttpResponse("POST method not allowed")

def searchUser(request):
	"""
    API endpoint that search users.
    """
	if request.method == 'GET':
		return JsonResponse('Naber', status=200)
	return HttpResponse("POST method not allowed")

def searchLocation(request):
	"""
    API endpoint that search locations.
    """
	if request.method == 'GET':
		return JsonResponse('Naber', status=200)
	return HttpResponse("POST method not allowed")
