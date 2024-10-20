
if [ "$#" -ne 2 ]; then
    echo "Usage: ./compte_par_type.sh <année> <type>"
    exit 1
fi


year=$1
entity_type=$2


if ! [[ "$year" =~ ^(2016|2017|2018)$ ]]; then
    echo "Erreur : L'année doit être 2016, 2017 ou 2018."
    exit 1
fi

if [ -z "$entity_type" ]; then
    echo "Erreur : Le type d'entité ne peut pas être vide."
    exit 1
fi


count=$(grep -i "$entity_type" ann/${year}/*.ann | wc -l)
echo "$count"
