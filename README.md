This is a Dockerfile to create a Docker Image for ULDAS, which stands for "Undefined Language Detector for Audio and Subtitles". This is a project that use IA to find language of audio tracks not defined properly in audio streams of a given movie file.

Look at his project and support the guy -> https://github.com/netplexflix/ULDAS. 

This is normal that building takes some time (about 10 minutes here) and resulting image is beefy (over 12Gb). It downloads and installs AI engine and LLMs locally so this image don't rely on internet access and won't send your data to an AI online.

ULDAS can also use Nvidia GPU acceleration (CUDA) but since I don't have Nvidia GPU, this compose.yaml example doesn't support it out of the box and needs to be adapted. Look at https://docs.docker.com/compose/how-tos/gpu-support for more info, this should be pretty straightforward.

Here is an example of Docker-Compose (compose.yaml) to launch it :
```yaml
services:
  audiodetector:
    container_name: audiodetector
    build: https://github.com/EtienneRod/MediaImport.git
    restart: unless-stopped
    user: "1000:1000" # Optional. User that will be used in contrainer
    environment:
      TZ: "America/Toronto" # Optional. Change to your Timezone
    volumes:
      - /Movies:/Movies # Required. Change to your Media root folder
      - ./config:/home/AudioDetector/ULDAS/config # Required. Path where config.yml is located. config.yml options are documented at https://github.com/netplexflix/ULDAS.                                                                       processed_files.json will also be created in this path to save processed files list and avoid reprocessing them,                                                                   which speedup process alot. If you want to reprocess all file, delete this file.
