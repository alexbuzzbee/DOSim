#! /bin/bash

menu=""

function menu()
{
echo "+-------------------+"
echo "|  DOSim installer  |"
echo "+-------------------+"
echo "|1. Install DOSim   |"
echo "|2. Uninstall DOSim |"
echo "|3. Reinstall DOSim |"
echo "|4. Exit            |"
echo "+-------------------+"
echo -n "Enter an option number: "
read menu
}

function douninstall()
{
echo "Deconfiguring DOSim..."
~/.dosim/uninstall
echo "Removing DOSim..."
rm -rv ~/.dosim
}

function doinstall()
{
echo "Downloading DOSim..."
curl -O dosim.programmingwave.com/downloads/builds/latest.zip
echo "Uncompressing DOSim..."
unzip latest
mv -v latest .dosim
rm latest.zip
echo "Configuring DOSim..."
cp ~/.bash_profile ~/.bash_profile.backup
echo PATH=\$PATH:~/.dosim >> ~/.bash_profile
~/.dosim/install
rm ~/.dosim/install
}

function runoption()
{
case $1 in
1)
doinstall
;;
2)
douninstall
;;
3)
douninstall
doinstall
;;
4)
exit 0
;;
esac
}

function main()
{
clear
menu
runoption $menu
}

main
