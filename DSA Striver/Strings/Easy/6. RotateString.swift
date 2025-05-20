//
//  6. RotateString.swift
//  DSA Striver
//
//  Created by Arun on 15/05/25.
//

// LC: - https://leetcode.com/problems/rotate-string
// Video: https://www.youtube.com/watch?v=V5-7GzOfADQ

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

/* --------------------------------------------------------------- */

/*
 Intuition
 
 As soon as we found our first matched character, we will store that position.
 In the matching process if there is a mismatch, then we will start from previous stored matched character + 1 position.
 
 */

// TC: - O(m * n)
func containsNaive(text: String, _ pattern: String) -> Bool {
    var i = text.startIndex
    var patIndex = pattern.startIndex
    let patternCount = pattern.count
    
    var matchIndex: String.Index? = nil
    
    while i < text.endIndex {
        
        if text[i] == pattern[patIndex] {
            if matchIndex == nil {
                matchIndex = i
            }
            i = text.index(i, offsetBy: 1)
            patIndex = pattern.index(patIndex, offsetBy: 1)
            
            if let matchIndex, text.distance(from: matchIndex, to: i) == patternCount {
                return true
            }
        }
        else {
            patIndex = pattern.startIndex
            
            if let matchIndex {
                i = text.index(matchIndex, offsetBy: 1)
            }
            else {
                i = text.index(i, offsetBy: 1)
            }
            matchIndex = nil
        }
        
    }
    
    return false
}

// TC -> O(m + n)
// SC -> O(m + m)
func rotateString2(_ s: String, _ goal: String) -> Bool {
    if s == goal { return true }

    if s.count != goal.count { return false }
    
    // TC will be O(n) as we need to traverse each and every element of s in order to append.
    let contatenated = s.appending(s)
    
    return containsKMP(contatenated, pattern: goal)
}

// Knuth Morris Pratt Algo
func containsKMP(_ text: String, pattern: String) -> Bool {
    
    let lps = createLPSArray(pattern)
    
    var i = text.startIndex, pi = pattern.startIndex
    
    while i < text.endIndex {
        
        if pi == pattern.endIndex {
            return true
        }
        else if text[i] == pattern[pi] {
            i = text.index(after: i)
            pi = pattern.index(after: pi)
        }
        else {
            if pattern.startIndex < pi {
                let lpsIndex = pattern.index(before: pi).utf16Offset(in: pattern)
                let value = lps[lpsIndex]
                pi = pattern.index(pattern.startIndex, offsetBy: value)
            }
            else {
                i = text.index(after: i)
            }
        }
    }
    
    return false
}

func createLPSArray(_ pattern: String) -> [Int] {
    var pi = pattern.startIndex
    var i = pattern.index(after: pi)
    
    var arr = Array(repeating: 0, count: pattern.count)
    
    while i < pattern.endIndex {
        
        if pattern[pi] == pattern[i] {
            arr[i.utf16Offset(in: pattern)] = pi.utf16Offset(in: pattern) + 1
            pi = pattern.index(after: pi)
        }
        
        i = pattern.index(after: i)
    }
    
    return arr
}
