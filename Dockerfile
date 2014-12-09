FROM debian:wheezy
MAINTAINER Yunia <yunia@yunia.nl>

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -yq python ffmpeg atomicparsley
ADD https://yt-dl.org/downloads/latest/youtube-dl /root/

#EXPOSE 6600
#VOLUME ["/music/youtube"]
#VOLUME ["/music/soundcloud"]
VOLUME ["/music/ripped"]
ENTRYPOINT ["/root/youtube-dl", "-f", "bestaudio", "--add-metadata", "--cookies", "/root/.youtube-dl_cookie-jar", "--write-discription", "--write-info-json", "--embed-thumbnail", "--extract-audio"]


#./youtube-dl --audio-format best -f bestaudio --add-metadata --cookies ~/.youtube-dl_cookie-jar --write-description --write-info-json --embed-thumbnail --extract-audio '$1'
#./youtube-dl -f bestaudio --add-metadata --cookies ~/.youtube-dl_cookie-jar --write-description --write-info-json --embed-thumbnail --extract-audio '$1'
