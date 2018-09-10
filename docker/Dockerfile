FROM ubuntu_go

RUN cd $GOPATH/src/ && \
	git clone https://github.com/huygaa11/devstats-example.git devstats-example

# RUN cd $GOPATH/src/devstats-example && \
#	PG_PASS=p PG_PASS_RO=p PG_PASS_TEAM=p ./deploy.sh

RUN cd data/dev/src/ && \
	grep -rl 'postgres psql' . | xargs sed -i 's/postgres psql/postgres psql -h postgres/g' && \
	grep -rl 'postgres pg_dump' . | xargs sed -i 's/postgres pg_dump/postgres pg_dump -h postgres/g'

RUN apt-get install -y vim libfontconfig wget
RUN apt-get update -y
RUN wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_5.2.4_amd64.deb
RUN sudo dpkg -i grafana_5.2.4_amd64.deb


#ENTRYPOINT cd data/dev/src/devstats-example && PG_PASS=p PG_PASS_RO=p PG_PASS_TEAM=p PG_HOST=postgres PGHOST=postgres ./deploy.sh && /bin/bash

#RUN cd data/dev/src/devstats-example && \
#	PG_PASS=p PG_PASS_RO=p PG_PASS_TEAM=p PG_HOST=postgres PGHOST=postgres ./deploy.sh && \
#	./devel/drop_ts_tables.sh beam && \
#	PG_PASS=p PG_PASS_RO=p PG_PASS_TEAM=p PG_HOST=postgres PGHOST=postgres ./run.sh && \
#	PG_PASS=p PG_PASS_RO=p PG_PASS_TEAM=p PG_HOST=postgres PGHOST=postgres ./deploy.sh
