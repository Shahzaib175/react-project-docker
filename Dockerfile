# Step 1: Use official Node.js image as a base
FROM node:18

# Step 2: Set working directory in the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json (if present)
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of your app’s source code
COPY . .

# Step 6: Build the React app for production
RUN npm run build

# Step 7: Install serve to serve the build folder
RUN npm install -g serve

# Step 8: Expose port 3000
EXPOSE 3000

# Step 9: Start the app using serve
CMD ["serve", "-s", "build", "-l", "3000"]

