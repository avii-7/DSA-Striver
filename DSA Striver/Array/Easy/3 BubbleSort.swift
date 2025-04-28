//
//  3 BubbleSort.swift
//  
//
//  Created by Arun on 04/03/25.
//

import Foundation

// MARK: - Find the maximum between adjacents and swap it and decrement the range from last.
// TC: - O(n * n)
public func bubbleSort(arr: inout [Int]) {
    
    for i in arr.indices {
        for j in 0..<(arr.count - i - 1) {
            if arr[j] > arr[j+1] {
                (arr[j], arr[j + 1]) = (arr[j+1], arr[j])
            }
        }
    }
}
