//
//  2. ReverseWordsInString.swift
//  
//
//  Created by Arun on 29/03/25.
//

// LC: -> https://leetcode.com/problems/reverse-words-in-a-string/

// TC -> O(n)
// SC -> O(n)
public func reverseWords(_ s: String) -> String {
    var start = -1, end = -1
    
    var result = ""
    
    for (index, char) in s.enumerated() {
        
        if char != " " {
            if start == -1 {
                start = index
            }
            
            end = index
        }
        else if start != -1 && end != -1 {
            let rangeStart = s.index(s.startIndex, offsetBy: start)
            let rangeEnd = s.index(s.startIndex, offsetBy: end)
            let word = " " + s[rangeStart...rangeEnd]
            
            result.insert(contentsOf: word, at: result.startIndex)

            start = -1
            end = -1
        }
    }
    
    if start != -1 && end != -1 {
        let rangeStart = s.index(s.startIndex, offsetBy: start)
        let rangeEnd = s.index(s.startIndex, offsetBy: end)
        let word = s[rangeStart...rangeEnd]
        
        result.insert(contentsOf: word, at: result.startIndex)
    }
    else {
        result.remove(at: result.startIndex)
    }
    
    return result
}
