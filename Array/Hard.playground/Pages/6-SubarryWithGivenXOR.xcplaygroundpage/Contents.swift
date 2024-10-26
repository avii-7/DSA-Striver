//: [Previous](@previous)

// https://www.interviewbit.com/problems/subarray-with-given-xor/

// TC -> O(n * n)
// SC -> O(1)
func solveBrute(_ A: inout [Int], _ B: inout Int) -> Int {
    
    var count = 0
    
    for i in A.indices {
        var xor = 0
        for j in i..<A.count {
            xor ^= A[j]
            
            if xor == B {
                count += 1
            }
        }
    }
    
    return count
}

//var a = [4, 2, 2, 6, 4]
//var b = 6

//var a = [5, 6, 7, 8, 9]
//var b = 5
//
//print(solve(&a, &b))

// TC -> O(n)
// SC -> O(n)

// Derived Formula => xor = x ^ b
// therefore: x = xor ^ b
func solveBest(_ A: inout [Int], _ B: inout Int) -> Int {
    
        var count = 0
        var dict = [Int: Int]()
        dict[0] = 1
        
        var xor = 0
        for ele in A {
            xor ^= ele
            
            if let value = dict[xor ^ B] {
                count += value
            }
            
            if let value = dict[xor] {
                dict[xor] = value + 1
            }
            else {
                dict[xor] = 1
            }
        }
        return count
}
var a = [4, 2, 2, 6, 4]
var b = 6

//var a = [5, 6, 7, 8, 9]
//var b = 5

print(solveBest(&a, &b))
