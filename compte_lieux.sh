
if [ "$#" -ne 3 ]; then
    echo "Usage: ./compte_lieux.sh <année> <mois> <nombre>"
    exit 1
fi


year=$1
month=$2
number=$3


if ! [[ "$year" =~ ^(2016|2017|2018|\*)$ ]]; then
    echo "Erreur : L'année doit être 2016, 2017, 2018 ou *."
    exit 1
fi


if ! [[ "$month" =~ ^(0[1-9]|1[0-2]|\*)$ ]]; then
    echo "Erreur : Le mois doit être entre 01 et 12 ou *."
    exit 1
fi


if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Erreur : Le nombre doit être un entier positif."
    exit 1
fi


directory="ann"


if [ "$year" == "*" ]; then
    year_pattern="*"
else
    year_pattern="$year"
fi

if [ "$month" == "*" ]; then
    month_pattern="*"
else
    month_pattern="$month"
fi


files=$(find $directory/$year_pattern -name "${year}_${month_pattern}*.ann")


if [ -z "$files" ]; then
    echo "Aucun fichier trouvé pour l'année et le mois donnés."
    exit 1
fi

grep -h "Location" $files | awk '{print $3}' | sort | uniq -c | sort -nr | head -n $number

