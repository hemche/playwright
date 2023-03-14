# Get the base image of Node version 16
FROM node:16

# Get the latest version of Playwright
FROM mcr.microsoft.com/playwright:focal

RUN mkdir /app 
# Set the work directory for the application
WORKDIR /app

COPY . /app
 
# Set the environment path to node_modules/.bin
ENV PATH /app/node_modules/.bin:$PATH

# Get the needed libraries to run Playwright
RUN apt-get update && apt-get -y install libnss3 libatk-bridge2.0-0 libdrm-dev libxkbcommon-dev libgbm-dev libasound-dev libatspi2.0-0 libxshmfence-dev unzip

# Install the dependencies in Node environment
RUN npm install

#Install browsers
RUN npx playwright install --with-deps

RUN unzip /app/tests/extension.zip -d /app/tests/

#Run tests
RUN xvfb-run npx playwright test