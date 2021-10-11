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
	list_display = ('consec_inventario', 'n_piezas','id_complejo_fk', 'id_estado_fk', 'id_equipo_fk')
	readonly_fields = ('created', 'updated')
	list_display_links = ()
	ordering = ('id_complejo_fk', 'id_equipo_fk')

class PrestamoAdmin(admin.ModelAdmin):
	list_display = ('consec_prestamo', 'fecha_prestamo','cod_persona_fk', 'id_estado_fk', 'consec_inventario_fk')
	list_display_links = ('consec_prestamo', 'fecha_prestamo', )
	ordering = ('fecha_prestamo', 'cod_persona_fk')
	readonly_fields = ('created', 'updated')

admin.site.register(Deporte, DeporteAdmin)
admin.site.register(Deporte2, Deporte2Admin)
admin.site.register(Equipo, EquipoAdmin)
admin.site.register(Estado, EstadoAdmin)
admin.site.register(Inventario, InventarioAdmin)
admin.site.register(Prestamo, PrestamoAdmin)