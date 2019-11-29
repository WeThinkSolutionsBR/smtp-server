FROM centos:7

MAINTAINER WeThink Solutions <contato@wethinksolutions.com.br>

ENV MAIL_USER XXXXXX

ENV MAIL_PASS XXXXXX

ENV MAIL_HOST XXXXXX

ENV MAIL_PORT 587

RUN yum -y install postfix cyrus-sasl-plain mailx

RUN { \
        echo ; \
        echo 'inet_interfaces = all' ; \
        echo '#Set the relayhost' ; \
        echo 'mydestination = localhost.localdomain, localhost' ; \
        echo 'relayhost = [MAIL_HOST]:MAIL_PORT' ; \
        echo 'smtp_sasl_auth_enable = yes' ; \
        echo 'smtp_sasl_password_maps = static:MAIL_USER:MAIL_PASS' ; \
        echo 'smtp_sasl_security_options = noanonymous' ; \
        echo ; \
        echo '# TLS support' ; \
        echo 'smtp_tls_CAfile = /etc/pki/tls/certs/ca-bundle.crt' ; \
        echo 'smtp_tls_security_level = may' ; \
        echo 'smtpd_tls_security_level = may' ; \
        echo 'smtp_tls_note_starttls_offer = yes' ; \
        echo ; \
        echo 'smtp_cname_overrides_servername=no' ; \
        echo ; \
    } >> /etc/postfix/main.cf


RUN { \
        echo '#!/bin/bash' ; \
        echo ; \
        echo 'sed -i s/MAIL_USER/$MAIL_USER/g /etc/postfix/main.cf' ; \
        echo 'sed -i s/MAIL_PASS/$MAIL_PASS/g /etc/postfix/main.cf' ; \
        echo 'sed -i s/MAIL_HOST/$MAIL_HOST/g /etc/postfix/main.cf' ; \
	echo 'sed -i s/MAIL_PORT/$MAIL_PORT/g /etc/postfix/main.cf' ; \
        echo 'postfix start' ; \
        echo ; \
        echo 'while true; do' ;\
        echo '  mailq ' ; \
        echo '  sleep 10' ; \
        echo 'done' ; \
        echo ; \
    } > /entrypoint.sh && chmod +x /entrypoint.sh

EXPOSE 25

CMD [ "/entrypoint.sh" ]
