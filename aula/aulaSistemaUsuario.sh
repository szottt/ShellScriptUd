#!/usr/bin/env bash
#
# aulaSistemaUsuario.sh - Sistema para gerenciamento de usuários
#
# Autor:      Igor Dias Szot
# Manutenção: Igor Dias Szot
#
# ------------------------------------------------------------------------ #
#  Este programa faz todas as funções de gerenciamento de usuários, como:
#  inserir, deletar, alterar.
#
#  Exemplos:
#      $ source aulaSistemaUsuario.sh
#      $ ListaUsuarios
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 06/10/2018, Igor:
#       - Tratamento de erros com relação ao arquivo do banco de dados
#       - Lista usuários
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
ARQUIVO_BANCO_DE_DADOS="/home/vkn/Documentos/Cursos/Udemy/ShellScript/banco_de_dados.txt"
SEP=:
TEMP=temp.$$
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -e "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo nao existe" && exit 1
[ ! -r "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo nao tem permissao de leitura" && exit 1
[ ! -w "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo nao tem permissao de escrita" && exit 1
# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #
MostraUsuarioNaTela() {

    local id="$(echo $linha | cut -d $SEP -f 1)"
    local nome="$(echo $linha | cut -d $SEP -f 2)"
    local email="$(echo $linha | cut -d $SEP -f 3)"

    echo -e  "${VERDE}ID: ${VERMELHO}$id"   
    echo -e  "${VERDE}NOME: ${VERMELHO}$nome"   
    echo -e  "${VERDE}EMAIL: ${VERMELHO}$email" 
}

ListaUsuario () {
    while read -r linha
    do
        [ "$(echo $linha | cut -c1)" = "#" ] && continue
        [ ! "$linha" ] && continue

        MostraUsuarioNaTela "$linha"

    done <  "$ARQUIVO_BANCO_DE_DADOS"
}   

ValidaExistenciaUsuario() {
    grep -i -q "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS"
}

InsereUsuario(){
    local nome="$(echo $1 | cut -d $SEP -f 2)"

    if ValidaExistenciaUsuario "$nome"
    then
        echo "ERRO. Usuario ja existente!"
    else
        echo "$*"  >> "$ARQUIVO_BANCO_DE_DADOS"
        echo "Usuario cadastrado com sucesso"
    fi
}

ApagaUsuario(){
    ValidaExistenciaUsuario "$1" || return 

    grep -i -v "$1$SEP"  "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
    mv $TEMP "$ARQUIVO_BANCO_DE_DADOS"
    echo "Usuario removido com sucesso"
}

OrdenaLista() {
    sort "$ARQUIVO_BANCO_DE_DADOS" >> "$TEMP"
    mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"
}

#---------------------------------------------------------------- #

# ------------------------------- EXECUÇÃO ----------------------------------------- #

# ------------------------------------------------------------------------ #