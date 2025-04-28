//
//  2 SelectionSort.swift
//  
//
//  Created by Arun on 04/03/25.
//

// MARK: - Select the minimum from whole range and push it at the range starting and Increment the range from starting and repeat.
// TC: - O(n * n)
public func selectionSort(arr: inout [Int]) {
    
    for i in arr.indices {
        
        var smallIndex = i
        
        for j in i+1..<arr.count {
            if arr[smallIndex] > arr[j] {
                smallIndex = j
            }
        }
        (arr[i], arr[smallIndex]) = (arr[smallIndex], arr[i])
    }
}
