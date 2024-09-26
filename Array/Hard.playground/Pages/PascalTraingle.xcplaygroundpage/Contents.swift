// Question: https://takeuforward.org/data-structure/program-to-generate-pascals-triangle/

// Version 1:
// Given row number r and column number c. Print the element at position (r, c) in Pascal’s triangle.

// TC -> O(row)
// SC -> O(1)

// Solution-> Using formula nCr

func getPascalValue(row: Int, col: Int) -> Int {
    
    return nCr(n: row - 1, r: col - 1)
    
    func nCr(n: Int, r: Int) -> Int {
        
        var result = 1
        
        for i in 0..<r {
            result = result * (n - i)
            result = result/(i + 1)
        }
        
        return result
    }
}

print("Value: \(getPascalValue(row: 5, col: 4))")

// Version 2:
// Given the row number n. Print the n-th row of Pascal’s triangle.

// TC -> O(row)

func getNthRow(row: Int) -> [Int] {
    var resultArray = [1]
    var result = 1
    
    for i in 1..<row {
        result = result * (row - i)
        result = result / i
        resultArray.append(result)
    }

    return resultArray
}

let row = 10
print("\(row) row: \(getNthRow(row: row))")


// Version 3:

