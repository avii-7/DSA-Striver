//
//  MaximumOne's.swift
//  
//
//  Created by Arun on 28/04/25.
//

// Article: https://takeuforward.org/arrays/find-the-row-with-maximum-number-of-1s/
// GFG: https://www.geeksforgeeks.org/problems/row-with-max-1s0023/1

// TC: O(m * n)
public func rowWithMax1s(_ mat: [[Int]]) -> Int {
    var maxCount = 0
    var row = -1
    
    for rowIndex in mat.indices {
        
        var count = 0
        for ele in mat[rowIndex] {
            if ele == 1 {
                count += 1
            }
        }
        
        if count > maxCount {
            row = rowIndex
            maxCount = count
        }
    }
    
    return row
}

// TC: - O(m * log(n))
// m = no. of rows
// n = no. of coloumns
public func rowWithMax1s2(_ mat: [[Int]]) -> Int {
    var maxCount = 0 // It should be 0 only.
    var ansRow = -1
    
    for rowIndex in mat.indices {
        
        let row = mat[rowIndex]
        var low = 0, high = row.count - 1
        
        while low <= high {
            
            let mid = (low + high) / 2
            
            if row[mid] == 0 {
                low = mid + 1
            }
            else {
                high = mid - 1
            }
        }
        
        var count = 0
        
        if low < row.count {
            count = row.count - low
        }

        if count > maxCount {
            ansRow = rowIndex
            maxCount = count
        }
    }
    
    return ansRow
}
