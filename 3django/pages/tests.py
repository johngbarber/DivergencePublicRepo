from django.test import SimpleTestCase

# Create your tests here.
class SimpleTestCase(SimpleTestCase):
    def test_home_page_state_code(self):
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)

    def test_about_page_state_code(self):
        response = self.client.get('/about/')
        self.assertEqual(response.status_code, 200)

    def test_contactus_page_state_code(self):
        response = self.client.get('/contactus/')
        self.assertEqual(response.status_code, 200)
