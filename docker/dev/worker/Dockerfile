FROM evalai_django

ENV http_proxy=http://172.17.0.1:8118
ENV https_proxy=http://172.17.0.1:8118

RUN apt-get update && \
  apt-get install --no-install-recommends -q -y default-jdk && \
  rm -rf /var/lib/apt/lists/*

ENV http_proxy=
ENV https_proxy=

RUN pip install -U cffi
RUN pip install -U service_identity
RUN pip install -U cython==0.29 -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install -U numpy==1.14.5 -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install -r worker.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

ADD . /code

CMD ["./docker/wait-for-it.sh", "django:8000", "--", "python", "-m", "scripts.workers.submission_worker"]
