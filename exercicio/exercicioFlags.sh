#!/usr/bin/env bash
#
# exercicioFlags.sh - Monta uma parte da Classe do java (TACACA)
#
# Autor:      Igor Dias Szot
# Manutenção: Igor Dias Szot
#
# ------------------------------------------------------------------------ #
#  Este shell monta a parte final do nosso Tacaca
#
#  Exemplos:
#      $ sh exercicioFlags.sh 
#      Neste exemplo ele ja vai verificar uma arquivo de log do apache e pode
#       ser passado os parametros -g -p -d -h -v  que estao especificados no -h .
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 06/03/2021, Igor:
#       - Início do programa

# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
LOGAPACHE="$(cat /home/vkn/Documentos/Cursos/Alura/shellScript/Scripts/apache.log)"
LOG_FILE=""
MENSAGEM_USUARIO=("
   $(basename $0) -[OPÇÕES]

    -h - Menu de ajuda
    -v - Versão
    -g - Usar Trazer dados com GET
    -p - Usar Trazer dados com POST
    -d - Usar Trazer dados com DELETE
")


VERSAO="v1.2"
CAMINHO_ARQUIVO=/home/vkn/Documentos/Cursos/Alura/shellScript/Scripts/
CHAVE_GET=0
CHAVE_POST=0
CHAVE_DELETE=0
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ -f /home/vkn/Documentos/Cursos/Udemy/ShellScript/LOG_FILE.txt ] && rm /home/vkn/Documentos/Cursos/Udemy/ShellScript/LOG_FILE.txt

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
while test -n "$1"
do
    case "$1" in 
        -h) echo "$MENSAGEM_USUARIO" && exit 0              ;;
        -g) CHAVE_GET=1 ;;
        -p) CHAVE_POST=1 ;;
        -d) CHAVE_DELETE=1 ;;
        *) echo "Opção invalida, valide o -h." && exit 1   ;;
    esac
    shift
done

[ "$CHAVE_GET" -eq 1 ] &&  cat $CAMINHO_ARQUIVO/apache.log | grep GET  >> LOG_FILE.txt 
[ "$CHAVE_POST" -eq 1 ] && cat $CAMINHO_ARQUIVO/apache.log | grep POST  >> LOG_FILE.txt 
[ "$CHAVE_DELETE" -eq 1 ] && cat $CAMINHO_ARQUIVO/apache.log | grep DELETE  >> LOG_FILE.txt 

echo $(cat LOG_FILE.txt)
# ------------------------------------------------------------------------ #
