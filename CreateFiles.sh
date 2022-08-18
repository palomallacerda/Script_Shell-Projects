#!/bin/bash

#Script para criar 100 arquivos


if [ $# -lt 1 ]; then
   read -p "Insira o prefixo: " prefixo
else
 prefixo=$1
fi

sufixo="$(date +'%F' | rev)"

arq="${prefixo}_${sufixo}"

#echo $arq
#Criação de loop

for i in {1..100}
do
  touch "${arq}_${i}.txt"
done

