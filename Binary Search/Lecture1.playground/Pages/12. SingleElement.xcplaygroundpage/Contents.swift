//: [Previous](@previous)


// LC:- https://leetcode.com/problems/single-element-in-a-sorted-array/
// Article: https://takeuforward.org/data-structure/search-single-element-in-a-sorted-array/

import Foundation

// TC -> O(n/2)
func singleNonDuplicate1(_ arr: [Int]) -> Int {
    
    if arr.count == 1 {
        return arr.first!
    }
    
    // In between
    for i in stride(from: 0, to: arr.count - 2, by: 2) {
        if arr[i] != arr[i + 1] {
            return arr[i]
        }
    }
    
    return arr.last!
}

// Mine

// Observation:
// If I'm standing at the mid I will count the number of elements on the right if they are even then I will check mid and preceeding element if both are equal, I will go to left else go right.

func singleNonDuplicate2(_ arr: [Int]) -> Int {
    
    var low = 0, high = arr.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        
        if mid == 0 || mid == arr.count - 1 || arr[mid] != arr[mid - 1] && arr[mid] != arr[mid + 1] {
            return arr[mid]
        }
        // Even
        else if (high - mid) % 2 == 0 {
            if arr[mid] == arr[mid - 1] {
                high = mid - 2
            }
            else {
                low = mid + 1
            }
        }
        else { // Odd
            if arr[mid] == arr[mid + 1] {
                high = mid - 1
            }
            else {
                low = mid + 1
            }
        }
    }
    
    return -1
}

// STRIVER
// Observation: If you are on the left side of single element the indexes of the pair will be (even, odd)
// if you are on the right side of single element the indexes of the pair will be (odd, even)
// so suppose you are on the left side, then you need to eleminate the other side and vise versa.

// The element at index k will be called as single only when its left and right side of that element is not equal.

// TC -> O(LogN)
func singleNonDuplicate3(_ arr: [Int]) -> Int {
    
    var low = 0, high = arr.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        
        if mid == 0 || mid == arr.count - 1 || arr[mid] != arr[mid - 1] && arr[mid] != arr[mid + 1] {
            return arr[mid]
        }
        // Are we on left side ?
        else if (mid % 2 == 0 && arr[mid] == arr[mid + 1]) || (mid % 2 != 0 && arr[mid] == arr[mid - 1]) {
            low = mid + 1
        }
        else { // Right side
            high = mid - 1
        }
    }
    
    return -1
}

let testCases = [
    [1],
    [1,1,2,3,3,4,4,8,8],
    [3,3,7,7,10,11,11],
    [1, 1, 2, 2, 3, 3, 5],
    [0, 1, 1, 2, 2, 3, 3, 4, 4]
]

for testCase in testCases {
    print(testCase, singleNonDuplicate3(testCase), separator: " --> ")
}
