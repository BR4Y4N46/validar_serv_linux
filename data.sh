#!/bin/bash

# Función para imprimir texto en color
print_color() {
    COLOR=$1
    TEXT=$2
    echo -e "\e[${COLOR}m${TEXT}\e[0m"
}

check_apache_status() {
    if systemctl is-active --quiet httpd; then
        print_color "1;32" "Activo"
    else
        print_color "1;31" "Inactivo"
    fi
}

# Obtener la dirección IP del servidor
IP=$(hostname -I)

# Obtener la salida de uname
UNAME=$(uname -ors)

# Obtener el hostname
HOSTNAME=$(hostname)

APACHE_STATUS=$(check_apache_status)

# Obtener la memoria RAM disponible
RAM=$(free -h | awk 'NR==2{print $2}')

# Imprimir los datos en una tabla organizada con colores
print_color "1;32" "+-----------------------------+"
print_color "1;32" "|      Datos del Servidor     |"
print_color "1;32" "+-----------------------------+"
print_color "1;36" "| Dirección IP:    | $IP"
print_color "1;36" "| Sistema:         | $UNAME"
print_color "1;36" "| Hostname:        | $HOSTNAME"
print_color "1;36" "| Memoria RAM:     | $RAM"
print_color "1;32" "+-----------------------------+"




# Imprimir el estado del servicio Apache en otra tabla
print_color "1;32" "+---------------------------------------+"
print_color "1;32" "|        Estado del Servicio Apache    |"
print_color "1;32" "+---------------------------------------+"
print_color "1;36" "| Apache:             | $APACHE_STATUS"
print_color "1;32" "+---------------------------------------+"
