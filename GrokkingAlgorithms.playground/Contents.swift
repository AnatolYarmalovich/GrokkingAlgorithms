import UIKit

//Grokking Algorithms by Aditya Y. Bhargava
//Swift solutions by Yarmalovich Anatol

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

