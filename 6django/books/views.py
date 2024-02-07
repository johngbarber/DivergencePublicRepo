from django.views.generic import ListView
from .models import Book

class BookListView(ListView):
    model = Book
    template_name = 'book_list.html'  # Your template path
    context_object_name = 'book_list'  # Context variable to use in your template. By default, it's object_list if not specified.
