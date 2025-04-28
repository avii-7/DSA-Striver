//
//  7. KMissingPositiveNumber.swift
//  
//
//  Created by Arun on 30/03/25.
//

// TC -> O(arr.last! + k) * O(n)

// Check is number present is present b/w range 1...max or not ?
// If yes, increasing counter and when counter == k return that number.
public func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
    let max = arr.last! + k
    
    var count = 0
    
    for i in 1...max {
        if isPresent(number: i, arr) == false {
            count += 1
        }
        
        if count == k {
            return i
        }
    }
    
    return -1
    
    func isPresent(number: Int, _ arr: [Int]) -> Bool {
        
        for ele in arr {
            if number == ele {
                return true
            }
        }
        
        return false
    }
}

// TC -> O(n)
// At every index we are checking how many elements are missing while standing at that index .
// If count >= k then find the kth missing number.
public func findKthPositive1(_ arr: [Int], _ k: Int) -> Int {
    
    for i in arr.indices {
        let correctIndex = arr[i] - 1
        
        let missingElements = correctIndex - i
        if missingElements >= k {
            return arr[i] - (missingElements - k) - 1
        }
    }
    
    let correctIndex = arr.last! - 1
    return arr.last! + k - (correctIndex - (arr.count - 1))
}

// Intuition ->
/* Let's take an example. Suppose you have an array = [6, 7] and k = 4. The answer will be 4 because no array element falls
   within the range 1 to 4.

   If we take an array = [2, 3], these two elements are smaller than k. Therefore, we need to increase k by 1 twice.
*/

// TC -> O(n)
public func findKthPositive2(_ arr: [Int], _ k: Int) -> Int {
    
    var missingNumber = k
    
    for ele in arr {
        
        if ele <= missingNumber {
            missingNumber += 1
        }
        else { break }
    }
    
    return missingNumber
}

// TC -> O(LogN)
public func findKthPositiveOptimal(_ arr: [Int], _ k: Int) -> Int {
    var low = 0, high = arr.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        let missingNumbers = arr[mid] - 1 - mid
        
        if missingNumbers < k {
            low = mid + 1
        }
        else {
            high = mid - 1
        }
    }
    
    // If you carefully observe, high will be point at index t such that t's missing elements < k then you just need to add `more` to it.
    // arr[high] + more
    // arr[high] + (k - missing's elements at high index)
    // arr[high] + k - (arr[high] - 1 - high)
    // k + 1 + high
    return high + 1 + k
}
