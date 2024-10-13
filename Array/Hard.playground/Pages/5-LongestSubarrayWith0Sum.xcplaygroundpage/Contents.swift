//: [Previous](@previous)

import Foundation

// Question: https://takeuforward.org/data-structure/length-of-the-longest-subarray-with-zero-sum/

// Very Dirty Try
func maxLen(arr: inout [Int]) -> Int {
    let n = arr.count
    var negSum = 0
    var negCount = 0
    
    var zerosCount = 0
    
    for ele in arr {
        if ele == 0 {
            zerosCount += 1
        }
        else if ele < 0 {
            negCount += 1
            negSum += ele
        }
    }

    negSum = -negSum
    arr.sort()
    
    var left = 0, right = 0
    var sum = 0, posCount = 0
    
    while(left <= right && right < n) {
        
        if arr[right] <= 0 {
            right += 1
            left += 1
            continue
        }
        else if arr[right] > negSum {
            return zerosCount
        }
        
        sum += arr[right]
        posCount += 1
        right += 1
        
        while (left < right && sum > negSum) {
            sum -= arr[left]
            left += 1
            posCount -= 1
        }
        
        if sum == negSum {
            return negCount + zerosCount + posCount
        }
    }
    
    return zerosCount
}

// -5, -5, -5, 5 , 5
//var arr = [15, -2, 2, -8, 1, 7, 10, 23]
//var arr = [-5, 5, -5, 5, -5]
//var arr = [1, 0, -4, 3, 1, 0]
//print(maxLen(arr: &arr))


// TC -> O(n * n)
func maxLenBrute(arr: [Int]) -> Int {
    let n = arr.count
    var length = 0
    
    for i in arr.indices {
        
        var tempLen = 0
        var sum = 0
        
        for j in i..<n {
            sum += arr[j]
            tempLen += 1
            
            if sum == 0 && tempLen > length  {
                length = tempLen
            }
        }
    }
    
    return length
}

// TC -> O(n) * O(Log(n))
// SC -> O(n)
func maxLenBest(arr: [Int]) -> Int {
    let n = arr.count
    var length = 0, sum = 0
    
    var dict = [Int: Int]()
    
    for i in arr.indices {
        sum += arr[i]
        
        if sum == 0 {
            length = i + 1
        } else if let index = dict[sum] {
            if i - index > length {
                length = i - index
            }
        }
        else {
            dict[arr[i]] = i
        }
    }
    
    return length
}

//var arr = -5, -5, -5, 5 , 5
//var arr = [15, -2, 2, -8, 1, 7, 10, 23]
//var arr = [-5, 5, -5, 5, -5]
var arr = [1, 0, -4, 3, 1, 0]
print(maxLenBest(arr: arr))
