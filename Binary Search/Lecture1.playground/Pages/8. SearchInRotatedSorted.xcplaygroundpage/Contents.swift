// Article: https://takeuforward.org/data-structure/search-element-in-a-rotated-sorted-array/
// LC: https://leetcode.com/problems/search-in-rotated-sorted-array

// O(LogN)
func search(_ nums: [Int], _ target: Int) -> Int {
    var low = 0, high = nums.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        
        print(low, high, separator: " ")
        
        if target == nums[mid] {
            return mid
        }
        // Check is left part sorted or not ?
        else if nums[low] <= nums[mid] {
            
            // Check target is in b/w left sorted array
            if nums[low] <= target && target <= nums[mid] {
                high = mid - 1
            }
            else {
                low = mid + 1
            }
        }
        else { // right part is sorted or not
            
            if nums[mid] <= target && target <= nums[high] {
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
