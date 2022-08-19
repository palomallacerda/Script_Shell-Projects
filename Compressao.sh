#!/bin/bash
#Script para descompactar aquivos

#if [ $# -lt 1 ]
#then
#	read -p "Insira o caminho e nome  do arquivo: " prefixo
#else
#	prefixo=$1
#fi

#idenficiando qual forma de compreção
#echo "$prefixo" |  rev | cut -c-3 | rev

main()
{
   clear
   echo "Menu de opcoes"
   echo ""
   echo "1. Compactar para .tar"
   echo "2. Compactar para .tar.gz"
   echo "3. Compactar para .bz2"
   echo "4. Compactar para .zip"
   echo "5. Descompactar .tar"
   echo "6. Descompactar .tar.gz"
   echo "7. Descompactar .bz2"
   echo "8. Descompactar .zip"
   echo "0. sair"
   echo ""
   echo -n "Sua opção: "
   read OPCAO
   case $OPCAO in
      1) compactarTar;;
      2) compactarGz;;
      3) compactarBz2;;
      4) compactarZip;;
      5) descompactarTar;;
      6) descompactarGz;;
      7) descompactarBz2;;
      8) descompactarZip;;
      0) exit;;
      *) echo "Opção inválida"; clear; main;;
   esac
}
compactarTar()
{
   clear
   echo -n "Digite o diretorio onde esta o arquivo:"
   read DIRETORIO
   echo -n "Digite o nome do arquivo: "
   read ARQUIVO
   COMPACTAR="$DIRETORIO/$ARQUIVO"

   #comando para compactar arquivo tar
   tar -cf $ARQUIVO.tar $COMPACTAR 2> /dev/null
   if [ $? -eq 0 ]; then
      echo "Arquivo compactado"
      sleep 2
      clear
      exit
   else
            echo "Arquivo não foi compactado"
            clear
   fi

main
}
compactarGz()
{
        clear
        echo -n "Digite o diretorio onde esta o arquivo:"
        read DIRETORIO
        echo -n "Digite o nome do arquivo: "
        read ARQUIVO
        COMPACTAR="$DIRETORIO/$ARQUIVO"

        tar -czf $ARQUIVO.tar.gz $COMPACTAR 2> /dev/null
        if [ $? -eq 0 ]; then
           echo "Arquivo compactado"
           sleep 2
           clear
	   exit
        else
            echo "Arquivo não foi compactado"
            clear
        fi
main
}
compactarBz2()
{
        clear
        echo -n "Digite o diretorio onde esta o arquivo: "
        read DIRETORIO
        echo -n "Digite o nome do arquivo: "
        read ARQUIVO
        COMPACTAR="$DIRETORIO/$ARQUIVO"

        tar -cjf $ARQUIVO.bz2 $COMPACTAR 2> /dev/null
        if [ $? -eq 0 ]; then
           echo "Arquivo compactado"
           sleep 3
           clear
           exit
        else
            echo "Arquivo não foi compactado"
            clear
        fi
main
}

compactarZip(){
	clear
	echo -n "Digite o diretorio onde esta o arquivo: "
	read DIRETORIO
	echo -n "Digite o nome do arquivo: "
	read ARQUIVO
	COMPACTAR="$DIRETORIO/$ARQUIVO"

	zip -v $ARQUIVO.zip "~/${COMPACTAR}" 2> /dev/null

	if [ $? -eq 0 ]; then
	   echo "Arquivo zip compactado"
	   sleep 3
	   exit
	else
	   echo "Arquivo zip não compactado"
	  exit
	fi
}

descompactarTar()
{
   clear
   echo -n "Digite o diretorio onde esta o arquivo: "
   read DIRETORIO
   echo -n "Digite o nome do arquivo.tar: "
   read ARQUIVO
   CAMINHO="$DIRETORIO/$ARQUIVO"
   tar -xf $CAMINHO
   if [ $? -eq 0 ]; then
     echo "Arquivo descompactado no diretorio corrente."
     exit
   else
     echo "Erro! arquivo não foi descompactado"
   fi
   sleep 3
   clear
   main
}
descompactarGz()
{
        clear
        echo -n "Digite o diretorio onde esta o arquivo: "
        read DIRETORIO
        echo -n "Digite o nome do arquivo.tar: "
        read ARQUIVO
        CAMINHO="$DIRETORIO/$ARQUIVO"
        tar -xzf $CAMINHO
        if [ $? -eq 0 ]; then
          echo "Arquivo descompactado no diretorio corrente."
	  exit
        else
          echo "Erro! arquivo não foi descompactado"
        fi
        sleep 2
        clear
        main
}

descompactarBz2()
{
        clear
        echo -n "Digite o diretorio onde esta o arquivo: "
        read DIRETORIO
        echo -n "Digite o nome do arquivo.tar: "
        read ARQUIVO
        CAMINHO="$DIRETORIO/$ARQUIVO"
        tar -xjf $CAMINHO
        if [ $? -eq 0 ]; then
          echo "Arquivo descompactado no diretorio corrente."
	  exit
        else
          echo "Erro! arquivo não foi descompactado"
        fi
        sleep 3
        clear
        main
}
main

