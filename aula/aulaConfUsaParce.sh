#!/usr/bin/env bash

ARQUIVO_DE_CONFIGURACAO="/home/vkn/Documentos/Cursos/Udemy/ShellScript/conf/configuracao.conf"
USAR_CORES=
USAR_MAIUSCULAS=
MENSAGEM="Mensagem de Teste"

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"

eval $(./aulaParse.sh $ARQUIVO_DE_CONFIGURACAO)

[ "$(echo $CONF_USAR_MAIUSCULAS)" = "1" ] && USAR_MAIUSCULAS="1"
[ "$(echo $CONF_USAR_CORES)" = "1" ] && USAR_CORES="1"

[ "$USAR_MAIUSCULAS" = "1" ] && MENSAGEM=$(echo $MENSAGEM | tr [a-z] [A-Z])
[ "$USAR_CORES" = "1" ] && MENSAGEM="$(echo -e ${VERMELHO}$MENSAGEM )"

echo "$MENSAGEM"