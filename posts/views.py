from django.http.response import HttpResponse, HttpResponseRedirect
from django.shortcuts import render

from datetime import datetime
# Create your views here.

def posts_views(request):
    return render(request, 'feed.html')