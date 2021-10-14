%dw 2.0
// if
output json
// case
var data2 = {
        "id": 290505,           
        "status": 0,
        "name": "Cabin outdoor light"
    }
var status = data2.status  match {
        case 0 ->  "Light off"
        case 1 ->  "Light on"
    }

// challenge
var result = {
        "status": "ok"
    }

// if
var data1 = {
        "price": 150.00
    }
var actions = if (data1.price < 100) "buy" else if (data1.price > 140) "sell" else "hold"
---
/*
// if
if (result.status == 'ok')
    {
        "message": "Request successfully processed."
    } 
else
    {
        "message": "Please try again later"
    }
*/

// case
result.status match {
    case "ok" ->
    "message": "Request successfully processed."
    else ->
    "message": "Please try again later."
}
