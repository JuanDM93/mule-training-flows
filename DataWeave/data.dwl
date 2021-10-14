%dw 2.0
var types = typeOf("hello")
var number = 3.1415
var bool = {
        "string": typeOf("hello"), 
        "number": typeOf(1),
        "boolean": typeOf(true)
    }
var primes = [2, 3, 5, 7, 11]
output xml
---
// Object
{
    titles: {
            title: "Titanic", 
            title: "Avatar"
        }
}