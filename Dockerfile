FROM ubuntu:22.04


RUN apt-get update && apt-get upgrade -y

# install useful command 
RUN apt-get install wget curl tree bat git ripgrep -y

CMD ["bash.sh"]
