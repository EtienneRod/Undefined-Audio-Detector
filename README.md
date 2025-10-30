This is a Dockerfile to create a Docker Image for ULDAS, which stands for "Undefined Language Detector for Audio and Subtitles". This is a project that use IA to find language of audio tracks not defined properly in audio streams of a given movie file.

Look at his project and support the guy -> https://github.com/netplexflix/ULDAS. 

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
      - ./config:/home/AudioDetector/ULDAS/config # Required. Path fot folder where config.yml is located. config.yml options are documented at https://github.com/netplexflix/ULDAS
