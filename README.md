# Olimpiadas UD
## Bases de Datos I 2021-1 Grupo-81


Proyecto final para la asignatura Bases de Datos 1.


### Crear entorno virtual

```
$ virtualenv env
```

### Activar entorno virtual

#### En linux
```
$ souce env/bin/activate
```
#### En windows
```
$ souce env/Scripts/activate
```
#### Installar dependencias con el entorno activado
```
(env)$ pip install -r requirements.txt
```
### Ejecutar proyecto

Creación de script de los modelos

```
$ python manage.py makemigrations
$ python manage.py makemigrations campus sports users
```

Ejecución de script dentro de la base de datos

```
$ python manage.py migrate
```

Ejecutar proyecto

```
$ python manage.py runserver
```

### Crear usuarios o superususarios desde la terminal/consola

```
$ python manage.py createsuperuser
```
```
$ python manage.py createuser
```

### Ruta de Administrador

```
http://localhost:8000/admin/
```

# Lista de rutas

| Sección  |  Ruta | url |
| ------------ | ------------ | ------------ |
| Admin | admin/ | http://localhost:8000/admin/ |
| Users | login/ | http://localhost:8000/login/ |
| Users | logout/ | http://localhost:8000/logout/ |
| Users | signup/ | http://localhost:8000/signup/ |
| Campus | events/ | http://localhost:8000/campus/events |


# Usuaros de prueba

| usuario  |  contraseña |
| ------------ | ------------ |
| admin | admin |

# Información

| Nombre  |  Email |
| ------------ | ------------ |
|  Cristhian Yara |  cmyarap@gmail.com |