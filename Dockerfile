# build : docker build --tag=git-clone .
# run :     alias gc="boot2docker ssh -t docker run -it --rm -v \\\$SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent git-clone bash"


FROM ubuntu:14.04.1

ADD install.sh /
RUN bash -xe /install.sh


