FROM node:15
WORKDIR /app
#Good practice copy the package first
COPY package.json /app
RUN npm install
ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        else npm install --only=production; \
        fi
#After package was installed and npm install was executed
#Copy the rest of the files
COPY . /app
ENV PORT 3000
EXPOSE $PORT
CMD ["node","index.js"]