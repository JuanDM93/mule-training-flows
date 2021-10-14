%dw 2.0
output xml
var types = typeOf("hello")         //String
var number = 3.1415                 //Number
var bool = {                        
        "string": typeOf("hello"),  
        "number": typeOf(1),
        "boolean": typeOf(true)     //Boolean
    }
var primes = [2, 3, 5, 7, 11]       //Array
---
// Object
{
    titles: {
            title: "Titanic",  
            title: "Avatar"
        }
}