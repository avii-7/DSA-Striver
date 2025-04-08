//
//  8. LongestSubarrayPositives.swift
//  
//
//  Created by Arun on 06/04/25.
//

// Problem Link: ( GFG ) https://www.geeksforgeeks.org/problems/longest-sub-array-with-sum-k0809/1
// Striver: https://takeuforward.org/data-structure/longest-subarray-with-given-sum-k/

//Brute Force Approch
// TC -> O(n*n)
// SC -> O(1)

// ThoughtProcess
// 1. We will generate all the subarrays.
// 2. And then check if sum is equal to K.

public func longestSubarrayWithSumK(_ arr: [Int], _ k: Int) -> Int {
    
    var maxLength = 0
    
    for i in arr.indices {
        
        if arr[i] > k {
            continue
        }
        
        var sum = 0
        
        for j in i...(arr.count - 1) {
            sum += arr[j]
            
            if sum == k {
                maxLength = max(j - i + 1, maxLength)
            }
            else if sum > k {
                break
            }
        }
    }
    
    return maxLength
}

// Better Approch ( Reverse Engineering )
// TC -> O(n)
// SC -> O(n)

// Thought Process
// 1. Suppose you're at index i in the array and upto index i your sum is x.
// 2. if there is a subarray exits upto that index i and below the index i whose sum is equal to k,
// then there might also be subarray exists whose sum is x-k.
// 4. So from index 0, you will be storing sum and index in hashmap.
// 5. if you find x-k sum any moment, then you will get the subarray sum equal to k.

// Special Case -> [2, 0, 0, 0, 5] K = 5, then longest subarray length = 4, not 1.

// Note:  This will work even when the elements are positive, negatives or both.

public func longestSubarrayWithSumK2(_ arr: [Int], _ k: Int) -> Int {
    
    var maxLength = 0
    
    var dict = [Int: Int]()
    var sum = 0
    
    for i in arr.indices {
        sum += arr[i]
        
        if sum == k {
            maxLength = i + 1
        }
        else if let index = dict[sum - k] {
            maxLength = max(i - index, maxLength)
        }
        
        if dict[sum] == nil {
            dict[sum] = i
        }
    }
    
    return maxLength
}

/* ThoughtProcess:
 
  // Add...
  // if exceeds subtract from left
 // if equal calculate the max lenght
 // keep on going.
 
 
 Only works for positives:
 TC: O(2n) (example: [1, 2, 3, 4, 5, 16] k = 15
 */
public func longestSubarrayWithSumK3(_ arr: [Int], _ k: Int) -> Int {
    
    var maxLength = 0
    
    var sum = 0
    
    var p1 = 0, p2 = 0
    
    while p1 < arr.count {
        
        sum += arr[p1]
        
        while sum > k {
            sum -= arr[p2]
            p2 += 1
        }
        
        if sum == k {
            maxLength = max(maxLength, p1 - p2 + 1)
        }
        
        p1 += 1
    }
    
    return maxLength
}
