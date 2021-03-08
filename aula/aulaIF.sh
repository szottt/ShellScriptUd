#!/bin/bash

VAR=" "
VAR2="a"

if [[ "$VAR" = "$VAR2" ]]; then
    echo "São Iguais"
fi

if [[ "$VAR" = "$VAR2" ]]
then
    echo "São Iguais"
fi

if test "$VAR" = "$VAR2" 
then
    echo "São Iguais"
fi

if [ "$VAR" = "$VAR2" ]
then
    echo "São Iguais"
fi

[ "$VAR" = "$VAR2" ] && echo "São Iguais"

[ "$VAR" = "$VAR2" ] || echo "Não são Iguais"
