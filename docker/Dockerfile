FROM ubuntu_go

RUN cd $GOPATH/src/ && \
	git clone https://github.com/huygaa11/devstats-example.git devstats-example

# RUN cd $GOPATH/src/devstats-example && \
#	PG_PASS=p PG_PASS_RO=p PG_PASS_TEAM=p ./deploy.sh

RUN cd data/dev/src/ && \
	grep -rl 'postgres psql' . | xargs sed -i 's/postgres psql/postgres psql -h postgres/g' && \
	grep -rl 'postgres pg_dump' . | xargs sed -i 's/postgres pg_dump/postgres pg_dump -h postgres/g'


#ENTRYPOINT cd data/dev/src/devstats-example && PG_PASS=p PG_PASS_RO=p PG_PASS_TEAM=p PG_HOST=postgres PGHOST=postgres ./deploy.sh && /bin/bash

#RUN cd data/dev/src/devstats-example && \
#	PG_PASS=p PG_PASS_RO=p PG_PASS_TEAM=p PG_HOST=postgres PGHOST=postgres ./deploy.sh && \
#	./devel/drop_ts_tables.sh beam && \
#	PG_PASS=p PG_PASS_RO=p PG_PASS_TEAM=p PG_HOST=postgres PGHOST=postgres ./run.sh && \
#	PG_PASS=p PG_PASS_RO=p PG_PASS_TEAM=p PG_HOST=postgres PGHOST=postgres ./deploy.sh
