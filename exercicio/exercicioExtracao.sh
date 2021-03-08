#!/usr/bin/env bash
#
# exercicioExtracao.sh - Monta uma parte da Classe do java (TACACA)
#
# Autor:      Igor Dias Szot
# Manutenção: Igor Dias Szot
#
# ------------------------------------------------------------------------ #
#  Este shell monta a parte final do nosso Tacaca
#
#  Exemplos:
#      $ sh exercicioExtracao.sh 
#      Neste exemplo ele ja vai executar todo o script.
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 07/03/2021, Igor:
#       - Início do programa

# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
ARQUIVO_TITULOS="loren.txt"
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -x "$(which lynx)" ] && sudo apt-get install lynx -y # Lynx Instalado
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #

lynx -source https://br.lipsum.com/ | grep nofollow | sed 's/<a tar.*href="//;s/">.*//' > loren.txt


while read -r titulo_lxer
do
    echo -e "${VERMELHO}Site Consulta: ${VERDE}$titulo_lxer"
done < "$ARQUIVO_TITULOS"
# ------------------------------------------------------------------------ # 