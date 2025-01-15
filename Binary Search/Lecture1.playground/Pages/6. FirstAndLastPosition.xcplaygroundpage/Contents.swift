
// TC: - O(n)
// SC: - O(1)
func searchRangeBrute(_ nums: [Int], _ target: Int) -> [Int] {
    
    var first = -1, last = -1
    
    for i in nums.indices {
        
        if nums[i] == target {
            if first == -1 {
                first = i
                last = i
            }
            else {
                last = i
            }
        }
    }
    
    return [first, last]
}

// Best Case: Ω(logN)
// Worst Case: O(n)
func searchRangeBest(_ arr: [Int], _ target: Int) -> [Int] {
    var low = 0, high = arr.count - 1
    
    var first = -1, last = -1, firstFound = -1
    
    while(low <= high) {
        var mid = (low + high)/2
        
        if arr[mid] == target {
            firstFound = mid
            break
        }
        else if target < arr[mid] {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    
    if firstFound != -1 {
        first = firstFound
        last = firstFound
        
        var temp = firstFound
        // move left
        temp -= 1
        while(temp >= 0) {
            if arr[temp] == target {
                first = temp
            }
            else { break }
            temp -= 1
        }
        
        // move right
        temp = firstFound + 1
        while(temp < arr.count) {
            if arr[temp] == target {
                last = temp
            }
            else { break }
            temp += 1
        }
    }
    
    return [first, last]
}

// O(2LogN)
func searchRangeOptimal(_ arr: [Int], _ target: Int) -> [Int] {
    
    // Smallest Index which is equal to target
    var low = 0, high = arr.count - 1
    var first = -1
    
    while(low <= high) {
        var mid = (low + high)/2
        
        if target == arr[mid] {
            first = mid
            high = mid - 1
        }
        else if target < arr[mid] {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    
    // Largest Index which is equal to target
    var last = -1
    if first != -1 {
        
        low = 0; high = arr.count - 1
        
        while(low <= high) {
            var mid = (low + high)/2
            
            if target == arr[mid] {
                last = mid
                low = mid + 1
            }
            else if target > arr[mid] {
                last = mid
                low = mid + 1
            }
            else {
                high = mid - 1
            }
        }
    }
    
    return [first, last]
}

let nums = [5,7,7,8,8,10]
let target = 8
print(searchRangeOptimal(nums, target))
