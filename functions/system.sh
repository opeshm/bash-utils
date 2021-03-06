function psgrep () {
  if [ $# -lt 1 ]; then
    e_error "Se necesita un parámetro";
    exit 0;
  fi

  param=$1;

  ps -de | grep $param;
  ids=`ps -de | grep $param | sed 's/^ *//g' | cut -f1 -d\ `;

  if [ "$ids" != "" ]; then
    e_warning "Quieres matar algún proceso? [Y/n]";
    read killP;

    killP=${killP};

    if [ "$killP" != "Y" ] && [ "$killP" != "" ]; then
        exit 0;
    fi;

    e_warning "ID o IDs de los procesos que quiere matar (separados por espacios): "
    read killID;

    kill -9 $killID;

  else
    e_error "No se encuentran procesos activos";
  fi;

  exit 0;

}
