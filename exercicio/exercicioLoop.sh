#!/bin/bash

contador=0
while [[ $contador -lt 11 ]]
do 
    if [[ $contador%2  -eq 0 ]]
    then 
        echo "O Numero $contador é divisivel por 2"
    else
        echo "O Numero $contador não é divisivel por 2"
    fi
    contador=$(($contador+1))
done

#echo "Exemplo do Professor"

#for i in $(seq 0 10)

#do

#        [ $(($i % 2)) -eq 0 ] && echo "Número $i é divisível por 2"

#done