FROM python:3.12-slim

ENV TZ=America/Toronto

RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

RUN apt update && apt -y dist-upgrade && apt -y install git ffmpeg mkvtoolnix && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 AudioDetector  && useradd -u 1000 -g AudioDetector -ms /bin/bash AudioDetector

USER AudioDetector

WORKDIR /home/AudioDetector

RUN git clone https://github.com/netplexflix/MKV-Undefined-Audio-Language-Detector.git

WORKDIR /home/AudioDetector/MKV-Undefined-Audio-Language-Detector

RUN pip install -r requirements.txt

RUN pip install plexapi

RUN pip cache purge

RUN rm -rf /home/AudioDetector/.cache/pip

CMD ["python3","MUALD.py","&&","python3","/home/AudioDetector/MKV-Undefined-Audio-Language-Detector/lib/MediaLabelAll.py"]
