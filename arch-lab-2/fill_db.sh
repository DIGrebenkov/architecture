for i in {1..20}
do
    curl -d "login=alramar$i&password=1184$i&email=alramar$i@email.ru&name=Alair&surname=Marit" -X POST localhost:8080/user
done
