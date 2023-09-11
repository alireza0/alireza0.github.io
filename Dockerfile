FROM klakegg/hugo:ext-ubuntu

RUN apt update && apt install -y git
RUN git config --global --add safe.directory /src
RUN npm install -D autoprefixer
RUN npm install -D postcss-cli

WORKDIR /src

