FROM tomcat:9.0

ADD ./webapp/target/*.war usr/local/tomcat/webapp/

EXPOSE 8080

CMD [ "cataline.sh", "run" ]