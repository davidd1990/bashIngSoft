clear
while :
do
echo " Escoja una opcion "
echo "1. listar los procesos"
echo "2. Para un proceso"
echo "3. Reanudar un proceso"
echo "4. Matar proceso"
echo "5. SAlir"
echo -n "Seleccione una opcion [1 - 5]"
read opcion
case $opcion in
1) ps aux ;;
2) echo "Ingreso el numero de proceso que desa para:";
read i; kill -19 $i ;;
3) echo "Ingrese el numero de proceso que desea reanudar:";
read l; kill -18 $l ;;
4) echo "Ingrese el numero de proceso que desea matar"; read g; kill -9 $g ;;
5) echo "agur"; clear ;
exit 1;;
*) echo "$opc no es una opcion válida.";
echo "Presiona una tecla para continuar...";
read foo;;
esac
done


