
// BFA
func findPeakElement1(_ arr: [Int]) -> Int {
    
    if arr.count == 1 {
        return 0
    }
    
    if arr.count == 2 {
        return arr[0] > arr[1] ? 0 : 1
    }
    
    if arr[0] > arr[1] {
        return 0
    }
    
    if arr.last! > arr[arr.count - 2] {
        return arr.count - 1
    }
    
    for i in 1...(arr.count - 2) {
        if arr[i] > arr[i - 1] && arr[i] > arr[i + 1] {
            return i
        }
    }
    
    return -1
}


/*
 [1, 2, 3, 4, 5, 6, 7, 8, 6, 1]
 
       Peak
        /\
       /  \
      /
     / <- Mid ( Just go to direction of PEAK )
    /
   /
  /
 /
 
 */

// TC -> O(logN)

// Observation: If you are at mid, go to that direction where adjacent element is greater. It will take you to the peak element.
// It might happen, there will be multiple peaks.

func findPeakElement2(_ arr: [Int]) -> Int {
    
    if arr.count == 1 {
        return 0
    }
    
    if arr[0] > arr[1] {
        return 0
    }
    
    if arr.last! > arr[arr.count - 2] {
        return arr.count - 1
    }
    
    var low = 1, high = arr.count - 2
    
    while low <= high {
        let mid = (low + high) / 2
        if arr[mid] > arr[mid - 1] && arr[mid] > arr[mid + 1] {
            return mid
        }
        // if left side is greater, peak element will be there.
        else if arr[mid - 1] > arr[mid] {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    
    return -1
}

let testCases = [
    [1],
    [1, 2, 3, 1],
    [3, 2, 1],
    [1 ,2, 1, 3, 5, 6, 4],
    [1, 2, 3, 4, 5, 6, 7, 8, 6, 1],
    [5, 4, 3, 2, 1],
    [0, 1, 5, 4, 3, 2, 1, 0]
]

for testCase in testCases {
    print(testCase, findPeakElement2(testCase), separator: " --> ")
}
