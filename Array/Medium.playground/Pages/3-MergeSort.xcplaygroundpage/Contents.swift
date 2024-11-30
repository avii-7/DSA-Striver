//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

func mergeSort(arr: inout [Int]) {
    divide(arr: &arr, low: 0, high: arr.count - 1)
}

func divide(arr: inout [Int], low: Int, high: Int) {
    if low == high { return }
    
    let mid = (low + high) / 2
    divide(arr: &arr, low: low, high: mid)
    divide(arr: &arr, low: mid + 1, high: high)
    merge(arr: &arr, low: low, mid: mid, high: high)
}

func merge(arr: inout [Int], low: Int, mid: Int, high: Int) {
    var left = low
    var right = mid + 1
    
    var temp = [Int]()
    
    while (left <= mid && right <= high) {
        if arr[left] <= arr[right] {
            temp.append(arr[left])
            left += 1
        }
        else {
            temp.append(arr[right])
            right += 1
        }
    }
    
    while(left <= mid) {
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

var arr = [1, 2, 4, 11, 5]
mergeSort(arr: &arr)
print(arr)
