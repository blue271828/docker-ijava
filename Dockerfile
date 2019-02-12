FROM jupyter/base-notebook:87210526f381


USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
            curl \
            openjdk-11-jdk \
            unzip \
            && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


#
# Install IJava by pre-built binary
#
ARG IJAVA_VERSION="1.2.0"
RUN cd /opt && \
    curl -LO "https://github.com/SpencerPark/IJava/releases/download/v${IJAVA_VERSION}/ijava-${IJAVA_VERSION}.zip" && \
    unzip -d ijava "ijava-${IJAVA_VERSION}.zip" && \
    rm -f "ijava-${IJAVA_VERSION}.zip" && \
    cd ijava && \
    python install.py --sys-prefix


USER $NB_UID

#
# Install dependency PyPI packages
#
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
