FROM node:8.11.2

# install chrome for protractor tests
ENV http_proxy=http://172.17.0.1:8118
ENV https_proxy=http://172.17.0.1:8118
RUN echo $https_proxy
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable

WORKDIR /code

# Add dependencies
ADD ./package.json /code
ADD ./bower.json /code
ADD ./gulpfile.js /code
ADD ./.eslintrc /code
ADD ./karma.conf.js /code

# Install Prerequisites
ENV http_proxy=
ENV https_proxy=
RUN npm config set registry http://mirrors.cloud.tencent.com/npm/
RUN npm config get registry
RUN npm install -g bower gulp
RUN npm link gulp

RUN npm cache clean -f
RUN npm install
RUN npm install -g karma-cli
RUN npm install -g qs

ENV http_proxy=http://172.17.0.1:8118
ENV https_proxy=http://172.17.0.1:8118
RUN bower install --allow-root
RUN apt-get install -y libxss1

CMD ["gulp", "dev:runserver"]

EXPOSE 8888
