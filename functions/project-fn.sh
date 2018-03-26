#!/bin/bash

function create-project-html5 () {

  user_record="$(getent passwd $USER)"
  user_gecos_field="$(echo "$user_record" | cut -d ':' -f 5)"
  user_full_name="$(echo "$user_gecos_field" | cut -d ',' -f 1)"

  read -e -p "Folder: " PROJECT_HTML5_FOLDER
  read -e -p "Title: " PROJECT_HTML5_TITLE
  read -e -p "Description: " PROJECT_HTML5_DESCRIPTION
  read -e -p "Author <${user_full_name}>: " PROJECT_HTML5_AUTHOR

  if [ "${PROJECT_HTML5_AUTHOR}" == "" ]
  then
    PROJECT_HTML5_AUTHOR=${user_full_name}
  fi

  mkdir -p ./${PROJECT_HTML5_FOLDER}/{js,css}

  touch ./${PROJECT_HTML5_FOLDER}/js/main.js
  touch ./${PROJECT_HTML5_FOLDER}/css/styles.css

  cat > ./${PROJECT_HTML5_FOLDER}/index.html << EOF
<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title>${PROJECT_HTML5_TITLE}</title>
  <meta name="description" content="${PROJECT_HTML5_DESCRIPTION}">
  <meta name="author" content="${PROJECT_HTML5_AUTHOR}">

  <link rel="stylesheet" href="css/styles.css?v=1.0">

  <!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
  <![endif]-->
</head>

<body>
  <script src="js/main.js"></script>
</body>
</html>
EOF

}
