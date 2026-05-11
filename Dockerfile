FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile --production=false

# Copy source
COPY . .

# Build TypeScript
RUN yarn build

# Expose port
EXPOSE 27064

# Start signal server
CMD ["node", "cli.js"]
