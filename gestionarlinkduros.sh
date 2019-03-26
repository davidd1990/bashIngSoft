clear
while :
do
echo " Escoja una opcion "
echo "1. Realizar Un LINK DURO"
echo "2. Salir"
echo -n "Seleccione una opcion [1 - 2]"
read opcion
case $opcion in
1) echo "Digite la ruta del archivo";read l;echo "Nombre del nuevo archivo";read a;  ln $l $a;;
2) echo "agur"; clear ;
exit 1;;
*) echo "$opc no es una opcion válida.";
echo "Presiona una tecla para continuar...";
read foo;;
esac
done

