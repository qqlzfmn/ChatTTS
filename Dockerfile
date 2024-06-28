FROM pytorch/pytorch:2.3.1-cuda12.1-cudnn8-runtime
ENV DEBIAN_FRONTEND noninteractive
RUN sed -i -e 's/archive.ubuntu.com/mirrors.bfsu.edu.cn/g' \
           -e 's/security.ubuntu.com/mirrors.bfsu.edu.cn/g' \
           /etc/apt/sources.list
RUN pip3 config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple/
RUN apt update && apt install -y python3 python3-pip
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt
WORKDIR /app
CMD [ "python", "/app/examples/web/webui.py" ]
EXPOSE 8080