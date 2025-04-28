//
//  1. RemoveOutermostParenthesis.swift
//  
//
//  Created by Arun on 28/03/25.
//

// LC: - https://leetcode.com/problems/remove-outermost-parentheses/

// TC -> O(n)
// Thought Process -> extract the substring into result without outer parenthesis
public func removeOuterParentheses(_ s: String) -> String {
    var left = 0, right = 0
    var start = -1
    
    var result = ""
    
    for (index, char) in s.enumerated() {
        if left == right {
            start = index
        }
        
        if char == "(" {
            right += 1
        }
        else {
            left += 1
        }
        
        if left == right {
            if index - start > 1 {
                let rangeStart = s.index(s.startIndex, offsetBy: start + 1)
                let rangeEnd = s.index(s.startIndex, offsetBy: index - 1)
                result += s[rangeStart...rangeEnd]
            }
            
            left = 0
            right = 0
        }
    }
    
    return result
}

// TC -> O(n)
public func removeOuterParentheses2(_ s: String) -> String {
    var count = 0
    
    var result = ""
    
    for char in s {
        
        if char == ")" {
            count -= 1
        }
        
        if count != 0 {
            result.append(char)
        }
        
        if char == "(" {
            count += 1
        }
    }
    
    return result
}
