all:
	docker build -t bexio/bitcoind .

push: all
	docker push bexio/bitcoind:latest
