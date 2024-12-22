# Use Node.js 18 on Alpine as base
FROM node:18-alpine

# Install git (so we can clone the repo)
RUN apk add --no-cache git

# Clone the repository into /app
RUN git clone --depth=1 --branch=main \
    https://github.com/awestwell/headless-chatgpt.git /app

# Set /app as the working directory
WORKDIR /app

# Install production dependencies
RUN npm install --omit-dev

# Expose the port defined in server.js (usually 3000)
EXPOSE 3000

# Start the server
CMD ["node", "server.js"]
