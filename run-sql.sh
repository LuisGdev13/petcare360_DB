#!/bin/sh
set -eu

if [ -z "${ORACLE_DB_USERNAME:-}" ]; then
    echo "Erro: informe ORACLE_DB_USERNAME."
    exit 1
fi

if [ -z "${ORACLE_DB_PASSWORD:-}" ]; then
    echo "Erro: informe ORACLE_DB_PASSWORD."
    exit 1
fi

if [ -n "${ORACLE_DB_CONNECT_STRING:-}" ]; then
    CONNECT_STRING="$ORACLE_DB_CONNECT_STRING"
elif [ -n "${ORACLE_DB_URL:-}" ]; then
    CONNECT_STRING="$(echo "$ORACLE_DB_URL" | sed 's#^jdbc:oracle:thin:@##')"
else
    echo "Erro: informe ORACLE_DB_CONNECT_STRING ou ORACLE_DB_URL."
    exit 1
fi

echo "Executando javasprint3.sql no banco Oracle..."
sql -L "$ORACLE_DB_USERNAME/$ORACLE_DB_PASSWORD@$CONNECT_STRING" "@/scripts/javasprint3.sql"
echo "Script finalizado."
