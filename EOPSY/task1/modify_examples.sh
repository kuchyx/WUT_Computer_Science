#!/bin/bash

touch a
touch B
touch SED
mkdir foldera
mkdir FOLDERB
mkdir FOLDERSED
mkdir upperfoldermain
cd upperfoldermain
touch upperfilesub
mkdir upperfoldersub
cd upperfoldersub
touch upperfilesubsub
cd ..
cd ..


mkdir LOWERCASEFOLDERMAIN 
cd LOWERCASEFOLDERMAIN
touch LOWERFILESUB
mkdir LOWERFOLDERSUB
cd LOWERFOLDERSUB
touch LOWERFILESUBSUB
cd ..
cd ..

mkdir SEDLOWERCASEFOLDERMAIN
cd SEDLOWERCASEFOLDERMAIN
touch SEDLOWERFILESUB
mkdir SEDLOWERFOLDERSUB
cd SEDLOWERFOLDERSUB
touch SEDLOWERFILESUBSUB
cd ..
cd ..

touch recursefile
touch RECURSELOWERFILE
touch SEDRECURSEFILE



echo "Typical scenarios"
echo "Uppercasing file with filename a"
echo "Lowercasing file with filename B"
echo "Using sed pattern for lowercasing of file with filename SED"
echo "Uppercasing folder with name foldera non recursively"
echo "Lowercasing folder with name FOLDERB non recursively"
echo "Using sed pattern for lowercasing of folder with name FOLDERSED non recursively"

echo "Uppercasing folder recursively"
echo "Main folder name: upperfoldermain"
echo "folder contains: folder named upperfoldersub , file named upperfilesub"
echo "subfolder upperfoldersub contains file named upperfilesubsub"

echo "Lowercasing folder recursively"
echo "Main folder name: LOWERFOLDERMAIN"
echo "folder contains: folder named LOWERFOLDERSUB , file named LOWERFILESUB"
echo "subfolder LOWERFOLDERSUB contains file named LOWERFILESUBSUB"

echo "using sed pattern for Lowercasing folder recursively"
echo "Main folder name: SEDLOWERFOLDERMAIN"
echo "folder contains: folder named SEDLOWERFOLDERSUB , file named SEDLOWERFILESUB"
echo "subfolder SEDLOWERFOLDERSUB contains file named SEDLOWERFILESUBSUB"

echo "Uncommon scenarios"
echo "uppercasing recursively normal file recursefile"
echo "lowercasing recursively normal file RECURSELOWERFILE"
echo "using sed pattern recursively for normal file to lowercase it SEDRECURSEFILE"

echo "Incorrect scenarios"
echo "not providing enough arguments"
echo "not providing file"
echo "not providing argument for recursion"
echo "provding filename/foldername for file/folder which does not exist"


