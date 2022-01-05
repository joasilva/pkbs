FROM alpine

WORKDIR /usr/src/app

COPY ./Dockerfile ./dispatcher.py ./worker.py ./qstat.py ./requirements.txt ./

# Additional packages can be plugged in here
RUN apk add --no-cache python3 py3-pip py3-requests libmagic logger \
    build-base gnuplot && \
	pip3 install -r requirements.txt && \
    rm -fr /root/.cache

CMD ["./worker.py"]
