// Article: https://takeuforward.org/data-structure/search-element-in-a-rotated-sorted-array/
// LC: https://leetcode.com/problems/search-in-rotated-sorted-array


// It will fail when array contains duplicate elements and our condition for checking which part is sorted will fail. For Example: - [1, 0, 1, 1, 1]

// O(LogN)
func search(_ arr: [Int], _ target: Int) -> Int {
    var low = 0, high = arr.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        
        if arr[mid] == target {
            return mid
        }
        // Check is left part sorted or not ?
        else if arr[low] <= arr[mid] {
            
            if arr[low] <= target && target < arr[mid] {
                high = mid - 1
            }
            else {
                low = mid + 1
            }
        }
        else { // is right part sorted or not ?
            
            if arr[mid] < target && target <= arr[high] {
                low = mid + 1
            }
            else {
                high = mid - 1
            }
        }
    }
    
    return -1
}

//let nums = [4, 5, 6, 7, 0, 1, 2]
//let target = 0

let nums = [4,5,6,7,0,1,2]
let target = 3

print(search(nums, target))
