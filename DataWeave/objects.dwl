%dw 2.0
output json

// filter
var fobj = {
        "name": "Jerry",     
        "middle_name": false,
        "last_name": "Schumann",
        "secret_key": "903mg20mgg4",
        "secret_password": "d0n0tH4ckm3PLiZ",     
        "question_secret": "Do you wish to get hacked?",
        "personal_token": false
    }
var filtered = fobj filterObject () -> ($ != false) and not ($$ contains "secret")

// map
var mobj = [
        {"First Name": "Max", "Last Name": "The Mule"},
        {"First Name": "Albert", "Last Name": "Einstein"}
    ]
var mapped = mobj map ($ mapObject (value, key) -> {(lower(key)): upper(value)})

// pluck
var pobj = [
        {
            "orderId": 1,   
            "customer": "Josh",
            "lineId": 1,
            "lineItem": "Shoes",
            "price": 50
        },
        {
            "orderId": 1,   
            "customer": "Josh",
            "lineId": 2,
            "lineItem": "Socks",
            "price": 20
        },
        {
            "orderId": 2,   
            "customer": "Mariano",
            "lineId": 3,
            "lineItem": "Shirt",
            "price": 30
        },
        {
            "orderId": 2,   
            "customer": "Mariano",
            "lineId": 4,
            "lineItem": "Jacket",
            "price": 80
        }
    ]
var plucked = pobj groupBy $.orderId pluck $

var upobj = {
        "username": "WASP", 
        "name": "Lisbeth",
        "surname": "Salander",
        "location": {
                "address": {
                        "street": "Lundagatan", 
                        "number": 9
                    }, 
                "city": "Stockholm",
                "country": "Sweden"
            }
    }
var updated = upobj update {
        case .username -> lower($)
        case .location.address.street -> "Fiskargatan"
}
---
payload