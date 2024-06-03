set -e

mongo <<EOF
db = db.getSiblingDB('deliverydb')
db.createCollection('delivery')
db.delivery.createIndex({delivery_id: 1}, {unique: true})
db.delivery.createIndex({sender_id: 1})
db.delivery.createIndex({receiver_id: 1})
db.delivery.insertOne({delivery_id: 1, sender_id: 1, receiver_id: 1, date: "11.11.2011", package: {weight:11,height:1,width:1,length:100}})
db.delivery.insertOne({delivery_id: 2, sender_id: 2, receiver_id: 2, date: "12.11.2012", package: {weight:11,height:232,width:232,length:200}})
db.delivery.insertOne({delivery_id: 3, sender_id: 3, receiver_id: 3, date: "11.10.2011", package: {weight:1,height:3,width:3,length:300}})
db.delivery.insertOne({delivery_id: 4, sender_id: 1, receiver_id: 1, date: "10.11.2011", package: {weight:11,height:4,width:41,length:45}})
db.delivery.insertOne({delivery_id: 5, sender_id: 5, receiver_id: 2, date: "11.1.2012",  package: {weight:1,height:52,width:5,length:55}})
db.delivery.insertOne({delivery_id: 6, sender_id: 2, receiver_id: 1, date: "11.11.2011", package: {weight:11,height:6,width:631,length:64}})
db.delivery.insertOne({delivery_id: 7, sender_id: 1, receiver_id: 1, date: "10.1.2010",  package: {weight:10,height:7,width:7,length:73}})
db.delivery.insertOne({delivery_id: 8, sender_id: 8, receiver_id: 9, date: "11.4.2012",  package: {weight:1,height:8,width:831,length:108}})
db.delivery.insertOne({delivery_id: 9, sender_id: 9, receiver_id: 8, date: "11.10.2011", package: {weight:1,height:909,width:91,length:108}})
db.delivery.insertOne({delivery_id: 10,sender_id:10,receiver_id:10,date:"10.10.2010",    package: {weight:10,height:10,width:10,length:10}})
EOF