%dw 2.0
output json

// lambda
var isOdd = (v) -> (v mod 2) != 0

// filter lambda
var fillamb = filter (payload, (n, idx) -> n > 3)

// infix filter
var infix = payload filter ((v) -> (v mod 5) == 0)
// function
fun isOddNum(v) = if ((v mod 2) != 0) true else false
---
/* $,$$,$$$
[
    {
        "name": "Jonas", 
        "family": "Kahnwald"
    },
    {
        "name": "Mikke", 
        "family": "Nielsen"
    },
    {
        "name": "Claudia", 
        "family": "Tiedemann"
    },
    {
        "name": "Martha", 
        "family": "Nielsen"
    },
    {
        "name": "Charlotte", 
        "family": "Doppler"
    }
]
*/
payload filter ($.name startsWith "C")