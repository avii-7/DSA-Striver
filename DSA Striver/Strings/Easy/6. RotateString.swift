//
//  6. RotateString.swift
//  DSA Striver
//
//  Created by Arun on 15/05/25.
//

// TC -> O(n * n)
// SC -> O(n)
func rotateString(_ s: String, _ goal: String) -> Bool {
    
    if s == goal { return true }
    
    if s.count != goal.count { return false }
    
    var temp = s
    
    let firstIndex = s.startIndex
    
    for _ in s.indices {
        
        let last = temp.removeLast()
        temp.insert(last, at: firstIndex)
        
        if temp == goal {
            return true
        }
    }
    
    return false
}

// Concatenation Approach Better
// TC: - O(n + n)
// SC -> O(2n)
func rotateString1(_ s: String, _ goal: String) -> Bool {
    if s == goal { return true }

    if s.count != goal.count { return false }
    
    // TC will be O(n) as we need to traverse each and every element of s in order to append.
    let contatenated = s.appending(s)
    
    return contatenated.contains(goal)
}
