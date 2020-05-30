
# https://jdbc.postgresql.org/download.html
# https://www.jooq.org/doc/3.11/manual/getting-started/tutorials/jooq-in-7-steps/jooq-in-7-steps-step3/
# https://www.jooq.org/doc/3.12/manual/code-generation/codegen-advanced/codegen-config-generate/codegen-generate-annotations/

.PHONY: jooq-codegen
jooq-codegen:
				java \
				-cp "./deps/jooq/jOOQ-lib/*:./deps/jars/*:." \
				org.jooq.codegen.GenerationTool jooq-codegen.xml

.PHONY: up
up:
				docker-compose -f docker-compose.yaml up -d

.PHONY: up-fresh
up-fresh:
				docker-compose -f docker-compose.yaml up --build

.PHONY:down
down:
				docker-compose -f docker-compose.yaml down

.PHONY: pgsh
pgsh:
				docker exec -it envx_pgsrv_1 psql -U postgres

.PHONY: liquibase
liquibase:
				./deps/liquibase/liquibase update

