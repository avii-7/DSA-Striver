//
//  0. Utilities.swift
//  
//
//  Created by Arun on 25/03/25.
//


public func findMax(arr: [Int]) -> Int {
    
    var maxi = Int.min
    
    for ele in arr {
        if ele > maxi {
            maxi = ele
        }
    }
    
    return maxi
}

public func findSmallAndMax(arr: [Int]) -> (small: Int, max: Int) {
    
    var small = Int.max
    var maxi = Int.min

    for ele in arr {
        if ele > maxi {
            maxi = ele
        }
        
        if ele < small {
            small = ele
        }
    }
    
    return (small, maxi)
}
