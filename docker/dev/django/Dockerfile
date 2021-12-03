FROM python:3.7.5

RUN echo 2
ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code

ADD requirements/* /code/
RUN pip install -r dev.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install unidecode -i https://pypi.tuna.tsinghua.edu.cn/simple

CMD ["./docker/wait-for-it.sh", "db:5432", "--", "sh", "/code/docker/dev/django/container-start.sh"]
