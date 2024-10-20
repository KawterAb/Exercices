
if [ $# -ne 2 ]; then
    echo "Usage: $0 <année> <type d'entité>"
    exit 1
fi

year=$1
entity_type=$2


count=$(grep -i "$entity_type" ann/$year/*.ann | wc -l)


echo $count
