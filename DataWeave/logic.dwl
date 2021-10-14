%dw 2.0
output json
// vars
var varchallenge = {
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
var secondLevel = varchallenge.secondLevel
var thirdLevel = varchallenge.secondLevel.thirdLevel
var result = {
        "descendant": varchallenge..id,      
        "multivalue": varchallenge.*id,
        "multivalueSecondLevel": varchallenge.*id,
        "multivalueThirdLevel": varchallenge.*id,
        "allTheIds": varchallenge..*id
    }

// logical
var names = {"name": "Max"}
var logic = names.name == "Max"

// challenge
var challenge = {
        "name": "Max the Mule",     
        "locations": [
                {
                    "name": "Max’s house",     
                    "address": "1234 Mule Street",
                    "state": "CA"
                }
            ]
    }
---
[
    challenge..name,
    challenge.locations.*address[0],
    challenge.locations.*state[0] != "CA"
]
/* Output
[
    [
        "Max the Mule",
        "Max’s house"
    ],
    "1234 Mule Street",
    false
]
*/