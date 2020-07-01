FROM google/cloud-sdk:298.0.0-alpine

ENV GOOGLE_APPLICATION_CREDENTIALS=/home/google-credentials.json

WORKDIR /home

ARG GCLOUD_ADDITIONAL_COMPONENTS="alpha beta"
RUN gcloud components install ${GCLOUD_ADDITIONAL_COMPONENTS}

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

ARG TERRAGRUNT_VERSION="v0.23.0"
RUN curl -fsSL https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 -o /usr/local/bin/terragrunt \
  && chmod +x /usr/local/bin/terragrunt

ARG TERRAFORM_VERSION="0.12.28"
RUN curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip | unzip - \
  && chmod +x terraform \
  && mv terraform /usr/local/bin/terraform

ARG TFLINT_VERSION="v0.17.0"
RUN curl -fsSL https://github.com/terraform-linters/tflint/releases/download/${TFLINT_VERSION}/tflint_linux_amd64.zip -o tflint.zip \
  && unzip tflint.zip \
  && rm tflint.zip \
  && chmod +x tflint \
  && mv tflint /usr/local/bin/tflint

COPY actions/tflint/run_tflint.sh /usr/local/bin/run_tflint.sh

ARG CREATED="unknown"
ARG AUTHORS="Sebastian Neb"
ARG IMAGE_INFO_URL="https://github.com/sebastianneb-streamedcon2020/streamedcon-terragrunt-deployer-image"
ARG VERSION="0.0.0-unknown"
ARG REVISION="master"
ARG VENDOR="Sebastian Neb"
ARG LICENCES=""
ARG IMAGE_TITLE="Terragrunt Gcloud Deployer"
ARG IMAGE_DESCRIPTION="A docker image with common needed tools to deploy to Google-Cloud-Platform. Terragrunt, GCloud-cli and others are included"

LABEL org.opencontainers.image.created="${CREATED}"
LABEL org.opencontainers.image.authors="${AUTHORS}"
LABEL org.opencontainers.image.url="${IMAGE_INFO_URL}"
LABEL org.opencontainers.image.documentation="${IMAGE_INFO_URL}"
LABEL org.opencontainers.image.source="${IMAGE_INFO_URL}"
LABEL org.opencontainers.image.version="${VERSION}"
LABEL org.opencontainers.image.revision="${REVISION}"
LABEL org.opencontainers.image.vendor="${REVISION}"
LABEL org.opencontainers.image.licenses="${LICENCES}"
LABEL org.opencontainers.image.title="${IMAGE_TITLE}"
LABEL org.opencontainers.image.description="${IMAGE_DESCRIPTION}"
