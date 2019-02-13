ARG DOCKER_BASE_IMAGE
FROM ${DOCKER_BASE_IMAGE}

ARG DOCKER_OS_LANG
ARG DOCKER_OS_LC_ALL
ARG PROJECT_NAME
ARG TERRAFORM_VERSION
ARG TERRAFORM_BINARY

ENV LANG ${DOCKER_OS_LANG}
ENV LC_ALL ${DOCKER_OS_LC_ALL}

RUN pacman --noconfirm -Syu
RUN pacman --noconfirm -Sy unzip

RUN curl -o /tmp/terraform-${TERRAFORM_VERSION} ${TERRAFORM_BINARY}
RUN cd /tmp && unzip /tmp/terraform-${TERRAFORM_VERSION} && cd -
RUN rm /tmp/terraform-${TERRAFORM_VERSION}
RUN chmod +x /tmp/terraform
RUN mv /tmp/terraform /bin/terraform

RUN mkdir -p /opt/${PROJECT_NAME}

WORKDIR /opt/${PROJECT_NAME}
