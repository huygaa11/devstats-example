FROM ubuntu_go

RUN cd $GOPATH/src/ && \
	git clone https://github.com/huygaa11/devstats-example.git devstats-example

RUN cd data/dev/src/ && \
	grep -rl 'postgres psql' . | xargs sed -i 's/postgres psql/postgres PGPASSWORD=$PGPASSWORD psql -h $PG_HOST/g'
