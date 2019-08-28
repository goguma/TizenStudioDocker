# TizenStudioDocker

1. How to build Docker Image
    - $docker build --tag tizen-studio:3.3 .

2. How to run
    - $docker run -it -e DISPLAY --privileged -v /dev/bus/usb/your_usb:/dev/bus/usb/same_usb -v /home/your_id/.Xauthority:/home/developer/.Xauthority -v /home/your_id/workspace:/home/developer/workspace --net=host tizen-studio:3.3 /bin/bash

3. run Tizen Studio in shell
    - /bin/bash /home/seongwon/tizen-studio/ide/TizenStudio.sh

4. run iot-setup-manager in shell
    - /bin/sh /home/seongwon/tizen-studio/tools/iot-setup-manager/ism-launcher-jar