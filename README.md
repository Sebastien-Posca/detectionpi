## Activate the cam (if you use a picam)
If you use a picam you must activate it : raspi-config => Interfacing Options => Camera

# Installation with docker

## Install Docker Compose on your rasp
```sh
sudo apt install docker-compose
```
## Build the images
In the docker directory do :
```sh
docker-compose build
```

## Start the services
In the docker directory do :
```sh
docker-compose up
```
The number of person detected is send to the MQTT topic : "raspberry/camera/presence"  
Video Streaming is done on port 5000

## Stop the services
In the docker directory do :
```sh
docker-compose down
```

# Manual Installation without docker
Installation was only tested for raspbian-buster.
```sh
sudo apt-get update
sudo apt-get dist-upgrade
git clone https://github.com/Sebastien-Posca/detectionpi.git
cd detectionpi
sudo pip3 install virtualenv
sudo apt-get install python3-venv
python3 -m venv detectionpi-env
source detectionpi-env/bin/activate
bash get_pi_requirements.sh
sudo apt-get install libilmbase-dev libopenexr-dev libgstreamer1.0-dev libilmbase23
sudo pip3 install paho-mqtt
```
Install the model of your choice, those are Google defaults :
```sh
wget https://storage.googleapis.com/download.tensorflow.org/models/tflite/coco_ssd_mobilenet_v1_1.0_quant_2018_06_29.zip
unzip coco_ssd_mobilenet_v1_1.0_quant_2018_06_29.zip -d Sample_TFLite_model
```
Installation of mosquitto broker for MQTT : 
```sh
sudo apt install mosquitto mosquitto-clients
sudo systemctl enable mosquitto
```

## Start Script
GUI version : 
```sh
python3 TFLite_detection_webcam.py --modeldir=Sample_TFLite_model 
```
Headless version with MQTT :
```sh
python3 custom_TFLite_detection_webcam.py --modeldir=Sample_TFLite_model 
```

Credit: https://github.com/EdjeElectronics/TensorFlow-Lite-Object-Detection-on-Android-and-Raspberry-Pi
