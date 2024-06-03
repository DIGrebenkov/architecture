for i in {1..20}
do
    curl -d "login=alramar$i&password=1184$i&email=alramar$i@mail.ru&name=Alair&surname=Marit" -X POST localhost:8080/user
done
for i in {1..20}
do
    curl -d "delivery_id=$i&sender_id=$i&receiver_id=$i&date=$i&weight=$i&height=$i&width=$i&length=$i" -u "alramar4:11844" -X POST localhost:8888/delivery
done