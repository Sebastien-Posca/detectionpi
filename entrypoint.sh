#!/bin/sh

cd /tmp/detectionpi
systemctl enable mosquitto
python3 custom_TFLite_detection_webcam.py --modeldir=Sample_TFLite_model 
