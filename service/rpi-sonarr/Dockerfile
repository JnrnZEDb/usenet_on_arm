FROM brujoand/rpi-dockzb

MAINTAINER Anders Brujordet

ENV SERVICE sonarr

ADD http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz /opt

RUN installer -c apk mono@testing libmediainfo@testing && \
    tar -xzf /opt/NzbDrone.master.tar.gz && rm /opt/NzbDrone.master.tar.gz

CMD [ "mono", "/opt/NzbDrone/NzbDrone.exe" ]

EXPOSE 8989
