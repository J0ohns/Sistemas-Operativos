archivo_salida="reporte_recursos.txt"

echo "Tiempo %CPU_Libre %Memoria_Libre %Disco_Libre" > "$archivo_salida"
echo "Tiempo %CPU_Libre %Memoria_Libre %Disco_Libre"
tiempo_Inicio=$(date +"%H:%M:%S")

for i in {1..5}; do
    tiempo_actual=$(date +"%H:%M:%S")
    cpu_libre=$(top -n1 | grep "Cpu(s)" | awk '{print $8}')
    memoria_libre=$(free | grep Mem | awk '{print $4/$2 * 100}')
    disco_libre=$(df --total | grep 'total' | awk '{print 100 - $5}')
    t=$(( $(date -d "$tiempo_actual" +%s) - $(date -d "$tiempo_Inicio" +%s) ))
    echo "$t s $cpu_libre % $memoria_libre % $disco_libre % " >> "$archivo_salida"
    echo "$t s $cpu_libre % $memoria_libre % $disco_libre % "
    sleep 60
done

echo "Monitoreo completado. Datos guardados en $archivo_salida."


