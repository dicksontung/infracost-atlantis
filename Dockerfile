# Set this to the version of Atlantis you want to use
ARG version=latest
FROM dixont/atlantis:v0.19.5

# Set this to the minor version of Infracost CLI you want to use (e.g., v0.9, v0.10)
ARG cli_version=v0.10

# Install required packages and latest ${cli_version} version of Infracost
RUN apk --update --no-cache add ca-certificates openssl openssh-client curl git jq
RUN \
  curl -s -L "https://infracost.io/downloads/$cli_version/infracost-linux-amd64.tar.gz" | tar xz -C /tmp && \
  mv /tmp/infracost-linux-amd64 /usr/bin/infracost

COPY extra/gitlab-approval-linux-amd64 /usr/local/bin/gitlab-approval

RUN apk --update --no-cache add tzdata
