# Pasos para crear la db

## Crear base de datos en SSMS

Creamos **manualmente** la db en SSMS, se va a llamar "**plan_2024**".

_En caso de querer otro nombre luego se debe cambiar el nombre en el ejecutador de SQLCMD._

## Ejecutar código SQLCMD en el cmd

Dentro del cmd nos paramos en el mismo directorio que tengamos el archivo "main.sql" en caso contrario no funcionará.

    ejemplo: C:Users\UserName\MyProject\

_Dentro de MyProject debería estar el main.sql_

Cuando nos aseguremos que estamos en dicha ruta ejecutamos lo siguiente

### Para windows Authentication

    sqlcmd -S serverName -d plan_2024 -E -i main.sql

### Para SQL Server Authentication

    sqlcmd -S serverName -d plan_2024 -U usuario -P contraseña -i main.sql

En ambos casos **es obligatorio cambiar el "serverName"** por el nombre del servidor.

    ejemplo: EQUIPO\SQLEXPRESS
