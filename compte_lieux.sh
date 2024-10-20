
if [ "$#" -ne 3 ]; then
    echo "Usage: ./compte_lieux.sh <année> <mois> <nombre>"
    exit 1
fi


year=$1
month=$2
top_n=$3


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


grep -h "Location" $files | awk '{print $3}' | sort | uniq -c | sort -nr | head -n $top_n
