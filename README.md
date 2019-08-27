# TizenStudioDocker

1. How to build Docker Image

$docker build --tag tizen-studio:3.3 .

2. How to run

$docker run -it -e DISPLAY -v /home/your_id/.Xauthority:/home/developer/.Xauthority -v /home/your_id/workspace:/home/developer/workspace --net=host tizen-studio:3.3 /bin/bash
