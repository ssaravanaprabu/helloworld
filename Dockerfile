############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
############################################################


# Set the base image to Ubuntu
FROM ubuntu

# Install Nginx

# RUN echo "deb http://archive.ubuntu.com/ubuntu/ raring main universe" >> /etc/apt/sources.list

# Update the repository
RUN apt-get update

# Install necessary tools
RUN apt-get install -y vim wget dialog net-tools sudo nginx

#RUN apt-get install -y nginx
RUN chmod -R 777 /var/lib /var/log /etc/nginx /var/run /var/www

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/
#COPY procfile.sh /usr/local/bin/

#RUN chmod +x /usr/local/bin/procfile.sh

RUN mkdir /etc/nginx/logs

# Add a sample index file
ADD index.html /var/www/data/
RUN cat /var/www/data/index.html

# Append "daemon off;" to the beginning of the configuration
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 8080

USER root

# Set the default command to execute
# when creating a new container
CMD ["nginx"]
#ENTRYPOINT ["procfile.sh"]
