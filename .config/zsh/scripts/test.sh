echo "test"
for i in {5..1}; do
    echo -ne "\rCountdown: $i"
    sleep 1
done
echo -e "\nDone!"