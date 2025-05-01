//
//  3. SearchIn2DMatrix2.swift
//  DSA Striver
//
//  Created by Arun on 30/04/25.
//

// LC: https://leetcode.com/problems/search-a-2d-matrix-ii

// Brute  from Search In 2D Matrix 1 will work for this question, too.

// Better approach (with little modification) similar to Search In 2D Matrix 1.

// TC: - O(m * log(n))
func searchMatrix2DII(_ matrix: [[Int]], _ target: Int) -> Bool {
    for row in matrix {
        
        if row.first! <= target && row.last! >= target {
            if isExistsByBS(row, target) { return true }
        }
    }
    
    return false
}

private func isExistsByBS(_ arr: [Int], _ target: Int) -> Bool {
    let n = arr.count
    
    var low = 0, high = n - 1
    
    while low <= high {
        let mid = (low + high) / 2
        
        if arr[mid] == target {
            return true
        }
        else if arr[mid] > target {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    
    return false
}

// Optimal Approach
// TC -> O(m+n)

/* Why are we standing at first row and last coloumn ?
 Because that corner has two properties, it is part of both ascending and descending order.
 
 We can also take last row and first coloumn corner.
 And if you observe other corners, you cannot decide which column to eliminate.
 */
func searchMatrix2DII2(_ matrix: [[Int]], _ target: Int) -> Bool {
    // m = rows, n = coloumns
    let m = matrix.count, n = matrix.first!.count
    
    // Pointers
    var row = 0, col = n - 1
    
    while row < m && col > -1  {
        
        let ele = matrix[row][col]
        
        // eliminate entier coloumn
        if ele > target {
            col -= 1
        } else if ele < target { // eliminate entire row.
            row += 1
        } else {
            return true
        }
    }
    
    return false
}
