from base.models import Item
from base.models import Tag
from base.serializers import NewsfeedSerializer
from base.serializers import TagSerializer
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status

class ItemsByTag(APIView):
	"""
    API endpoint that search items.
    """
	def get(self, request):
		query = request.GET.get('q', '')
		try:
			tag = Tag.objects.filter(name=query).first()
		except Tag.DoesNotExist:
			tag = None

		if not tag:
			return Response({"error" : "This tag is not found in our app"}, status=status.HTTP_404_NOT_FOUND)

		items = tag.item_set
		# Item.objects.order_by('-created_at').filter(Q(name__icontains=query) | Q(description__icontains=query))
		items = NewsfeedSerializer.setup_eager_loading(items)  # Set up eager loading to avoid N+1 selects
		serializer = NewsfeedSerializer(items, many=True, context={'request': request})
		return Response(serializer.data)
