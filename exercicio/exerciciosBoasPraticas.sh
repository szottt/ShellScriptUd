#!/usr/bin/env bash


for i in $(seq $comeca $ate);do for j in $(seq $i $ate);do printf "*";done;printf "\n";done

#-----------------------------------------------------------------------------------------------------------------#


#!/usr/bin/env bash
#
# exerciciosBoasPraticas.sh - Script de exercicios de boas praticas
#
# Autor:      Igor Dias Szot
# Manutenção: Igor Dias Szot
#
# ------------------------------------------------------------------------ #
#  Este shell é para treinar as boas praticas
#
#  Exemplos:
#      $ ./exerciciosBoasPraticas.sh 
#      Neste exemplo ele ja vai executar todo o script.
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 02/03/2021, Igor:
#       - Início do programa

# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #

comeca=0 
ate=100

# ------------------------------- TESTES ----------------------------------------- #

[ $comeca -ge $ate ] && exit 1

# ------------------------------- EXECUÇÃO ----------------------------------------- #
for i in $(seq $comeca $ate)
do 
    for j in $(seq $i $ate)
    do 
        printf "*"
    done
    printf "\n"
done
# ------------------------------------------------------------------------ #
