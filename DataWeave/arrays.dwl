%dw 2.0
output json

// filter
var movies: Array<String> = ["The Terminator", "Titanic", "Avatar"]

fun isOddNum(n: Number): Boolean = (n mod 2) == 1
fun isOddNum(s: String): Boolean = (sizeOf(s) mod 2) == 1

var oddMovies = movies filter (isOddNum($))
//

// map
var mapInput = [
        {
            "value": 2,           
            "index": 0
        },
        {
            "value": 3,           
            "index": 1
        },
        {
            "value": 4,           
            "index": 2
        },
        {
            "value": 5,           
            "index": 3
        },
        {
            "value": 6,           
            "index": 4
        }
    ]
var mapOut = mapInput map (n, idx) -> {value: n + 1, index: idx}

// distinctBy
var shoppingList = [
        {"orderId": "1", "lineId": "1", "product": "toothpaste"},
        {"orderId": "1", "lineId": "2", "product": "floss"},
        {"orderId": "2", "lineId": "3", "product": "toothbrush"},
        {"orderId": "2", "lineId": "3", "product": "mouth wash"},
        {"orderId": "2", "lineId": "4", "product": "mouth wash"}
    ]
var distinct = shoppingList distinctBy $.product

// groupBy
var events = [
        {
            "datetime": "2020-01-01T08:00:00",        
            "dayOfWeek": "wed",
            "event": "Breakfast @ Cafe"
        },
        {
            "datetime": "2020-01-01T18:00:00",        
            "dayOfWeek": "wed",
            "event": "Study for cert exam"
        },
        {
            "datetime": "2020-01-04T16:00:00",        
            "dayOfWeek": "sat",
            "event": "Drinks w/ friends"
        },
        {
            "datetime": "2020-01-08T08:00:00",        
            "dayOfWeek": "wed",
            "event": "Develop mule application"
        },
        {
            "datetime": "2020-01-05T08:00:00",        
            "dayOfWeek": "sun",
            "event": "Football game"
        }
    ]
var grouped = events groupBy $.dayOfWeek

// reduce
var names = [
        {"id": "1", "name": "dev"},
        {"id": "2", "name": "test"},
        {"id": "3", "name": "uat"},
        {"id": "4", "name": "prod"}
    ]
var reduced = names reduce (item, acum = {}) -> acum ++ (item.name): item.id

// challenge
var challenge = [
        {
            "datetime": "2020-01-01T08:00:00",     
            "event": "Breakfast @ Cafe",
            "organizer": "Phoebe"
        },
        {
            "datetime": "2020-01-02T18:00:00",     
            "event": "Study for cert exam",
            "organizer": "Ross"
        },
        {
            "datetime": "2020-01-04T16:00:00",     
            "event": "Drinks w/ friends",
            "organizer": "Monica"
        },
        {
            "datetime": "2020-01-08T08:00:00",     
            "event": "Develop mule application",
            "organizer": "Ross"
        },
        {
            "datetime": "2020-01-05T08:00:00",     
            "event": "Football game",
            "organizer": "Joey"
        }
    ]
var weekdays = [
        "mon",
        "tue",
        "wed",
        "thu",
        "fri",
        "sat",
        "sun"
    ]
// dayOfWeek is a value from 1 to 7
fun toWeekDay(date: String): String = weekdays[(date as LocalDateTime).dayOfWeek - 1]
---
//toWeekDay("2020-10-01T22:00:00")
challenge map ($ ++ day: toWeekDay($.datetime)) filter ($.organizer == "Ross")
