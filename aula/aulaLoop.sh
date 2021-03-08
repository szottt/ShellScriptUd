#!/bin/bash

echo "======= FOR 1 ======="

for (( i = 0; i <10; i++ ))
do 
    echo $i
done

echo "======= FOR 2 ======="
for i in $(seq 10)
do 
    echo $i
done

echo "======= FOR 3 ======="
Frutas=(
    'Laranja'
    'Ameixa'
    'Abacaxi'
    'Jabuticaba'
)
for i in "${Frutas[@]}"
do
    echo $i
done
echo "======= while 1 ======="
contador=0
while [[ $contador -lt ${#Frutas[@]} ]]
do
    echo $contador
    contador=$(($contador+1))
done