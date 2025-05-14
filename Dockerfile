# Use official Node.js image
FROM node:20

# Set working directory inside the container
WORKDIR /gemini

# Copy only package.json and package-lock.json first for better caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the source code
COPY . .

# Expose Vite's default dev port
EXPOSE 5173

# Run Vite dev server and make it accessible externally
CMD ["npm", "run", "dev", "--", "--host"]
