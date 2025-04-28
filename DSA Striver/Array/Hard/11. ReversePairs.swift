

// Problem Link: https://leetcode.com/problems/reverse-pairs/submissions/1477176920
// Article Link: https://takeuforward.org/data-structure/count-reverse-pairs/

/* Condition
 1. i < j < nums.length
 2. nums[i] > 2 * nums[j]
 */


// TC -> O(n * n)
// SC -> O(1)

func reversePairsBrute(_ nums: [Int]) -> Int {
    
    var count = 0
    
    for i in nums.indices {
        
        for j in (i + 1)..<nums.count {
            
            if nums[i] > 2 * nums[j] {
                count += 1
            }
            
        }
    }
    
    return count
}

//let arr = [1, 3, 2, 3, 1]
//let arr = [2,4,3,5,1]
//print(reversePairsBrute(arr))


// Solution - 1

func reversePairsOptimal(_ nums: inout [Int]) -> Int {
    mergeReversePairs(arr: &nums, low: 0, high: nums.count - 1)
}

func mergeReversePairs(arr: inout [Int], low: Int, high: Int) -> Int {
    var count = 0
    
    if low == high {
        return count
    }
    
    let mid = (low + high) / 2
    
    count += mergeReversePairs(arr: &arr, low: low, high: mid)
    count += mergeReversePairs(arr: &arr, low: mid + 1, high: high)
    count += combineReversePairs(arr: &arr, low: low, mid: mid, high: high)
    return count
}

func combineReversePairs(arr: inout [Int], low: Int, mid: Int, high: Int) -> Int {
    var left = low
    var right = mid + 1
    
    var temp = [Int]()
    
    var count = 0
    
    while(left <= mid && right <= high) {
        
        if arr[left] < arr[right] {
            temp.append(arr[left])
            left += 1
        }
        else {
            
            var tempLeft = left
            while(tempLeft <= mid) {
                
                if arr[tempLeft] > 2 * arr[right] {
                    count += (mid - tempLeft + 1)
                    break
                }
                
                tempLeft += 1
            }
            
            temp.append(arr[right])
            right += 1
        }
    }
    
    while (left <= mid) {
        temp.append(arr[left])
        left += 1
    }
    
    while(right <= high) {
        temp.append(arr[right])
        right += 1
    }
    
    for i in stride(from: low, to: high + 1, by: 1) {
        arr[i] = temp[i - low]
    }
    return count
}

//var arr = [1, 3, 2, 3, 1]
//var arr = [2, 4, 3, 5, 1]
//var arr = [-5, -5]
//print(reversePairsOptimal(&arr))
//print(arr)

// Solution - 2

// TC -> O(nLogn + nLogn)
// SC -> O(n)

func reversePairsOptimal2(_ nums: inout [Int]) -> Int {
    merge2(arr: &nums, low: 0, high: nums.count - 1)
}

func merge2(arr: inout [Int], low: Int, high: Int) -> Int {
    var count = 0
    
    if low == high {
        return count
    }
    
    let mid = (low + high) / 2
    
    count += merge2(arr: &arr, low: low, high: mid)
    count += merge2(arr: &arr, low: mid + 1, high: high)
    count += countPairs2(arr: &arr, low: low, mid: mid, high: high)
    combine2(arr: &arr, low: low, mid: mid, high: high)
    return count
}

// Doing calculation similar to Merge short that's why another nLogn in TC.
func countPairs2(arr: inout [Int], low: Int, mid: Int, high: Int) -> Int {
    var count = 0
    
    var left = low
    
    var right = mid + 1
    var prevCount = 0
    
    while (left <= mid) {

        var additionalCount = 0
        
        while(right <= high) {
            if arr[left] > 2 * arr[right] {
                additionalCount += 1
                right += 1
            }
            else {
                break
            }
        }
        count += (prevCount + additionalCount)
        prevCount = (prevCount + additionalCount)
        left += 1
    }
    
    return count
}

func combine2(arr: inout [Int], low: Int, mid: Int, high: Int) {
    var left = low
    var right = mid + 1
    
    var temp = [Int]()
    
    while(left <= mid && right <= high) {
        
        if arr[left] <= arr[right] {
            temp.append(arr[left])
            left += 1
        }
        else {
            temp.append(arr[right])
            right += 1
        }
    }
    
    while (left <= mid) {
        temp.append(arr[left])
        left += 1
    }
    
    while(right <= high) {
        temp.append(arr[right])
        right += 1
    }
    
    for i in stride(from: low, to: high + 1, by: 1) {
        arr[i] = temp[i - low]
    }
}

//var arr = [1, 3, 2, 3, 1]
//var arr = [2, 4, 3, 5, 1]
//var arr = [-5, -5]
//var arr = [5, 4, 3, 2, 1]
//print(reversePairsOptimal2(&arr))
//print(arr)
