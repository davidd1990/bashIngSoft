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

echo -n "Procesando"
while true; do echo -n ".";sleep 1 ; done & trap 'kill $!' SIGTERM SIGKILL
totalfile=0
A=`find $HOME/$1 -type f `
for a in $A
	do
	let totalfile=totalfile+1	
	tipo=`file -i $a| grep -v 'inode/directory'| awk '{ print $2 }' `	
	echo $tipo >> tipos		
done

tiposdatos=`awk '!a[$0]++' tipos `
for a in $A
	do
	peso=`ls -l $a | awk '{print $5}' `
	tipo=`file -i $a| grep -v 'inode/directory'| awk '{print $2}'`
	for item in $tiposdatos
	do
		if [ $item = $tipo ]
		then
			m=${item/\//}
			y=${m/;/}
			echo $peso >> $y		
		fi
	done		 
done
echo ""
echo "${DEFAULT}${orange}Resultado de la operacion${blue}"
for arch in $tiposdatos
do
        m=${arch/\//}
        y=${m/;/}
	x=`awk '{s+=$1} END {print s}' $y`
	z=`wc -l $y`
	echo $x bytes en un total de $z archivos de tipo $arch >> ultimo
done
pesototal=`awk '{s+=$1} END {print s}' ultimo`
echo peso total = $pesototal >> ultimo
echo numero de archivos = $totalfile >> ultimo
for arch in $tiposdatos
do 
	m=${arch/\//}
        y=${m/;/}
	rm $y

done
sort -nr ultimo
rm ultimo
rm tipos
kill $!
