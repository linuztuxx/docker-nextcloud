 Use the official Nextcloud image
FROM nextcloud:latest

# Copy the custom Apache configuration file to change the port to 7860
COPY custom_apache.conf /etc/apache2/sites-available/000-default.conf

# Update the ports.conf to listen on port 7860 instead of 80
RUN sed -i 's/Listen 80/Listen 7860/' /etc/apache2/ports.conf

# Expose the new port
EXPOSE 7860

# Start Nextcloud
CMD ["apache2-foreground"]
