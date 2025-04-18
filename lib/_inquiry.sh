#!/bin/bash

get_mysql_root_password() {
  print_banner
  printf "${WHITE} 💻 Ingresa la ${YELLOW}CONTRASEÑA${WHITE} para el usuario Deploy y la base de datos (No utilizar caracteres especiales):${GRAY_LIGHT}"
  printf "\n\n"
  
  while true; do
    read -p "> " mysql_root_password
    echo

    # Validar que no tenga caracteres especiales (solo letras y números)
    if [[ "$mysql_root_password" =~ ^[a-zA-Z0-9]+$ ]]; then
      break
    else
      echo -e "${RED}❌ La contraseña no debe contener caracteres especiales. Intenta nuevamente.${GRAY_LIGHT}"
    fi
  done
}

get_link_git() {
  
  print_banner
  
  default_link="https://github.com/MinoruMX/Chasap.git"
  printf "${WHITE} 💻 Ingresa el enlace de ${YELLOW}GITHUB${WHITE} de Chasap que deseas instalar:${GRAY_LIGHT}\n"
  printf "  Presiona Enter para usar el valor por defecto:\n\n"
  printf "  ${default_link}\n\n"
  read -p "> " link_git
  # Si el usuario no escribe nada, se usa el valor por defecto
  link_git="${link_git:-$default_link}"
}

get_instancia_add() {
  
  print_banner
  printf "${WHITE} 💻 Proporciona un nombre para ${YELLOW}Instancia/Empresa${WHITE} que se instalará (No utilizar espacios ni caracteres especiales, usa solo letras minúsculas):${GRAY_LIGHT}"
  printf "\n\n"

    while true; do
    read -p "> " instancia_add
    echo

   # Validar que solo contenga letras minúsculas y números
    if [[ "$instancia_add" =~ ^[a-z0-9]+$ ]]; then
      # Si es válido, salimos del bucle
      break
    else
      echo -e "${RED}❌ La Instancia no debe contener caracteres especiales ni letras mayúsculas. Intenta nuevamente.${GRAY_LIGHT}"
    fi
  done
}

get_max_whats() {
  
  print_banner
  printf "${WHITE} 💻 Ingresa la cantidad de ${YELLOW}conexiones/Whats${WHITE} que ${instancia_add} podrá registrar:${GRAY_LIGHT}"
  printf "\n\nEj:1000\n\n"
  read -p "> " max_whats
}

get_max_user() {
  
  print_banner
  printf "${WHITE} 💻 Ingresa la cantidad de ${YELLOW}usuarios/atendedores${WHITE} que ${instancia_add} podrá registrar:${GRAY_LIGHT}"
  printf "\n\nEj:1000\n\n"
  read -p "> " max_user
}

get_frontend_url() {
  
  print_banner
  printf "${WHITE} 💻 Ingresa el ${YELLOW}dominio${WHITE} del FRONTEND/PANEL para ${instancia_add}:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " frontend_url
}

get_backend_url() {
  
  print_banner
  printf "${WHITE} 💻 Ingresa el ${YELLOW}dominio${WHITE} del BACKEND/API para ${instancia_add}:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " backend_url
}

get_frontend_port() {
  
  print_banner
  printf "${WHITE} 💻 Ingresa el ${YELLOW}puerto${WHITE} del FRONTEND para ${instancia_add}; Ej: 3000 A 3999 ${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " frontend_port
}


get_backend_port() {
  
  print_banner
  printf "${WHITE} 💻 Ingresa el ${YELLOW}${WHITE}puerto del BACKEND para esta instancia; Ej: 4000 A 4999 ${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " backend_port
}

get_redis_port() {
  
  print_banner
  printf "${WHITE} 💻 Ingresa el ${YELLOW}${WHITE}puerto de REDIS/AGENDAMIENTO MSG para ${instancia_add}; Ej: 5000 A 5999 ${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " redis_port
}

get_empresa_delete() {
  
  print_banner
  printf "${WHITE} 💻 Ingresa el nombre de la Instancia/Empresa que será eliminada (Ingresa el mismo nombre con el que la instalaste):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " empresa_delete
}

