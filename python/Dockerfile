FROM python:3.10.16-slim

ARG ENV=dev
ENV ENV=${ENV}

WORKDIR /app
# 安装必要的构建工具和依赖
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    gcc \
    g++ \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# 下载并安装 ta-lib 的 C 库
RUN wget https://github.com/ta-lib/ta-lib/releases/download/v0.6.4/ta-lib-0.6.4-src.tar.gz && \
    tar -xzf ta-lib-0.6.4-src.tar.gz && \
    cd ta-lib-0.6.4 && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf ta-lib-0.6.4-src.tar.gz

# 设置环境变量（避免未定义变量问题）
ENV LD_LIBRARY_PATH=/usr/lib
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "main.py", "${ENV}"]

