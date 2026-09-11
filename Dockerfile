FROM eclipse-temurin:21-jre-alpine

WORKDIR /scripts

RUN apk add --no-cache curl unzip \
    && curl -fsSL https://download.oracle.com/otn_software/java/sqldeveloper/sqlcl-latest.zip -o /tmp/sqlcl.zip \
    && unzip -q /tmp/sqlcl.zip -d /opt \
    && ln -s /opt/sqlcl/bin/sql /usr/local/bin/sql \
    && rm /tmp/sqlcl.zip

COPY script_bd..sql /scripts/script_bd.sql
COPY run-sql.sh /scripts/run-sql.sh

RUN chmod +x /scripts/run-sql.sh

ENTRYPOINT ["/scripts/run-sql.sh"]
