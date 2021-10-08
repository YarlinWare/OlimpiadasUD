# Olimpiadas UD
## Bases de Datos I 2021-1 Grupo-81


Proyecto final para la asignatura Bases de Datos 1.

### Ejecutar proyecto

```
$ python manage.py makemigrations
```

```
$ python manage.py migrate
```

```
$ python manage.py runserver
```

### Crear usuarios o superususarios

```
$ python manage.py createsuperuser
```
```
$ python manage.py createuser
```

# Lista de rutas

| Sección  |  Ruta |
| ------------ | ------------ |
| API |  /users/api/list_profiles/ |
| Users | login/ |
| Users | logout/ |
| Users | signup/view/ |
| Users | signup/ |
| Users | me/profile/ |
| Users | <str:username>/ |
| Users | Middlewares | me/profile |


# Usuaros de prueba

| usuario  |  contraseña |
| ------------ | ------------ |
| admin | admin |

# Información

| Nombre  |  Email |
| ------------ | ------------ |
|  Cristhian Yara |  cmyarap@gmail.com |