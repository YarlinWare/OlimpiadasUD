# Olimpiadas UD
## Bases de Datos I 2021-1 Grupo-81

#### Proyecto final para la asignatura Bases de Datos 1.


El proyecto actualmente trabaja con el lenguaje de programación de Python y el framework Django adicional maneja otras tecnologías como Bootstrap y en web HTML5 y CSS3.


### Crear Base de Datos

Lo primero es, dentro del gestor de bases de datos crear una nueva base de datos llamada 'olimpiadas_ud'.

### Crear entorno virtual

Crear entorno virtual junto al directorio donde se encuentra el proyecto
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
$ source env/Scripts/activate
```
#### Installar dependencias con el entorno activado

Estando dentro del proyecto Olimpiadas_ud/
```
(env)$ pip install -r requirements.txt
```
### Ejecutar proyecto
Configurar pase de datos en el proyecto Oracle
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.oracle',
        'NAME': 'xe',
        'USER': 'a_user',
        'PASSWORD': 'a_password',
        'HOST': '',
        'PORT': '',
    }
}
```

Configurar pase de datos en el proyecto en PostgreSQL
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'olimpiadas_ud',
        'USER': 'postgres',
        'PASSWORD': '1234',
        'HOST': 'localhost',
        'PORT': '5433',
    }
}
```

Creación de script de los modelos
```
(env)$ python manage.py makemigrations
(env)$ python manage.py makemigrations campus sports users
```

Ejecución de script dentro de la base de datos
```
(env)$ python manage.py migrate
```

Ejecutar proyecto
```
(env)$ python manage.py runserver
```

### Crear usuarios o superususarios desde la terminal/consola
```
(env)$ python manage.py createsuperuser
```
```
(env)$ python manage.py createuser
```
### Carga de datos

Para la carga de datos, puede ingresar a la carpeta que se encuentra en :

 OlimpiadasUD/statics/scripts/
 
 y ejecutar los scripts correspondientes a la base de datos deseada
 
### Ruta de Administrador

 <http://localhost:8000/admin/>

## Diagrama

![](https://github.com/YarlinWare/OlimpiadasUD/blob/master/static/img/Olimpiadas_ud.jpeg)

> Diagrama Base de Datos Olimpiadas_ud


# Lista de rutas

El sistema de rutas actualmente vigentes son:

| Sección  |  Ruta | URL |
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



