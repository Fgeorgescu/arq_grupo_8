# Azamon infrastructure repository

Hosting all stacks of clients that use our CI/CD

|Client|Status|
|Overall|[![infracost](https://img.shields.io/endpoint?url=https://dashboard.api.infracost.io/shields/json/5ce9fe34-ea56-400f-a304-ea208ebafad2/repos/7f9acabd-d2c7-4ea0-9d92-e1a73f3f01cc/branch/b28be4bb-e410-49ac-8e02-6cc17fb4186a)](https://dashboard.infracost.io/org/fgeorgescu94/repos/7f9acabd-d2c7-4ea0-9d92-e1a73f3f01cc?tab=settings)|
|Azamon|[![infracost](https://img.shields.io/endpoint?url=https://dashboard.api.infracost.io/shields/json/5ce9fe34-ea56-400f-a304-ea208ebafad2/repos/7f9acabd-d2c7-4ea0-9d92-e1a73f3f01cc/branch/b28be4bb-e410-49ac-8e02-6cc17fb4186a/stacks-modules)](https://dashboard.infracost.io/org/fgeorgescu94/repos/7f9acabd-d2c7-4ea0-9d92-e1a73f3f01cc?tab=settings)|

# Configuración del entorno de github
Antes de empezar con la demo o a trabajar, es necesario configurar el entorno del LAB de AWS, asi como las credenciales de la cuenta para que Github Actions pueda conectarse con el mismo

1. Iniciar el Lab de AWS
2. Obtener las credenciales
3. Sumar las credenciales como secrets en Github


# Crear un nuevo stack:
```shell
terramate create \
  --name "Bob" \
  --description "Bob's first stack" \
  stacks/bob
```




