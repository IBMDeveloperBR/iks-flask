# base image
FROM python:3.7-alpine

# set working directory
WORKDIR /usr/src/app

# add flask server files
COPY . /usr/src/app/

# install requirements
RUN pip install -r requirements.txt

# set entrypoint.sh permissions
RUN chmod +x /usr/src/app/entrypoint.sh

# run server
CMD ["/usr/src/app/entrypoint.sh"]
