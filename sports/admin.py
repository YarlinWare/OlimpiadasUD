from django.contrib import admin

# Register your models here.
from sports.models import Deporte, Deporte2, Equipo, Estado, Inventario, Prestamo

class DeporteAdmin(admin.ModelAdmin):
	readonly_fields = ('created', 'updated')

class Deporte2Admin(admin.ModelAdmin):
	readonly_fields = ('created', 'updated')

class EquipoAdmin(admin.ModelAdmin):
	readonly_fields = ('created', 'updated')

class EstadoAdmin(admin.ModelAdmin):
	readonly_fields = ('created', 'updated')

class InventarioAdmin(admin.ModelAdmin):
	readonly_fields = ('created', 'updated')

class PrestamoAdmin(admin.ModelAdmin):
	readonly_fields = ('created', 'updated')


admin.site.register(Deporte, DeporteAdmin)
admin.site.register(Deporte2, Deporte2Admin)
admin.site.register(Equipo, EquipoAdmin)
admin.site.register(Estado, EstadoAdmin)
admin.site.register(Inventario, InventarioAdmin)
admin.site.register(Prestamo, PrestamoAdmin)