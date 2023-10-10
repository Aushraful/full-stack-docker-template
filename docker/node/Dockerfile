# Install NODE
FROM node:18-alpine
RUN npm install -g npm@9.8.0

# setup config
COPY ./docker/node/setup.sh /setup.sh

RUN chmod +x /setup.sh

# Set working directory
WORKDIR /var/www/frontend

# Install system dependencies
RUN apk update && apk upgrade
RUN apk add git

# Clear cache
RUN yarn cache clean

# EXPOSE port number
EXPOSE 5000
EXPOSE 24678

# Set the ENV
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=5000

# Start the frontend
CMD [ "bash", "-c", "/setup.sh && yarn run dev" ]




