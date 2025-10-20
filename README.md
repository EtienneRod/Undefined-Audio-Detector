This is a Dockerfile to create a Docker Image for netplexflix, a project that use IA to find missing language of audio tracks
in a video file where language for this audio track is not defined

Look at his project at -> https://github.com/netplexflix/MKV-Undefined-Audio-Language-Detector. 

```yaml
services:
  audiodetector:
    container_name: audiodetector
    build: ./Undefined-Audio-Detector
    restart: unless-stopped
    user: "1000:1000"
    environment:
      TZ: "America/Toronto"
    volumes:
      - /Movies:/Movies
      - ./config:/home/AudioDetector/MKV-Undefined-Audio-Language-Detector/config
