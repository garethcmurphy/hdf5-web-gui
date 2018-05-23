# Use the official nginx image
FROM nginx:latest

# Set the working directory to /app
WORKDIR /app

# Install git and some other diagnostic utilities
RUN apt-get update -qq
RUN apt-get -y install git 
RUN apt-get -y install iputils-ping curl

# Git the HDF5 Web GUI code 
RUN git clone https://gitlab.com/MAXIV-HDF5/hdf5-web-gui.git 
RUN cd hdf5-web-gui; \  
    git checkout docker-demo-version; 

# Favicon and index page
COPY favicon.ico /app/
COPY index.html /app/

# Make ports available to the world outside this container
EXPOSE 8443 
