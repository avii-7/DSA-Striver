//: [Previous](@previous)

import Foundation

// Question https://www.geeksforgeeks.org/problems/inversion-of-array-1587115620/1

//   arr[i] > arr[j] and i < j

// TC-> O(n * n)
func inversionCountBrute(arr: [Int]) -> Int {
    var count = 0
    
    for i in arr.indices {
        for j in i+1..<arr.count {
            if arr[i] > arr[j] {
                print("(\(arr[i]), \(arr[j]))", terminator: " ")
                count += 1
            }
        }
    }
    
    return count
}

let arr = [2, 4, 1, 3, 5]
print(inversionCountBrute(arr: arr))
