FROM ubuntu:22.04

# global config
ENV TZ=Europe/Berlin
# working directory for notebook files
ENV WORK_DIR /data/book
EXPOSE 8888

# installing system packages
RUN apt-get update && apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    python3.10 \
    python3-pip \
    python3-dev \
    git \
    git-lfs \
    texlive \
    texlive-base \
    texlive-binaries \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-science \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-xetex \
    texlive-lang-english \
    texlive-lang-german \
    time \
    wget \
    latexmk \
    imagemagick

# creating non root user
RUN useradd -s /bin/bash -m user

# preparing requirements
RUN mkdir /build && chown user:user /build
COPY --chown=user:user ./info1-book/requirements.txt /build/requirements.txt
RUN pip3.10 install -r /build/requirements.txt

# preparing working directory
RUN mkdir -p ${WORK_DIR} && chown user:user ${WORK_DIR}
# COPY --chown=user:user ./info1-book ${WORK_DIR}
WORKDIR ${WORK_DIR}

# USER user:user

ENTRYPOINT [ "/bin/bash" ]
# start with:
# jupyter notebook --port=8888 --no-browser --ip=0.0.0.0