from django.db import models

import users
import sports

# Sede
class Sede(models.Model):
    id_complejo = models.CharField(max_length=5, primary_key=True, null=False, unique=True)
    nom_complejo = models.CharField(max_length=30, )
    presupuesto = models.DecimalField(max_digits=7, decimal_places=2, null=False)
    direccion = models.CharField(max_length=30, null=False)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    # To do - FOREIGN KEY
    '''
    id_unico_fk = models.CharField(max_length=4, null=True)
    id_complejo_fk = models.CharField(max_length=5, null=True)
    '''

    def __str__(self):
        """Return username."""
        return self.nom_complejo

# Unico.
class Unico(models.Model):
    id_unico = models.CharField(max_length=4, primary_key=True, null=False, unique=True)
    area_unico = models.DecimalField(max_digits=7, decimal_places=2, null=False)

    id_complejo_fk = models.OneToOneField(Sede,on_delete=models.CASCADE, null=False, blank=False)
    id_deporte_fk = models.ForeignKey('sports.Deporte',on_delete=models.CASCADE, null=False, blank=False)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        """Return username."""
        return self.area_unico

# Area
class Area(models.Model):
    id_area = models.CharField(max_length=3, primary_key=True, null=False, unique=True)
    nom_area = models.CharField(max_length=10, null=False)
    ubicacion = models.CharField(max_length=30, null=False)

    id_complejo_fk = models.ForeignKey(Sede,on_delete=models.CASCADE,null=False, blank=False)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    # To do - FOREIGN KEY
    '''
    '''

    def __str__(self):
        """Return name area."""
        return self.nom_area

# Polideportivo
class Polideportivo(models.Model):
    id_poli = models.CharField(max_length=4, primary_key=True, null=False, unique=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    id_area_fk = models.ForeignKey(Area,on_delete=models.CASCADE, null=False, blank=False)
    id_deporte_fk = models.ForeignKey('sports.Deporte',on_delete=models.CASCADE,null=False, blank=False)
    # To do - FOREIGN KEY

    def __str__(self):
        """Return ID Poli."""
        return self.id_poli

# Evento
class Evento(models.Model):
    consec_evento = models.DecimalField(max_digits=5, decimal_places=0, primary_key=True, null=False, unique=True, auto_created=True)
    fecha_hora = models.DateTimeField(blank=True)
    duracion = models.TimeField(blank=True)
    n_participante = models.DecimalField(max_digits=3, decimal_places=0, null=False)

    # To do - FOREIGN KEY
    id_complejo_fk	= models.ForeignKey(Sede,on_delete=models.CASCADE, null=False, blank=False)
    id_deporte_fk   = models.ForeignKey('sports.Deporte',on_delete=models.CASCADE, null=False, blank=False)
    id_area_fk      = models.ForeignKey(Area,on_delete=models.CASCADE, null=True, blank=True)
    cod_persona_fk  = models.ForeignKey('users.Persona',on_delete=models.CASCADE, null=False, blank=False)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        """Return username."""
        return self.consec_evento
