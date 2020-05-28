FROM  balenalib/rpi-raspbian:buster

WORKDIR /tmp

RUN # Install compile dependencies
RUN apt-get update
# RUN apt-get dist-upgrade -y
RUN apt-get install -y wget

RUN apt-get install -y  \
    git build-essential \
    python3 \
    python3-pip \
    libilmbase-dev \
    libopenexr-dev \
    libgstreamer1.0-dev \
    libilmbase23 \
    libjpeg-dev \
    libtiff5-dev \
    libjasper-dev \
    libpng12-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libv4l-dev \
    libxvidcore-dev \
    libx264-dev \
    qt4-dev-tools \
    libatlas-base-dev \
    libqt4-test

RUN pip3 install opencv-python==3.4.6.27
RUN pip3 install https://dl.google.com/coral/python/tflite_runtime-2.1.0.post1-cp37-cp37m-linux_armv7l.whl
RUN pip3 install paho-mqtt

ADD https://api.github.com/repos/Sebastien-Posca/detectionpi/git/refs/heads/master version.json
RUN git clone https://github.com/Sebastien-Posca/detectionpi.git
WORKDIR /tmp/detectionpi
RUN apt-get install -y unzip
RUN wget https://storage.googleapis.com/download.tensorflow.org/models/tflite/coco_ssd_mobilenet_v1_1.0_quant_2018_06_29.zip && unzip coco_ssd_mobilenet_v1_1.0_quant_2018_06_29.zip -d Sample_TFLite_model

CMD python3 custom_TFLite_detection_webcam.py --modeldir=Sample_TFLite_model 
