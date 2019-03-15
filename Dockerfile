FROM fedora:latest

LABEL maintainer="PnT DevOps Automation - Red Hat, Inc." \
      vendor="PnT DevOps Automation - Red Hat, Inc." \
      summary="Image used to run ansible-lint by GitLab pipelines." \
      distribution-scope="public"

# Rrovide way to add user in entrypoint for openshift runs
RUN chmod -R g=u /etc/passwd

RUN dnf install -y --setopt=tsflags=nodocs \
        python3-ansible-lint && \
    dnf clean all

COPY user-setup.sh /
RUN chmod a+x /user-setup.sh
ENTRYPOINT ["/user-setup.sh"]
