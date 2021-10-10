from django.contrib import admin

from .models import Area, Evento, Polideportivo, Sede, Unico

# Register your models here.

class AreaAdmin(admin.ModelAdmin):
	list_display = ('nom_area', 'ubicacion', 'id_complejo_fk_id')
	readonly_fields = ('created', 'updated')

class PolideportivoAdmin(admin.ModelAdmin):
	readonly_fields = ('created', 'updated')

class EventoAdmin(admin.ModelAdmin):
	readonly_fields = ('created', 'updated')

class SedeAdmin(admin.ModelAdmin):
	readonly_fields = ('created', 'updated')


class UnicoAdmin(admin.ModelAdmin):
	readonly_fields = ('created', 'updated')


admin.site.register(Area, AreaAdmin)
admin.site.register(Polideportivo, PolideportivoAdmin)
admin.site.register(Evento, EventoAdmin)
admin.site.register(Sede, SedeAdmin)
admin.site.register(Unico, UnicoAdmin)