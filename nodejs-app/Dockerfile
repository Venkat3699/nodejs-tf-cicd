FROM node:18-alpine

# Create a non-root user
RUN addgroup -S ubuntu && adduser -S ubuntu -G ubuntu

# Set working directory and give ownership to ubuntu user
WORKDIR /usr/src/app
RUN chown ubuntu:ubuntu /usr/src/app

# Copy package files and install dependencies as root
COPY package*.json ./
RUN npm install

# Copy rest of the code
COPY . .

# Change ownership of everything to ubuntu
RUN chown -R ubuntu:ubuntu /usr/src/app

# Switch to non-root user for running the app
USER ubuntu

EXPOSE 3000
CMD ["node", "src/app.js"]
