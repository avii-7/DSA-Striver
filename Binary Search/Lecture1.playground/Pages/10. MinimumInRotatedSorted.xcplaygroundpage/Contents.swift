//: [Previous](@previous)


// Notes 🗒️: In a rotated sorted array the element which will be minimum at an index k and element at index k + 1  and k -1 will always be greater.
// My personal solution based on observation.

// TC -> O(logN)
func findMin(_ arr: [Int]) -> Int {
    
    if arr.count == 1 {
        return arr[0]
    }
    
    let n = arr.count
    var low = 0, high = arr.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        
        if
            (mid == 0 && arr[0] < arr[1] && arr[0] < arr[n - 1]) ||
                (mid == n - 1 && arr[n-1] < arr[n-2] && arr[n-1] < arr[0] ||
                 (arr[mid] < arr[mid + 1] && arr[mid] < arr[mid - 1]))
        {
            return arr[mid]
        }
        // Is right part sorted ? if yes, go to left
        else if arr[mid] < arr[high] {
            high = mid - 1
        }
        // Is left part sorted ? if yes, go to right
        else  {
            low = mid + 1
        }
    }
    
    return -1
}

let testCases = [
    [3, 4, 5, 1, 2], // 5
    [4, 5, 6, 7, 0, 1, 2], // 7
    [2, 4, 5, 6, 7, 0, 1], // 7
    [6, 7, 0, 1, 2, 3, 5], // 7
    
    [5, 0, 1, 2, 3, 4], // 5
    
    [0, 1, 2, 3, 4, 5], // 5
    [4, 5, 0, 1, 2, 3], // 5
]
for testCase in testCases {
    print(testCase, findMin(testCase), separator: " --> ")
}
