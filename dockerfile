FROM nginx:alpine
# Copy your HTML file to the default nginx directory
COPY index.html /usr/share/nginx/html/index.html
# Expose port 80
