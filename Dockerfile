FROM debian

RUN apt-get update &&\
    apt-get -y install jq curl unzip &&\
    apt-get clean

RUN curl --output /tmp/vault.zip https://releases.hashicorp.com/vault/1.4.2/vault_1.4.2_linux_amd64.zip &&\
    unzip /tmp/vault.zip &&\
    mv vault /usr/local/bin/vault

ADD vault-copy-path.sh /vault-copy-path.sh

ENTRYPOINT ["/vault-copy-path.sh"]
