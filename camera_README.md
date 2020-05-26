Installation des dépendances :
    sudo apt-get update
    sudo apt-get dist-upgrade
    git clone https://github.com/EdjeElectronics/TensorFlow-Lite-Object-Detection-on-Android-and-Raspberry-Pi.git
    mv TensorFlow-Lite-Object-Detection-on-Android-and-Raspberry-Pi tflite1
    cd tflite1
    sudo pip3 install virtualenv
    sudo apt-get install python3-venv
    python3 -m venv tflite1-env
    source tflite1-env/bin/activate
    bash get_pi_requirements.sh
    sudo apt-get install libilmbase-dev libopenexr-dev libgstreamer1.0-dev
    sudo apt install libilmbase23
    wget https://storage.googleapis.com/download.tensorflow.org/models/tflite/coco_ssd_mobilenet_v1_1.0_quant_2018_06_29.zip
    unzip coco_ssd_mobilenet_v1_1.0_quant_2018_06_29.zip -d Sample_TFLite_model

Activer la caméra sur la rasp : raspi-config => Interface => Camera

Lancer le script : python3 TFLite_detection_webcam.py --modeldir=Sample_TFLite_model