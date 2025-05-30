# Pasos para crear la db plan_2024

## Crear base de datos en SSMS

Creamos **manualmente** la db en SSMS, se va a llamar "**plan_2024**"

_En caso de querer otro nombre luego se debe cambiar el nombre en el ejecutador de SQLCMD_

## Ejecutar código SQLCMD en el cmd

Dentro del cmd nos paramos en el mismo directorio que tengamos el archivo "main sql" en caso contrario no funcionará

    ejemplo: C:Users\UserName\MyProject\

_Dentro de MyProject debería estar el main sql_

Cuando nos aseguremos que estamos en dicha ruta, además de tener el conectado el servidor sql, ejecutamos lo siguiente

### Para windows Authentication

```bash
sqlcmd -S serverName -d plan_2024 -E -i main sql -f 65001
```

### Para SQL Server Authentication

```bash
sqlcmd -S serverName -d plan_2024 -U usuario -P contraseña -i main sql -f 65001
```

En ambos casos **es obligatorio cambiar el "serverName"** por el nombre del servidor

    ejemplo: EQUIPO\SQLEXPRESS

# Modificar evaluaciones

Luego de todo lo anterior, cuando tengamos la db funcionando, podremos modificar nuestras evaluaciones

Para esto existe un archivo llamado **modificaMisEvaluaciones sql** Dentro hay un select para consultar las evaluaciones teniendo en cuenta el dni de una persona

    Ejemplo de devolución:

    id   |   nombre                             |  calificación
    _____|______________________________________|______________
    16   |   Programación I                     |  9
    76   |   Arquitectura y Sistemas Operativos |  8
    136  |   Matemática 1                       |  0
    196  |   Organización empresarial           |  7
    256  |   Programación II                    |  9
    316  |   Probabilidad y Estadística         |  9
    376  |   Base de Datos I                    |  9
    436  |   Inglés I 1                         |  0
