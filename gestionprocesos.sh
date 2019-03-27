bold=`echo -en "\e[1m"`
underline=`echo -en "\e[4m"`
dim=`echo -en "\e[2m"`
strickthrough=`echo -en "\e[9m"`
blink=`echo -en "\e[5m"`
reverse=`echo -en "\e[7m"`
hidden=`echo -en "\e[8m"`
normal=`echo -en "\e[0m"`
black=`echo -en "\e[30m"`
red=`echo -en "\e[31m"`
green=`echo -en "\e[32m"`
orange=`echo -en "\e[33m"`
blue=`echo -en "\e[34m"`
purple=`echo -en "\e[35m"`
aqua=`echo -en "\e[36m"`
gray=`echo -en "\e[37m"`
darkgray=`echo -en "\e[90m"`
lightred=`echo -en "\e[91m"`
lightgreen=`echo -en "\e[92m"`
lightyellow=`echo -en "\e[93m"`
lightblue=`echo -en "\e[94m"`
lightpurple=`echo -en "\e[95m"`
lightaqua=`echo -en "\e[96m"`
white=`echo -en "\e[97m"`
default=`echo -en "\e[39m"`
BLACK=`echo -en "\e[40m"`
RED=`echo -en "\e[41m"`
GREEN=`echo -en "\e[42m"`
ORANGE=`echo -en "\e[43m"`
BLUE=`echo -en "\e[44m"`
PURPLE=`echo -en "\e[45m"`
AQUA=`echo -en "\e[46m"`
GRAY=`echo -en "\e[47m"`
DARKGRAY=`echo -en "\e[100m"`
LIGHTRED=`echo -en "\e[101m"`
LIGHTGREEN=`echo -en "\e[102m"`
LIGHTYELLOW=`echo -en "\e[103m"`
LIGHTBLUE=`echo -en "\e[104m"`
LIGHTPURPLE=`echo -en "\e[105m"`
LIGHTAQUA=`echo -en "\e[106m"`
WHITE=`echo -en "\e[107m"`
DEFAULT=`echo -en "\e[49m"`;
fin="EScoge entre los numeros [1 - 5]"
columns=$(tput cols)
user=`who|awk '{print $1}'`
clear
while :
do
	echo "${DEFAULT}${orange} "
echo "1. listar los procesos"
echo "2. Parar un proceso"
echo "3. Reanudar un proceso"
echo "4. Matar proceso"
echo "5. SAlir"
echo "${green}"
printf "%*s\n" $(((${#fin}+$columns)/2)) "$fin"

read opcion
case $opcion in
1) ps aux ;;
2)echo "${lightyellow} Los Siguentes son los proceso que mas consumen en tu computador";echo "${white}"; ps -x -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head;echo "${purple}Ingreso el numero de proceso que desea para:";
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


