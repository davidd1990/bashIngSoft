clear
while :
do
echo " Escoja una opcion "
echo "1. Ver ultimos comandos del usuario"
echo "2. Gestion de procesos"
echo "3. Gestion de backups"
echo "4. Consultar numero de archivos y peso"
echo "5. Gestionar Links Duros"
echo "6. Salir"
echo -n "Seleccione una opcion [1 - 6]"
read opcion
case $opcion in
1) echo "los ultimos comandos escritos son:";
	cat $(pwd)/.bash_history;;
2) bash gestionprocesos.sh;;
3) bash gestionbackup.sh;;
4) echo "Digite la carpeta que desea verificar";read v ;bash listarfile.sh $v ;;
5) bash gestionarlinkduros.sh;;
6) exit 1;;
*) echo "$opc no es una opcion válida.";
echo "Presiona una tecla para continuar...";
read foo;;
esac
done
