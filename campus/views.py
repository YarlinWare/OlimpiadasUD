from django.shortcuts import render
from campus.models import Evento

# Create your views here.
def events_view(request):
    eventos = Evento.objects.all().order_by('-created')
    return render(request, 'campus/event.html', {'events':eventos})