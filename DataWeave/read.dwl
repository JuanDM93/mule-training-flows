%dw 2.0
output json
// get "prod"
var data1 = {
        "environment": {
                "stage": "prod"
            },       
        "host": "linux"
    }
var single = data1.environment.stage

// get "qa" & "reversed"
var data2 = ["prod", ["qa", "dev"]]
var singleindex = data2[1][0]
var reversed = data2[-1 to -3]

// get "titles"
var data3 = {
        "movies": {
                "title": "The Terminator",     
                "title": "Titanic",
                "title": "Avatar",
                "director": "James Cameron"
            }
    }
var titles = data3.movies.*title

// get "name"
var data4 = {
        "customer": {
                "name": "Max the Mule",     
                "locations": {
                        "name": "Max’s house",     
                        "address": "1234 Mule Street"
                    },
                "locations": {
                        "name": "Max's cabin",     
                        "address": "345 Lakeside Road"
                    }
            }
    }
var descendants = data4..name

// get ids
var challenge = {
        "id": 1,     
        "id": 11,
        "secondLevel": {
                "id": 2,     
                "id": 22,
                "thirdLevel": {
                        "id": 3,     
                        "id": 33
                    }
            }
    }
---
{
    "descendant": challenge..id,   
    "multivalue": challenge.*id,
    "multivalueSecondLevel": challenge.secondLevel.*id,
    "multivalueThirdLevel": challenge.secondLevel.thirdLevel.*id,
    "allTheIds": challenge..*id
}
/* Output
{
    "descendant": [
            1,
            2,
            3
        ], 
    "multivalue": [
            1,
            11
        ],
    "multivalueSecondLevel": [
            2,
            22
        ],
    "multivalueThirdLevel": [
            3,
            33
        ],
    "allTheIds": [
            1,
            11,
            2,
            22,
            3,
            33
        ]
}
*/