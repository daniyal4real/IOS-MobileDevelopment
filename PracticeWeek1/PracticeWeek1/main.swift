import Foundation


 
 //TASK 1 Easy
func findAreaRectangle(a: Int, b: Int) -> Int {
    if a > 0 && b > 0 {
        return a * b
    }else{
        return -1
    }
}

print("Everything is good: \(findAreaRectangle(a: 2, b: 3))")
print("One side is negative: \(findAreaRectangle(a: 2, b: -3))")




 //TASK 2 Easy
func findPower(voltage: Int, current: Int) -> Int{
    let power = voltage * current
    return power
}

print("Power is", findPower(voltage: 4, current: 5), "mAh")



 

// TASK 3 Easy
func timeConverter(min: Int){
    let seconds = 60
    let convertedTime = min * seconds
    print("In \(min) minutes there are \(convertedTime) seconds")
}

timeConverter(min: 3)





 //TASK 1 Medium
func arrayOfMultiples(num: Int, length: Int) -> [Int] {
    var arr = [Int]()
    for i in 1...length{
        arr.append(i)
    }
    for i in 0...length-1 {
        arr[i] *= num
    }
    return arr
}

print(arrayOfMultiples(num: 7, length: 5))
print(arrayOfMultiples(num: 12, length: 10))
print(arrayOfMultiples(num: 17, length: 6))
 



 
 //TASK 2 Medium
func numberConverter(str: String) -> String {
    let strArr = str.split(separator: " ")
    var arr = [Int]()
    for i in strArr {
        let part = i.components(separatedBy:CharacterSet.decimalDigits.inverted).joined()
        if let intVal = Int(part) {
            arr.append(intVal)
        }
    }
        var length = 0
        for _ in arr {
            length += 1
        }
            
        var low = arr[0]
        for i in 0...length-1{
            if low > arr[i] {
                low = arr[i]
            }
        }
            
        var high = arr[0]
        for i in 0...length-1{
            if high < arr[i] {
                high = arr[i]
            }
        }
        return "Highest: \(String(high)) \nLowest: \(String(low))"
    }

let str = "3 9 7 5 1 8 2 4"
print(numberConverter(str: str))

 


//TASK 3 Medium
func letterCounter(arr: [[Character]], letter: Character) -> String{
    var counter = 0
    var row = 0
    for i in 0...4{
        for j in 0...5{
            if arr[i][j] == letter{
                row = i
                counter += 1
                switch row {
                    //if counting rows from 1 instread of 0, as in example
                case 1 :
                    print("The letter \(letter) was found in \(row+1)st row ")
                case 2 :
                    print("The letter \(letter) was found in \(row+1)nd row ")
                case 3:
                    print("The letter \(letter) was found in \(row+1)rd row ")
                default:
                    print("The letter \(letter) was found in \(row+1)th row")
               }
            }
        }
    }
    return "The letter \(letter) shows up \(counter) times \n"
}

var letter: Character
var arr: [[Character]] = [
["D", "E", "Y", "H", "A", "D"],
["C", "B", "Z", "Y", "J", "K"],
["D", "B", "C", "A", "M", "N"],
["F", "G", "G", "R", "S", "R"],
["V", "X", "H", "A", "S", "S"]]
print(letterCounter(arr: arr, letter: "H"))
print(letterCounter(arr: arr, letter: "D"))


