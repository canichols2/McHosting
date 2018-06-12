#!/usr/bin/env bash

# This script will install and configure the web control panel.
# By default, this will use port 1337

## Create directory in /var/www
## TODO Add support for other distros

# Error Codes
# 1: This script was unable to create the installation directory. Likely due to permissions

echo "Currently a work in progress. This script is not ready to be run."
exit 20

if [[ "${EUID}" -gt 0 ]];then
  echo "Please run this script as root."
  exit 1
fi

echo "Installing web server..."
# Check serverInfo.properties for user provided web server
webServer=$(grep -oP "webServer=\K.*" ./serverInfo.properties)

# Validate provided web server
case $webServer in
  "apache")
    echo "I see you've chosen to use Apache as your web server..."
    echo "Installing now."
    apt install -y apache2

    # Check to make sure apache installed
    confirmApache=$(which apache2)
    if [[ -n "${confirmApache}" ]]; then
      echo "Apache installed succesfully."
    else
      echo "Apache failed to install."
      echo "Existing script."
      exit 4
    fi
    echo "Configuring virtual host file..."
    # TODO Continue Apache Configuration
    ;;
  "nginx")
    # TODO Continue Nginx Configuration
    ;;
esac


# TODO Wishlist: Validation of existing webservers



installControlPanelDir=$(grep -oP "installControlPanel=\K.*")

# Create Control Panel installation directory
if [[ -d "${installControlPanelDir}" ]]; then
  echo "Minecraft Control Panel installation directory ${installControlPanelDir} already exists. Moving on..."
else
  echo "Minecraft Control Panel installation directory does not exist."
  echo "Creating it now..."
  mkdir ${installControlPanelDir}
  if [[ -d "${installControlPanelDir}" ]]; then
    echo "Installation directory created succesfully."
  else
    echo "Creating ${installControlPanelDir} failed."
    echo "Error Code: DirectoryCreationFailure"
    echo "Please check to make sure that your user has the correct permissions to create ${installControlPanelDir} and re-run this script."
    exit 1
  fi
fi

# Copy necessary files into installation directory

cp -R ./controlPanel "${installControlPanelDir}"

## TODO Make changes to the www-data depending on OS

chown www-data:"${USER}" "${installControlPanelDir}"

if [[ "$?" -gt 0 ]]; then
  echo "Permissions succesfully set on ${installControlPanelDir} for the web server."
else
  echo "Failed to set permissions on ${installControlPanelDir}. Installation can continue, but you may experience issues."
fi

## Create virtualHost for webServer

cp ./virtualhost /etc/
