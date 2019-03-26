
totalfile=0
A=`find $1 -type f `
for a in $A
	do
	let totalfile=totalfile+1	
	tipo=`file -i $a| grep -v 'inode/directory'| awk '{ print $2 }' `
       echo "esta procesando"	
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
