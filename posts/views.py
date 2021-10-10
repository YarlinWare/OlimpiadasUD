from django.http.response import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth.decorators import login_required

from datetime import datetime
# Create your views here.
@login_required
def posts_views(request):
    return render(request, 'posts/feed.html')