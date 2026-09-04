# Docker para executar o SQL no Azure

Este container executa o arquivo `javasprint3.sql` em um banco Oracle externo.

## Variáveis necessárias

```env
ORACLE_DB_USERNAME=seu_usuario
ORACLE_DB_PASSWORD=sua_senha
ORACLE_DB_CONNECT_STRING=//host:1521/service_name
```

Também pode usar a mesma URL do Spring:

```env
ORACLE_DB_URL=jdbc:oracle:thin:@//host:1521/service_name
```

## Uso local

```bash
docker build -t petcare360-db .

docker run --rm \
  -e ORACLE_DB_USERNAME=seu_usuario \
  -e ORACLE_DB_PASSWORD=sua_senha \
  -e ORACLE_DB_CONNECT_STRING=//host:1521/service_name \
  petcare360-db
```

## Uso no Azure

Use este container como Azure Container Apps Job ou Azure Container Instances.
Ele executa o script SQL e finaliza.
