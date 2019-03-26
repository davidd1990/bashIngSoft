clear
while :
do
echo " Escoja una opcion "
echo "1. Realizar Back ups"
echo "2. Restaurar Back up"
echo "3. Consultar Back up"
echo "4. Borrar Back Up"
echo "5. SAlir"
echo -n "Seleccione una opcion [1 - 5]"
read opcion
case $opcion in
1) echo "Digite el nombre que desea que tenga el backup";read a;echo "digite la ruta donde se enc   uentra la carpeta"; read d; tar -cvf $a.tar $d   ;;
2) echo "Digita la ruta donde se encuentra el back up";read r;  tar -xvf $r ;;
3) echo "Digite el back up que desea consultar:"; read c ; tar -tvf $c ;;
4) echo "Digite el backup que desea eliminar"; read e; rm $e.tar ;;
5) echo "agur"; clear ;
exit 1;;
*) echo "$opc no es una opcion válida.";
echo "Presiona una tecla para continuar...";
read foo;;
echo ""
esac
done

