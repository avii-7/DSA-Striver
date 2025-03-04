//
//  4 InsertionSort.swift
//  
//
//  Created by Arun on 04/03/25.
//

// MARK: - ( Include an element and place it at the correct position )

// TC: Best -> O(n)
// Worst = (n * n)

public func insertionSort(arr: inout [Int]) {
    for i in arr.indices {
        for j in stride(from: i - 1, to: -1, by: -1) {
            if arr[j] > arr[i]  {
                (arr[j], arr[i]) = (arr[i], arr[j])
                continue
            }
            break
        }
    }
}
