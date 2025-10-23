This is a Dockerfile to create a Docker Image for netplexflix, a project that use IA to find missing language of audio tracks
in a video file where language for this audio track is not defined

Look at his project and uspport the guy -> https://github.com/netplexflix/MKV-Undefined-Audio-Language-Detector. 

Here is an example of Docker-Compose (compose.yaml) to launch it :
```yaml
services:
  audiodetector:
    container_name: audiodetector
    build: https://github.com/EtienneRod/MediaImport.git
    restart: unless-stopped
    user: "1000:1000" # Optional. User that will be used in contrainer
    environment:
      TZ: "America/Toronto" # Optional. Change to you Timezone
    volumes:
      - /Movies:/Movies # Required. Change to your Media root folder
      - ./config:/home/AudioDetector/MKV-Undefined-Audio-Language-Detector/config # Required. Path fot folder where config.yml is located. config.yml options are documented at                                                                                                  https://github.com/netplexflix/MKV-Undefined-Audio-Language-Detector
