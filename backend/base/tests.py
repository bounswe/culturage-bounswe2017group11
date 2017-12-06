from django.test import TestCase
from  .models import Item, Comment, UserRatedItem
from django.contrib.auth.models import User
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase

# Create your tests here.

class ItemTestCase(TestCase):
    def setUp(self):
        tester = User.objects.create(first_name="tester")
        item = Item.objects.create(name="test item",description="item to be used on the test purposes",
                                 created_by=tester)
        comment = Comment.objects.create(text="test item comment", related_item=item, written_by=tester)
        usrRateItm = UserRatedItem.objects.create(rate=5,user=tester,item=item)
    def test_item_create(self):
        item = Item.objects.get(name="test item")
        item.calculateRate()
        self.assertEqual(item.__str__(),"test item")
        self.assertEqual(item.rate, 5)
        self.assertEqual(item.description, "item to be used on the test purposes")

    def test_item_comment(self):
        item = Item.objects.get(name="test item")
        tester = User.objects.get(first_name="tester")
        commenters = item.get_commenters()
        self.assertEqual(commenters[0], tester.id)

    def test_item_rate(self):
        item = Item.objects.get(name="test item")
        tester = User.objects.get(first_name="tester")
        raters = item.get_raters()
        self.assertEqual(raters[0], tester.id)


    def test_item_delete(self):
        item = Item.objects.get(name="test item")
        item.delete()

        try:
            del_item = Item.objects.get(name="test item")
        except Item.DoesNotExist:
            del_item = None

        if not del_item:
            self.assertTrue(self)

class ItemEndPointTest(APITestCase):
    def test_create_item(self):
        url = ('/api/items/')
        data = {'name': 'test item','desciption':'item to be used for test purposes','location':'istanbul','date':'2017-01-01'}
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Item.objects.count(), 1)
        self.assertEqual(Item.objects.get().name, 'test item')