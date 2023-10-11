# Install NODE
FROM node:18-alpine
RUN npm install -g npm@9.8.0

# setup config
COPY ./setup.sh /setup.sh

RUN chmod +x /setup.sh

# Set working directory
WORKDIR /var/www/next_pjt_1

# Install system dependencies
RUN apk update && apk upgrade
RUN apk add git

# Clear cache
RUN yarn cache clean

# EXPOSE port number
EXPOSE 5555

# Set the ENV
ENV NEXT_HOST=0.0.0.0
ENV NEXT_PORT=5555

# Start the next_pjt_1
CMD [ "bash", "-c", "/setup.sh && yarn run dev" ]




