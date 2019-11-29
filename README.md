# WeThink Solutions - Servidor SMTP

Realiza o deploy da imagem com o Postfix para envio de e-mails.

## Instalação do Docker

	curl -sSL https://get.docker.com | bash

## Instalação do Docker-Compose

	curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose

## Download e instalação do container

	git clone https://github.com/WeThinkSolutionsBR/smtp-server.git
	cd smtp-server
	docker-compose up -d

## Suporte

Para suporte técnico, ou maiores informações, por favor, entre em contato conosco:

[Contato](https://www.wethinksolutions.com.br/#contact)
