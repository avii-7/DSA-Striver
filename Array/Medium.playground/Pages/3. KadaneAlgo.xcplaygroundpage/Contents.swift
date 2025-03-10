// Kadane's Algorithm : Maximum Subarray Sum in an Array ( LC: 53. Maximum Subarray )

// Problem Link: https://leetcode.com/problems/maximum-subarray/description/
// Article Link: https://takeuforward.org/data-structure/kadanes-algorithm-maximum-subarray-sum-in-an-array/

// Brute Force Approch
// TC -> O(n * n)
// SC -> O(1)

// Thought Process
// 1. I will generate all the subarray's sum.
// 2. Keep a variable max sum to store the maximum subarray sum.

func maxSubArray(_ nums: [Int]) -> Int {
        
    let n = nums.count

    var mSum = Int.min

    for i in nums.indices {
        var tSum = 0

        for j in i..<n {
            tSum += nums[j]

            if tSum > mSum {
                mSum = tSum
            }
        }
    }

    return mSum
}

// Optimal Approch
// TC-> O(n)
// SC -> O(1)

// Thought Process
// There can be maximum 3 kinds of array, which can contains:
// 1. Positive elements: In these case whole array is subarray with maximum sum.
// 2. Mix of positive and negative elements: Resulted subarray always start with +ve element and always end with +ve elements.
// It will contains only those negative elements whose addition still give us positive sum.
// 3. Only negative elements: Resulted array only contains only one negative element which is greater than others.

func maxSubArray2(_ nums: [Int]) -> Int {
        
    let n = nums.count

    var mSum = Int.min, tSum = 0

    for ele in nums {
        tSum += ele
        if tSum > mSum {
            mSum = tSum
        }

        // Helps when your array contains only negative elements and when both ( case: when you encountered an element which
        // makes your sum negative, then there is no point to consider that element instead you should reset your sum, then start
        // creating new subarray ).
        if tSum < 0 {
            tSum = 0
        }
    }

    return mSum
}

// Updated version that prints the subarray indexes too

func maxSubArray3(_ nums: [Int]) -> Int {
        
    let n = nums.count

    var mSum = Int.min, tSum = 0
    var start = 0, end = 0, tStart = 0

    for i in nums.indices {
        
        // new beginning of subarray.
        if tSum == 0 {
            tStart = i
        }

        tSum += nums[i]

        if tSum > mSum {
            mSum = tSum
            start = tStart
            end = i
        }

        if tSum < 0 {
            tSum = 0
        }
    }

    print("Start: \(start) End: \(end)")

    return mSum
}
