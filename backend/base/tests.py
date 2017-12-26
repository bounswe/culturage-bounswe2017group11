from django.test import TestCase
from  .models import Item, Comment, UserRatedItem
from django.contrib.auth.models import User
from django.urls import reverse
from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.test import APIRequestFactory
from rest_framework.test import APITestCase
from rest_framework.test import force_authenticate
from rest_framework.test import APIClient

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

class CommentTestCase(TestCase):
    def test_comment_create(self):
        user = User.objects.create(first_name="tester")
        item = Item.objects.create(name="test item", description="item to used on the test purposes", created_by=user)
        comment = Comment.objects.create(text="test item comment", related_item=item, written_by=user)
        self.assertEqual(item.get_commenters()[0] ,user.id)
        self.assertEqual(Comment.objects.count(),1)

    def test_comment_delete(self):
        user = User.objects.create(first_name="tester")
        item = Item.objects.create(name="test item", description="item to used on the test purposes",created_by=user)
        comment = Comment.objects.create(text="test item comment", related_item=item, written_by=user)
        comment.delete()
        try:
            del_comment = Comment.objects.get(text="test item comment")
        except Comment.DoesNotExist:
            del_comment= None

        if not del_comment:
            self.assertTrue(self)

    def test_item_delete(self):
        user = User.objects.create(first_name="tester")
        item = Item.objects.create(name="test item", description="item to used on the test purposes", created_by=user)
        comment = Comment.objects.create(text="test item comment", related_item=item, written_by=user)
        item.delete
        try:
            del_comment = Comment.objects.get(text="test item comment")
        except Comment.DoesNotExist:
            del_comment= None

        if not del_comment:
            self.assertTrue(self)

    def test_user_delete(self):
        user = User.objects.create(first_name="tester")
        item = Item.objects.create(name="test item", description="item to used on the test purposes", created_by=user)
        comment = Comment.objects.create(text="test item comment", related_item=item, written_by=user)
        user.delete()
        try:
            del_comment = Comment.objects.get(text="test item comment")
        except Comment.DoesNotExist:
            del_comment= None

        if not del_comment:
            self.assertFalse(self)




class ItemEndPointTest(APITestCase):

    def setUp(self):
        self.client = APIClient()
        self.user = User.objects.create(username='tester', email='terster@test.com', password='tester123')
        self.token = Token.objects.create(user=self.user)

    def test_create_item(self):
        self.client.force_login(user=self.user)
        url = ('/api/items/')
        data = {'name': 'test item','desciption':'item to be used for test purposes'}
       # response = self.client.post(url, data, format='json', HTTP_AUTHORIZATION=self.token)
       # self.assertEqual(response.status_code, status.HTTP_201_CREATED)
       # self.assertEqual(Item.objects.count(), 1)
       # self.assertEqual(Item.objects.get().name, 'test item')