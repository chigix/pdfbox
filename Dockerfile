FROM openjdk:19-jdk-alpine3.16

MAINTAINER Richard Lea <https://github.com/chigix>

RUN apk add --no-cache ttf-droid ttf-droid-nonlatin fontconfig-dev freetype-dev && \
    apk add font-noto font-noto-cjk && \
    apk add msttcorefonts-installer ghostscript-fonts && \
    update-ms-fonts && \
    fc-cache -f -v && \
    wget https://dlcdn.apache.org/pdfbox/3.0.2/pdfbox-app-3.0.2.jar && \
    mv ./pdfbox-app-3.0.2.jar /root/pdfbox-app-3.0.2.jar

VOLUME ["/data"]

WORKDIR /data

ENTRYPOINT [ "java", "-jar", "/root/pdfbox-app-3.0.2.jar"]
