FROM ubuntu_go

RUN cd $GOPATH/src/ && \
	git clone https://github.com/huygaa11/devstats-example.git devstats-example

RUN cd data/dev/src/ && \
	grep -rl 'postgres psql' . | xargs sed -i 's/postgres psql/postgres psql -h postgres/g' && \
	grep -rl 'postgres pg_dump' . | xargs sed -i 's/postgres pg_dump/postgres pg_dump -h postgres/g'
