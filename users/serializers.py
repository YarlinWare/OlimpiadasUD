from rest_framework import serializers
from .models import Persona, Tarea, ComisarioEvento, TipoPersona, User

class PersonaSerializer(serializers.ModelSerializer):

    class Meta:
        model = Persona
        fields = '__all__'

class TareaSerializer(serializers.ModelSerializer):

    class Meta:
        model = Tarea
        fields = '__all__'

class ComisarioEventoSerializer(serializers.ModelSerializer):

    class Meta:
        model = ComisarioEvento
        fields = '__all__'


class TipoPersonaSerializer(serializers.ModelSerializer):

    class Meta:
        model = TipoPersona
        fields = '__all__'