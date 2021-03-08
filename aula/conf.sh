#!/usr/bin/env bash

# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
ARQUIVO_DE_CONFIGURACAO="/home/vkn/Documentos/Cursos/Udemy/ShellScript/conf/configuracao.conf"
USAR_CORES=
USAR_MAIUSCULAS=
MENSAGEM="Mensagem de Teste"

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #
# ------------------------------- TESTES ----------------------------------------- #
[ ! -r "$ARQUIVO_DE_CONFIGURACAO" ] && echo "Não temos acesso a leitura " && exit 1
# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #
DefinirParametros () {
    local parametro="$(echo $1 | cut -d = -f 1)"
    local valor="$(echo $1 | cut -d = -f 2)"

    case "$parametro" in
        USAR_CORES)      USAR_CORES=$valor        ;;
        USAR_MAIUSCULAS) USAR_MAIUSCULAS=$valor   ;;
    esac
}
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
while read -r linha
do
    [ "$(echo $linha | cut -c1)" = "#" ] && continue
    [ ! "$linha" ] && continue
    DefinirParametros "$linha"
done < "$ARQUIVO_DE_CONFIGURACAO"

[ $USAR_MAIUSCULAS -eq 1 ] && MENSAGEM=$(echo $MENSAGEM | tr [a-z] [A-Z])
[ $USAR_CORES -eq 1 ] && MENSAGEM="$(echo -e ${VERMELHO}$MENSAGEM )"

echo "$MENSAGEM"

# ------------------------------------------------------------------------ #