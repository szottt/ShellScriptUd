#!/usr/bin/env bash
#
# chaveFlags.sh - Lista usuarios do /etc/passwd
#
# Autor:      Igor Dias Szot
# Manutenção: Igor Dias Szot
#
# ------------------------------------------------------------------------ #
#   Ira extrair usuarios do passwd
#
#  Exemplos:
#      $ ./chaveFlags.sh -s -m
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
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
USUARIOS="$(cat /etc/passwd | cut -d : -f 1)"
MENSAGEM_USUARIO=("
   $(basename $0) -[OPÇÕES]

    -h - Menu de ajuda
    -v - Versão
    -s - Ordenar Saida
    -m - Coloca em Maiusculo
")

VERSAO="v1.2"
CHAVE_ORDENA=0
CHAVE_MAIUSCULO=0
# ------------------------------- TESTES ----------------------------------------- #

# ------------------------------- EXECUÇÃO ----------------------------------------- #

while test -n "$1"
do
    case "$1" in 
        -h) echo "$MENSAGEM_USUARIO" && exit 0              ;;
        -v) echo "$VERSAO" && exit 0                        ;;
        -s) CHAVE_ORDENA=1                                  ;;
        -m) CHAVE_MAIUSCULO=1                               ;;
         *) echo "Opção invalida, valide o -h." && exit 1   ;;
    esac
    shift 
done

[ "$CHAVE_ORDENA" -eq 1 ]    && USUARIOS=$(echo "$USUARIOS" | sort)
[ "$CHAVE_MAIUSCULO" -eq 1 ] && USUARIOS=$(echo "$USUARIOS" | tr [a-z] [A-Z])

echo "$USUARIOS"

# ------------------------------------------------------------------------ #