get_empresa_atualizar() {
  
  print_banner
  printf "${WHITE} 💻 Ingresa el nombre de la Instancia/Empresa que deseas actualizar (Ingresa el mismo nombre con el que la instalaste):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " empresa_atualizar
}

get_empresa_bloquear() {
  
  print_banner
  printf "${WHITE} 💻 Ingresa el nombre de la Instancia/Empresa que deseas bloquear (Ingresa el mismo nombre con el que la instalaste):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " empresa_bloquear
}

get_empresa_desbloquear() {
  
  print_banner
  printf "${WHITE} 💻 Ingresa el nombre de la Instancia/Empresa que deseas desbloquear (Ingresa el mismo nombre con el que la instalaste):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " empresa_desbloquear
}

get_empresa_dominio() {
  
  print_banner
  printf "${WHITE} 💻 Ingresa el nombre de la Instancia/Empresa cuyo dominio deseas cambiar (Recuerda que para cambiar los dominios debes ingresar ambos, incluso si solo deseas cambiar uno):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " empresa_dominio
}

get_alter_frontend_url() {
  
  print_banner
  printf "${WHITE} 💻 Ingresa el NUEVO dominio del FRONTEND/PANEL para ${empresa_dominio}:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " alter_frontend_url
}

get_alter_backend_url() {
  
  print_banner
  printf "${WHITE} 💻 Ingresa el NUEVO dominio del BACKEND/API para ${empresa_dominio}:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " alter_backend_url
}

get_alter_frontend_port() {
  
  print_banner
  printf "${WHITE} 💻 Ingresa el puerto del FRONTEND de la Instancia/Empresa ${empresa_dominio}; El puerto debe ser el mismo que se informó durante la instalación ${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " alter_frontend_port
}


get_alter_backend_port() {
  
  print_banner
  printf "${WHITE} 💻 Ingresa el puerto del BACKEND de la Instancia/Empresa ${empresa_dominio}; El puerto debe ser el mismo que se informó durante la instalación ${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " alter_backend_port
}


get_urls() {
  get_mysql_root_password
  get_link_git
  get_instancia_add
  get_max_whats
  get_max_user
  get_frontend_url
  get_backend_url
  get_frontend_port
  get_backend_port
  get_redis_port
}

software_update() {
  get_empresa_atualizar
  frontend_update
  backend_update
}

software_delete() {
  get_empresa_delete
  deletar_tudo
}

software_bloquear() {
  get_empresa_bloquear
  configurar_bloqueio
}

software_desbloquear() {
  get_empresa_desbloquear
  configurar_desbloqueio
}

software_dominio() {
  get_empresa_dominio
  get_alter_frontend_url
  get_alter_backend_url
  get_alter_frontend_port
  get_alter_backend_port
  configurar_dominio
}

software_certbot() {
  get_frontend_url
  get_backend_url
  system_certbot_setup
}

software_logs_backend() {
  get_instancia_add
  backend_logs
}

software_logs_frontend() {
  get_instancia_add
  frontend_logs
}

inquiry_options() {
  
  print_banner
  printf "${WHITE} 💻 Bienvenido(a) al Administrador de Chasap, ¡Selecciona la siguiente acción!${GRAY_LIGHT}"
  printf "\n\n"
  printf "   [0] Instalar Chasap\n"
  printf "   [1] Actualizar Chasap\n"
  printf "   [2] Eliminar Chasap\n"
  printf "   [3] Bloquear Chasap\n"
  printf "   [4] Desbloquear Chasap\n"
  printf "   [5] Cambiar dominio Chasap\n"
  printf "   [6] Reinstalar Certificado Certbot\n"
  printf "   [7] Revisar Logs Backend\n"
  printf "   [8] Revisar Logs Frontend\n"
  printf "\n"
  read -p "> " option

  case "${option}" in
    0) get_urls ;;
    
    1) 
      software_update 
      exit
      ;;

    2) 
      software_delete 
      exit
      ;;
    3) 
      software_bloquear 
      exit
      ;;
    4) 
      software_desbloquear 
      exit
      ;;
    5) 
      software_dominio 
      exit
      ;;        
    6) 
      software_certbot
      exit
      ;;   
    7) 
      software_logs_backend
      exit
      ;;   
    8) 
      software_logs_frontend
      exit
      ;;      
    *) exit ;;
  esac
}
