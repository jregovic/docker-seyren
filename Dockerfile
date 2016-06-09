FROM centos
RUN yum install --nogpgcheck -y java-1.8.0-openjdk.x86_64 
RUN mkdir -p /var/log/seyren
RUN mkdir -p /opt/seyren/conf
COPY seyren.jar /opt/seyren
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
COPY seyren.conf /opt/seyren/conf
ENTRYPOINT ["/entrypoint.sh"] 
