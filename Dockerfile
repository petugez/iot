
# Extend vert.x image
FROM vertx/vertx3

#ENV VERTICLE_NAME io.vertx.sample.hello.HelloVerticle
ENV VERTICLE_NAME io.vertx.example.web.rest.SimpleREST

ENV VERTICLE_FILE backend/target/iot-1.0.0.jar
ENV FE_APP frontend/app

# Set the location of the verticles
ENV VERTICLE_HOME /usr/verticles
ENV WEBROOT /usr/verticles/webroot

EXPOSE 5000

# Copy your verticle to the container
COPY $VERTICLE_FILE $VERTICLE_HOME/
ADD $FE_APP $WEBROOT

# Launch the verticle
WORKDIR $VERTICLE_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["vertx run $VERTICLE_NAME -cp $VERTICLE_HOME/*"]
