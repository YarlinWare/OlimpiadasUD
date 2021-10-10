from django.db import models
import campus
import users

# Equipo
class Equipo(models.Model):
    id_equipo = models.CharField(max_length=3, primary_key=True, null=False, unique=True)
    nom_equipo = models.CharField(max_length=30, null=False)
    n_partes = models.DecimalField(max_digits=4, decimal_places=0, null=False)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    # To do - FOREIGN KEY
    '''
    '''

    def __str__(self):
        """Return name team."""
        return self.nom_equipo

# Deporte2
class Deporte2(models.Model):
    id_deporte = models.CharField(max_length=3, primary_key=True, null=False, unique=True)
    nom_deporte = models.CharField(max_length=30, null=False)
    n_max_integrantes = models.DecimalField(max_digits=2, decimal_places=0, null=False)

    # To do - FOREIGN KEY
    cod_persona_fk  = models.ManyToManyField('users.Persona')

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    # To do - FOREIGN KEY
    '''
    '''

    def __str__(self):
        """Return name sport."""
        return self.nom_deporte

# Estado
class Estado(models.Model):
    id_estado = models.CharField(max_length=2, primary_key=True, null=False, unique=True)
    desc_estado = models.CharField(max_length=30, null=False)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        """Return describe status."""
        return self.desc_estado

# Inventario
class Inventario(models.Model):
    consec_inventario = models.DecimalField(max_digits=4, decimal_places=0, primary_key=True, null=False, unique=True, auto_created=True)
    n_piezas = models.DecimalField(max_digits=3, decimal_places=0, null=False)

    # To do - FOREIGN KEY
    id_complejo_fk  = models.ForeignKey('campus.Sede', on_delete=models.CASCADE, null=False, blank=False)
    id_estado_fk    = models.ForeignKey(Estado, on_delete=models.CASCADE, null=False, blank=False)
    id_equipo_fk    = models.ForeignKey(Equipo, on_delete=models.CASCADE, null=False, blank=False)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        """Return inventary."""
        return str(self.consec_inventario)

# Prestamo
class Prestamo(models.Model):
    consec_prestamo = models.CharField(max_length=3, primary_key=True, null=False, unique=True)
    fecha_prestamo = models.DateTimeField(auto_now=True,editable=True)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    # To do - FOREIGN KEY
    cod_persona_fk          = models.ForeignKey('users.Persona', on_delete=models.CASCADE, null=False, blank=False)
    id_estado_fk            = models.ForeignKey(Estado, on_delete=models.CASCADE, null=False, blank=False)
    consec_inventario_fk    = models.ForeignKey(Inventario, on_delete=models.CASCADE, null=False, blank=False)

    def __str__(self):
        """Return loan."""
        return self.consec_prestamo

# Deporte
class Deporte(models.Model):
    id_deporte = models.CharField(max_length=3, primary_key=True, null=False, unique=True)
    nom_deporte = models.CharField(max_length=30, null=False)
    n_max_integrantes = models.DecimalField(max_digits=2, decimal_places=0, null=False)

    # To do - FOREIGN KEY
    cod_persona_fk  = models.ManyToManyField('users.Persona')
    id_equipo_fk  = models.ManyToManyField(Equipo)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        """Return name sport."""
        return self.nom_deporte
