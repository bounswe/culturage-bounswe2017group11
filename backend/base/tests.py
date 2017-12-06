from django.test import TestCase
from  .models import Item, Comment
from django.contrib.auth.models import User
# Create your tests here.

class ItemTestCase(TestCase):
    def setUp(self):
        tester = User.objects.create(first_name="tester")
        item = Item.objects.create(name="test item",description="item to be used on the test purposes",
                            rate=1, created_by=tester)
        comment = Comment.objects.create(text="test item comment", related_item=item, written_by=tester)

    def test_item_creat(self):
        item = Item.objects.get(name="test item")
        self.assertEqual(item.__str__(),"test item")
        self.assertEqual(item.rate, 1)
        self.assertEqual(item.description, "item to be used on the test purposes")

    def test_item_comment(self):
        item = Item.objects.get(name="test item")
        tester = User.objects.get(first_name="tester")
        commenters = item.get_commenters()
        self.assertEqual(commenters[0], tester.id)

    def test_item_delete(self):
        item = Item.objects.get(name="test item")
        item.delete()

        try:
            del_item = Item.objects.get(name="test item")
        except Item.DoesNotExist:
            del_item = None

        if not del_item:
            self.assertTrue(self)