#!/bin/bash
yum install python3 -y
yum install python3-pip -y
python3 -m pip install simple_http_server -y
yum install git -y
git clone -b dynamic https://github.com/tkerbe2/iac-intro-lab-4
cd iac-intro-lab-4
chmod 700 bash-html-create.sh
./bash-html-create.sh
python3 -m http.server 80 >> output.html
