FROM continuumio/anaconda
LABEL author="Benjapol Worakan benwrk@live.com"
RUN apt-get update -y -q
RUN apt-get upgrade -y -q
RUN apt-get install -y -q openssh-server
RUN echo '' >> /etc/ssh/sshd_config
RUN echo '# Allow root login' >> /etc/ssh/sshd_config
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo '' >> /etc/ssh/sshd_config
RUN conda install jupyter -y --quiet
RUN mkdir /opt/notebooks
CMD service ssh start && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=$NOTEBOOK_TOKEN
EXPOSE 22 8888
