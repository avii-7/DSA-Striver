//: [Previous](@previous)

import Foundation

// Problem Link: https://leetcode.com/problems/3sum/
// Article Link: https://takeuforward.org/data-structure/3-sum-find-triplets-that-add-up-to-a-zero/


// MARK: - BFA

// TC -> O(n * n * n * k)
// k = number of triplets

func threeSumBrute(_ nums: [Int]) -> [[Int]] {
    
    var result = Array<[Int]>()
    
    for i in nums.indices {
        for j in i+1..<nums.count {
            for k in j+1..<nums.count {
                if
                    nums[i] + nums[j] + nums[k] == 0,
                    result.contains(where: { ele in Set(ele) == Set([nums[i], nums[j], nums[k]]) }) == false {
                    result.append([nums[i], nums[j], nums[k]])
                }
            }
        }
    }
    
    return result
}

// TC -> O(n*n*n)
// SC -> 2 * O(k)

// One time for set ds, second time for converting back into array.
// k -> number of triplets

// With Set DS optimization
func threeSumBrute2(_ nums: [Int]) -> [[Int]] {
    
    var result = Set<[Int]>()
    
    for i in nums.indices {
        for j in i+1..<nums.count {
            for k in j+1..<nums.count {
                if nums[i] + nums[j] + nums[k] == 0 {
                    let sortedTriplet = [nums[i], nums[j], nums[k]].sorted()
                    result.insert(sortedTriplet)
                }
            }
        }
    }
    
    return Array(result)
}

//print(threeSumBrute([-1,0,1,2,-1,-4]))

// TC -> O(n * n * k)
// SC -> O(n)

func threeSumBest(_ nums: [Int]) -> [[Int]] {
    
    var result = Array<[Int]>()
    
    var dict = [Int: Int]()
    
    for i in nums.indices {
        
        var target = -nums[i]
        dict.removeAll()
        
        for j in i+1..<nums.count {
            if let value = dict[target - nums[j]] {
                let triplet = [-target, nums[j], nums[value]]
                //if result.contains(where: { Set($0) == Set(triplet) }) == false {
                    result.append(triplet)
                //}
            }
            else {
                dict[nums[j]] = j
            }
        }
    }
    
    return result
}

// TC -> O(n * n)
// SC -> O(n) + O(no of unique triplets) * 2

func threeSumBest2(_ nums: [Int]) -> [[Int]] {
    
    var result = Set<[Int]>()
    var dict = [Int: Int]()
    for i in nums.indices {
        var target = -nums[i]
        dict.removeAll()
        
        for j in i+1..<nums.count {
            if let value = dict[target - nums[j]] {
                let sortedTriplet = [-target, nums[j], nums[value]].sorted()
                result.insert(sortedTriplet)
            }
            else {
                dict[nums[j]] = j
            }
        }
    }
    
    return Array(result)
}

/**
 [-1, 1, 0]
 [-1, -1, 2]
 [0, -1, 1]
 [[-1, 0, 1], [-1, -1, 2]]
 */

// TC -> O(nlogn) + O(n * n)
// SC -> O(n) + O(n) Sorting and storing
func threeSumOptimal(_ nums: [Int]) -> [[Int]] {
    
    let sortedNums = nums.sorted()
    var result = [[Int]]()
    
    for i in sortedNums.indices {
        
        if i > 0 && sortedNums[i] == sortedNums[i - 1] {
            continue
        }
        
        var j = i + 1
        var k = sortedNums.count - 1
        
        while(j < k) {
            let sum = sortedNums[i] + sortedNums[j] + sortedNums[k]
            
            if sum == 0 {
                result.append([sortedNums[i], sortedNums[j], sortedNums[k]])
                j += 1
                k -= 1
                
                while (j < k && sortedNums[j] == sortedNums[j - 1]) { j += 1 }
                while ( j < k && sortedNums[k] == sortedNums[k + 1]) { k -= 1 }
            } else if sum < 0 {
                j += 1
            } else {
                k -= 1
            }
        }
    }
    return result
}

//print(threeSumOptimal([-2, -2, -2, -1, -1, -1, 0, 0, 0, 2, 2, 2]))
print(threeSumOptimal([-1,0,1,2,-1,-4]))
