FROM nginx:alpine

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom nginx config template (uses __PORT__ placeholder)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Copy site files
COPY . /usr/share/nginx/html

# Remove non-web files from served directory
RUN rm -f /usr/share/nginx/html/Dockerfile \
          /usr/share/nginx/html/nginx.conf \
          /usr/share/nginx/html/start.sh \
          /usr/share/nginx/html/package.json \
          /usr/share/nginx/html/railway.json \
          /usr/share/nginx/html/RAILWAY_SETUP.md

CMD ["/start.sh"]
