FROM node:22-slim

WORKDIR /usr/src/app

# Install system dependencies (git is required by quartz)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
RUN git config --global --add safe.directory "*"

# Clone the Quartz repository (Engine)
RUN git clone https://github.com/jackyzha0/quartz.git .
RUN git checkout v4.5.2

# Install dependencies
RUN npm install

# Copy OUR configuration (Overwrite upstream defaults)
COPY quartz.config.ts quartz.layout.ts ./



# Expose port
EXPOSE 8080

# Run Quartz
CMD ["npx", "quartz", "build", "--serve", "--port", "8080", "--concurrency", "1"]
