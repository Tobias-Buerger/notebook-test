FROM ubuntu:21.10

# global config
ENV TZ=Europe/Berlin
# working directory for notebook files
ENV NOTEBOOK_DIR /data/notebooks
EXPOSE 8888

# installing system packages
RUN apt-get update && apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    python3.10 \
    python3-pip \
    python3-dev \
    pandoc \
    graphviz \
    inkscape \
    libmagic-dev \
    git \
    git-lfs \
    texlive \
    texlive-base \
    texlive-binaries \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-science \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-formats-extra \
    texlive-xetex \
    texlive-lang-english \
    texlive-lang-german \
    dvipng \
    ghostscript \
    valgrind \
    libmagic1 \
    time \
    wget \
    firefox \
    latexmk \
    cargo
RUN pip3 -qq install pip --upgrade

# install extra fonts (from ubuntu:21.10 because newest version does not have raleway font)
# need to patch version info to 2021.20210921
# RUN wget http://archive.ubuntu.com/ubuntu/pool/universe/t/texlive-extra/texlive-fonts-extra_2020.20210202-3_all.deb && \
# dpkg -x texlive-fonts-extra*.deb texlive-fonts-extra/ && \
# dpkg -e texlive-fonts-extra*.deb texlive-fonts-extra/DEBIAN && \
# sed -i "s/Version: 2020.20210202-3/Version: 2021.20210921/" texlive-fonts-extra/DEBIAN/control && \
# rm texlive-fonts-extra*.deb && \
# dpkg -b texlive-fonts-extra/ texlive-fonts-extra.deb && \
# DEBIAN_FRONTEND=noninteractive apt-get install -y ./texlive-fonts-extra.deb && \
# rm -rf texlive-fonts-extra*

# copy run script
COPY ./tools/info1 /usr/bin/
RUN chmod +x /usr/bin/info1

# install geckodriver
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz && \
tar -xvzf geckodriver* && \
cp geckodriver /usr/bin/ && \
chmod +x /usr/bin/geckodriver && \
rm -f geckodriver*

# creating non root user
RUN useradd -s /bin/bash -m user

# preparing requirements for jupyter and other build requirements 
RUN mkdir /build && chown user:user /build
COPY --chown=user:user ./build /build
RUN pip3 install -r /build/requirements.txt

# preparing working directory
RUN mkdir -p ${NOTEBOOK_DIR} && chown user:user ${NOTEBOOK_DIR}
COPY --chown=user:user ./notebooks ${NOTEBOOK_DIR}
WORKDIR ${NOTEBOOK_DIR}

# USER user:user

ENTRYPOINT [ "/bin/bash", "-c", "info1; /bin/bash"]
# start with:
# jupyter notebook --port=8888 --no-browser --ip=0.0.0.0