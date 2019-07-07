FROM alpine

ADD ./wait-for ./

# PYTHON
RUN apk add --no-cache python py-pip

# CHROME
RUN apk --no-cache upgrade && apk add --no-cache chromium chromium-chromedriver
RUN apk add libexif udev

# ROBOT + LIBRARIES
COPY requirements.txt /tmp/requirements.txt
RUN  pip install -r /tmp/requirements.txt