#!/usr/bin/env bash
#
# exercicioDebug.sh - Lista usuarios do /etc/passwd
#
# Autor:      Igor Dias Szot
# Manutenção: Igor Dias Szot
#
# ------------------------------------------------------------------------ #
#   Ira extrair usuarios do passwd
#
#  Exemplos:
#      $ ./exercicioDebug.sh -d (valor)
#      Neste exemplo ele ja vai executar todo o script.
# ------------------------------------------------------------------------ #
# Historico

#     v1.0 
#         Criação do script e de todos os parametros iniciais
#     v1.1
#         Ajuste no script e inclusao de chaveFlags
#     v1.2
#         Ajustes no script com a inclusao de um while e tambem melhorias no codigo
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19


# ------------------------------- VARIÁVEIS ----------------------------------------- #

CHAVE_DEBUG=0
NIVEL_DEBUG=0

# ------------------------------- FUNÇOES ----------------------------------------- #
Debugar () {
    [ $1 -le $NIVEL_DEBUG ] && echo "Debug $* ------"
}
Soma () {
    local total=0

    for i in $(seq 1 25); do
        Debugar 1 "Entrei no for com o valor: $i"
        total=$(($total+$i))
        Debugar 2 "Depois da soma $total"
    done

}

# ------------------------------- EXECUÇÃO ----------------------------------------- #
set -x

case "$1" in

    -d) [ $2 ] && NIVEL_DEBUG=2 ;;
    *) Soma                     ;;

esac
set +x

Soma
# ------------------------------------------------------------------------ #
