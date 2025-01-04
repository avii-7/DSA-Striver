// Video Link: https://www.youtube.com/watch?v=MHf6awe89xw

// Pending:
// 2. Overflow case.

// Iterative code

// TC -> O(log₂(n))
func search(_ nums: [Int], _ target: Int) -> Int {
    var low = 0, high = nums.count - 1
    
    while (low <= high) {
        
        let mid = (low + high) / 2
        
        if nums[mid] == target {
           return mid
        }
        else if target < nums[mid] {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    
    return -1
}

let arr = [5, 6, 7, 8, 11, 24, 53]
print(recursiveBinarySearch(arr, 11))

// Recursive Approach

func recursiveBinarySearch(_ nums: [Int], _ target: Int) -> Int {
    return recursive(low: 0, high: nums.count - 1, arr: nums)
    
    func recursive(low: Int, high: Int, arr: [Int]) -> Int {
        
        if low > high {
            return -1
        }
        
        let mid = (low + high) / 2
        
        if arr[mid] == target {
           return mid
        }
        else if target < arr[mid] {
            return recursive(low: low, high: mid - 1, arr: arr)
        }
        else {
            return recursive(low: mid + 1, high: high, arr: arr)
        }
    }
}


