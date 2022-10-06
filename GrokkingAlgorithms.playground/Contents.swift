import Foundation
import DequeModule
import Collections

//Grokking Algorithms by Aditya Y. Bhargava
//Swift algorithms version by Yarmalovich Anatol

/// Chapter 1
//Binary sort algorithm

//Attention - only sorted list to function input!!!
var binarySearchMockList = [1,2,3,4,5,6,7,8,9,10,11]

func binarySearch(item: Int, sortedList: [Int]) -> Int? {
    var low: Int = 0
    var high: Int = sortedList.count - 1

    while low <= high {
        let mid: Int = (low + high) / 2
        let result = sortedList[mid]

        if result == item {
            return mid
        }

        if result > item {
            high = mid - 1
        }

        if result < item {
            low = mid + 1
        }
    }
    return nil
}

let resultOfBinarySearch = binarySearch(item: 10, sortedList: binarySearchMockList)

let resultToConsole = resultOfBinarySearch != nil
? "Item index: \(resultOfBinarySearch!)"
: "Item not found"

print(resultToConsole)

/// Chapter 2
//Selection sort algorithm
var unsortedMockArray: [Int] = [4, 2, 5, 7, 1, 34, 21, 9]

//Part one - search smallest value index
func findSmallest(array: [Int]) -> Int {
    var smallestValue = array[0]
    var smallestIndex = 0

    for i in 1..<array.count {
        if array[i] < smallestValue {
            smallestValue = array[i]
            smallestIndex = i
        }
    }
    return smallestIndex
}

//Part two - selection sort algorithm
func selectionSort(array: inout [Int]) -> [Int] {
    var sortedArray = [Int]()

    for _ in array {
        let smallest = findSmallest(array: array)
        sortedArray.append(array.remove(at: smallest))
    }
    return sortedArray
}

let selectionSortResult = selectionSort(array: &unsortedMockArray)
print("Selection sort result: \(selectionSortResult)")

/// Chapter 4
//Recursion
var firstRecursiveMockArray: [Int] = [4, 2, 5, 7, 1, 34, 21, 9]

let testByCycle = firstRecursiveMockArray.reduce(.zero, +)

//4.1
func recursiveSum(arr: inout [Int]) -> Int {
    if arr.isEmpty {
        print("Stopping Condition")
        return 0
    }
    print("Recursion Condition")
    let value = arr[0]
    arr.removeFirst()
    print("Array: \(arr)")
    return value + recursiveSum(arr: &arr)
}

let sum = recursiveSum(arr: &firstRecursiveMockArray)
print("Is method correct: \(sum == testByCycle)")

//4.2
var secondRecursiveMockArray: [Int] = [4, 2, 5, 7, 1, 34, 21, 9]

func calculateElementCount(arr: [Int]) -> Int {
    if arr.isEmpty {
        print("Stopping Condition")
        return 0
    }
    print("Recursion Condition")
    var tempArray = arr
    tempArray.removeFirst()
    return ( 1 + calculateElementCount(arr: tempArray))
}

let countOfElement = calculateElementCount(arr: secondRecursiveMockArray)
print("Is method correct: \(countOfElement == secondRecursiveMockArray.count)")

//4.3
func findBiggestValueIn(arr: [Int]) -> Int? {
    if arr.isEmpty {
        print("Stopping Condition")
        return nil
    }
    print("Recursion Condition")

    var tempArray = arr
    tempArray.removeFirst()

    let value = findBiggestValueIn(arr: tempArray)

    if value == nil {
        return arr[0]
    }

    if arr[0] < value! {
        return value!
    } else {
        return arr[0]
    }
}
let biggestValue = findBiggestValueIn(arr: secondRecursiveMockArray)
let biggestValueToConsole = biggestValue == nil
? "Biggest value not found"
: "Biggest value: \(biggestValue!)"
print(biggestValueToConsole)

//Quick sort
func quickSort(arr: [Int]) -> [Int] {
    if arr.count < 2 {
        print("Stopping Condition")
        return arr
    }

    print("Recursion Condition")
    let pivot: Int = arr[0]

    var less = [Int]()
    var greater = [Int]()

    for i in 1..<arr.count {
        if arr[i] <= pivot {
            less.append(arr[i])
        } else {
            greater.append(arr[i])
        }
    }
    return quickSort(arr: less) + [pivot] + quickSort(arr: greater)
}

let quickSortResult = quickSort(arr: secondRecursiveMockArray)
print("Quick sort result: \(quickSortResult)")

//Insertion sort
func insertionSort(arr: [Int]) -> [Int] {
    var tempArray = arr
    for i in 0..<tempArray.count {
        var j = i
        while j > 0 && tempArray[j] < tempArray[j - 1] {
            tempArray.swapAt(j, j - 1)
            j = j - 1
        }
    }
    return tempArray
}

let insertionSortResult = insertionSort(arr: secondRecursiveMockArray)
print("Insertion sort result: \(insertionSortResult)")

//BFS
var graph = Dictionary<AnyHashable, [String]>()
graph["antoly"] = ["alice", "bob", "claire"]
graph["bob"] = ["anuj", "peggy"]
graph["alice"] = ["peggy"]
graph["claire"] = ["thom", "jonny"]
graph["anuj"] = []
graph["peggy"] = []
graph["thom"] = []
graph["jonny"] = []

func searchSellerIn() -> Bool {
    var searchQueue = Deque<String>()

    searchQueue.append(contentsOf: graph["antoly"]!)

    var searched: [String] = []

    while !searchQueue.isEmpty {
        if let person = searchQueue.popFirst() {
            if !searched.contains(where: { $0 == person }) {
                if personIsSeller(person) {
                    print("Searched: \(searched)")
                    print("Seller name: \(person)")
                    return true
                } else {
                    searchQueue.append(contentsOf: graph[person]!)
                    searched.append(person)
                }
            }
        }
    }

    print("Searched: \(searched)")

    return false
}

func personIsSeller(_ name: String) -> Bool {
    //thom is seller
    return name == "thom"
}

let isThereAMangoSellerHere: Bool = searchSellerIn()
print(isThereAMangoSellerHere)
