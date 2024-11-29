FROM amazonlinux
RUN yum install tar.x86_64 -y
RUN yum install java -y
RUN yum install wget -y && yum install gzip -y
RUN yum update -y
RUN mkdir /home/tomcat
WORKDIR /home/ec2-user
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97/bin/apache-tomcat-9.0.97.tar.gz
RUN tar -zxvf apache-tomcat-9.0.97.tar.gz
RUN mv apache-tomcat-9.0.97/* /home/tomcat
ADD ./*.war /home/tomcat/webapps
EXPOSE 8080
CMD ["/home/tomcat/bin/catalina.sh","run"]
