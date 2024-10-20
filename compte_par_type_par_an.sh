#!/bin/bash

# Vérifie qu'un argument est donné (type d'entité)
if [ $# -ne 1 ]; then
    echo "Usage: $0 <type d'entité>"
    exit 1
fi

entity_type=$1

# Boucle sur les années 2016, 2017 et 2018
for year in 2016 2017 2018; do
    # Appelle le script compte_par_type.sh pour chaque année
    count=$(./compte_par_type.sh $year $entity_type)
    
    # Affiche le résultat pour chaque année
    echo "Year: $year - $entity_type: $count"
done
