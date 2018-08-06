# base image
FROM ubuntu

# LABEL
LABEL maintainer " nicor71ang <chairman101222@gmail.com>"

COPY ./dockerlib/ /data
RUN echo /data >> /etc/ld.so.conf.d/dockerlib.conf
RUN ldconfig
WORKDIR /data

EXPOSE 7160

ENTRYPOINT ["./market-data-cpp.bin"]

CMD ["param1"]
# CMD echo "this is a test."
