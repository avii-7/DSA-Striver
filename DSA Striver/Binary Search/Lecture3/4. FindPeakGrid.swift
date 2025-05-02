//
//  4. FindPeakGrid.swift
//  DSA Striver
//
//  Created by Arun on 02/05/25.
//

// Brute Approach
// O(m * n)
func findPeakGrid(_ mat: [[Int]]) -> [Int] {
    
    let m = mat.count
    let n = mat.first!.count
    
    for rowIndex in mat.indices {
        
        for colIndex in mat[rowIndex].indices {
            
            let topElement = rowIndex - 1 >= 0 ? mat[rowIndex - 1][colIndex] : -1
            let leftElement = colIndex - 1 >= 0 ? mat[rowIndex][colIndex - 1] : -1
            
            let rightElement = colIndex + 1 < n ? mat[rowIndex][colIndex + 1] : -1
            let bottomElement = rowIndex + 1 < m ? mat[rowIndex + 1][colIndex] : -1
            
            let ele = mat[rowIndex][colIndex]
            
            if ele > topElement, ele > bottomElement, ele > leftElement, ele > rightElement {
                return [rowIndex, colIndex]
            }
        }
    }
    
    return []
}

// My Weird solution: Just follow larger element.
// TC: - O(m * n)
func findPeakGrid1(_ mat: [[Int]]) -> [Int] {
    
    let m = mat.count
    let n = mat.first!.count
    
    var rowIndex = 0, colIndex = 0
    
    while true {
        let ele = mat[rowIndex][colIndex]
        
        let topElement = rowIndex - 1 >= 0 ? mat[rowIndex - 1][colIndex] : -1
        let leftElement = colIndex - 1 >= 0 ? mat[rowIndex][colIndex - 1] : -1
        
        let rightElement = colIndex + 1 < n ? mat[rowIndex][colIndex + 1] : -1
        let bottomElement = rowIndex + 1 < m ? mat[rowIndex + 1][colIndex] : -1
        
        if ele > topElement, ele > bottomElement, ele > leftElement, ele > rightElement {
            return [rowIndex, colIndex]
        }
        else if ele < topElement {
            rowIndex -= 1
        }
        else if ele < leftElement {
            colIndex -= 1
        }
        else if ele < rightElement {
            colIndex += 1
        }
        else if ele < bottomElement {
            rowIndex += 1
        }
    }
    
    return []
}
