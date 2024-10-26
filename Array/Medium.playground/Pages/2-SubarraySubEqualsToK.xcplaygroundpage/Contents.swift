//: [Previous](@previous)

// Problem Link: https://leetcode.com/problems/subarray-sum-equals-k/description/

func subarraySumBrute(_ nums: [Int], _ k: Int) -> Int {
    var count = 0
    
    for i in nums.indices {
        var sum = 0
        for j in i..<nums.count {
            sum += nums[j]
            
            //print(sum, terminator: " ")
            if sum == k {
                count += 1
            }
        }
        //print("")
    }
    
    return count
}

//let arr = [1,1,1]
//let k = 2

//let arr = [1, 2, 3]
//let k = 3

let arr = [1, 2, 3, -5, 3, 1, 0, 0, 4]
let k = 4
print(subarraySumBrute(arr, k))

func subarraySumBest(_ nums: [Int], _ k: Int) -> Int {
    var count = 0, sum = 0
    var myDictionary = [Int: Int]()
    myDictionary[0] = 1
    
    for ele in arr {
        sum += ele
        
        if let value = myDictionary[sum - k] {
            count += value            
        }
        
        if let value = myDictionary[sum] {
            myDictionary[sum] = value + 1
        }
        else {
            myDictionary[sum] = 1
        }
    }
    
    return count
}

//let arr = [1,1,1]
//let k = 2

//let arr = [1, 2, 3]
//let k = 3

//let arr = [1, 2, 3, -5, 3, 1, 0, 0, 4]
//let k = 4
print()
print(subarraySumBest(arr, k))
