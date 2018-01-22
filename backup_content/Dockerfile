FROM ubuntu

ENV home /root
ENV TERM xterm

# Install required dependencies
RUN apt-get update; apt-get install -y cron
RUN apt-get install -y git; apt-get install -y ssh
RUN apt-get install -y man

# Copy local files to appropriate folders
COPY ./backup_blog_data.sh $home
COPY ./ssh/ $home/.ssh/
ADD ./crontab /etc/cron.d/backup_wordpress

# Set the right permissions
RUN chmod 600 $home/.ssh/id_rsa
RUN chmod +x $home/backup_wordpress_data.sh
RUN chmod 0644 /etc/cron.d/backup_wordpress

# Configure git
RUN git config --global push.default simple
RUN git config --global user.name "Backup blog container"
RUN git config --global user.email "tuatinigodard@gmail.com"

##--------------- Setup crontab to backup blog db

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Activate backup blog cron
RUN crontab /etc/cron.d/backup_blog

# Finally watch for cron logs
CMD cron && tail -f /var/log/cron.log
