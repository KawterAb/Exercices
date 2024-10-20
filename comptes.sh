

for year in 2016 2017 2018; do
    echo "Pour l'anné : $year"
    
   
    count=$(grep -ci "location" ann/${year}/*.ann | wc -l)
    
    echo "Year: $year - Locations: $count"
done
