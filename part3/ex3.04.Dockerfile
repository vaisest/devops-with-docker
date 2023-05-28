FROM docker:git

WORKDIR /usr/src/app
COPY ex3.04.sh .

ENTRYPOINT ["/bin/sh", "/usr/src/app/ex3.04.sh"]