FROM alpine:3.12.4

RUN apk --no-cache add curl ca-certificates bash gettext
RUN curl -Lo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl

COPY apply.sh /bin/

ENTRYPOINT ["/bin/bash"]
CMD ["/bin/apply.sh"]
