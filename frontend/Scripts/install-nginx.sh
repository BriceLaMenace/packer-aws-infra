#!/bin/bash

# --------------------------------------------
# Script exécuté par Packer sur la VM Frontend
# Il installe Nginx et configure le service
# --------------------------------------------

# Met à jour la liste des paquets
sudo apt update

# Installe Nginx sans confirmation (-y)
sudo apt install -y nginx

# Active Nginx pour qu’il démarre automatiquement au boot
sudo systemctl enable nginx

# Démarre immédiatement le service Nginx
sudo systemctl start nginx
