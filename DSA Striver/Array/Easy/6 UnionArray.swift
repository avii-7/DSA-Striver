//
//  6 UnionArray.swift
//  
//
//  Created by Arun on 07/03/25.
//

// TC: - O (n + m)
// SC: - O (n + m)
public func union(arr1: [Int], arr2: [Int]) -> [Int] {
    
    var temp = [Int]()
    var first = 0, second = 0
    
    while(first < arr1.count && second < arr2.count) {
        
        if arr1[first] < arr2[second] {
            temp.append(arr1[first])
            first += 1
        }
        else if arr1[first] > arr2[second] {
            temp.append(arr2[second])
            second += 1
        }
        else {
            temp.append(arr1[first])
            first += 1
            second += 1
        }
    }
    
    var lastElement = temp.last
    
    while (first < arr1.count) {
        if lastElement != arr1[first] {
            temp.append(arr1[first])
        }
        lastElement = arr1[first]
        first += 1
    }
    
    while(second < arr2.count) {
        if lastElement != arr2[second] {
            temp.append(arr2[second])
        }
        lastElement = arr2[second]
        second += 1
    }

    return temp
}
