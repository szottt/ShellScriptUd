#!/usr/bin/env bash

ARQUIVO_DE_CONFIGURACAO="$1"


[ ! -e "$ARQUIVO_DE_CONFIGURACAO" ] && echo "Arquivo nao existe." && exit 1
[ ! -r "$ARQUIVO_DE_CONFIGURACAO" ] && echo "Não temos acesso a leitura " && exit 1


while read -r linha
do
    [ "$(echo $linha | cut -c1)" = "#" ] && continue
    [ ! "$linha" ] && continue

    chave="$(echo $linha | cut -d = -f 1)"
    valor="$(echo $linha | cut -d = -f 2)"

    echo "  CONF_$chave=$valor"
done < "$ARQUIVO_DE_CONFIGURACAO"