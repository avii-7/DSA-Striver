//
//  6. SprialOrder.swift
//  
//
//  Created by Arun on 27/03/25.
//

public func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    // Rows count
    let m = matrix.count
    
    // Columns count
    let n = matrix[0].count
    
    var left = 0, top = 0
    var bottom = m - 1, right = n - 1
    
    var result = [Int]()
    
    // Sprial direction: right -> bottom -> left -> top
    
    while left <= right && top <= bottom {
        // right
        for i in stride(from: left, to: right + 1, by: 1) {
            result.append(matrix[top][i])
        }
        top += 1
        
        // bottom
        for i in stride(from: top, to: bottom + 1, by: 1) {
            result.append(matrix[i][right])
        }
        right -= 1
        
        // left
        for i in stride(from: right, to: left + 1, by: -1) {
            result.append(matrix[bottom][i])
        }
        bottom -= 1
        
        for i in stride(from: bottom, to: top + 1, by: -1) {
            result.append(matrix[i][left])
        }
        left += 1
    }
    
    return result
}
