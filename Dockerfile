FROM eclipse-temurin:21-jre

WORKDIR /scripts

RUN apt-get update \
    && apt-get install -y curl unzip \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fsSL https://download.oracle.com/otn_software/java/sqldeveloper/sqlcl-latest.zip -o /tmp/sqlcl.zip \
    && unzip -q /tmp/sqlcl.zip -d /opt \
    && rm /tmp/sqlcl.zip

ENV PATH="/opt/sqlcl/bin:$PATH"

COPY script_bd.sql /scripts/script_bd.sql
COPY run-sql.sh /scripts/run-sql.sh

RUN chmod +x /scripts/run-sql.sh

ENTRYPOINT ["/scripts/run-sql.sh"]