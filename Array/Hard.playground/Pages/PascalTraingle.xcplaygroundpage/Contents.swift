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

let row = 1
print("\(row) row: \(getNthRow(row: row))")


// Version 3:
//a. Given the number of rows n. Print the first n rows of Pascal’s triangle.

//TC -> O(rows * rows)

func getPascalTraingle1(rows: Int) -> [[Int]] {
    var result = [[Int]]()
    
    for i in 1...rows {
        result.append(getNthRow(row: i))
    }
    
    return result
}

let rows = 6
print(getPascalTraingle1(rows: rows))

//b. Given the number of rows n. Print the first n rows of Pascal’s triangle.

// TC -> O(rows * (rows/2))

// Explanation: Use the question statement, a row is derive from previous row.
// and after half of the columns we are just repeating those elements.

func getPascalTraingle2(rows: Int) -> [[Int]] {
    var result = [[1]]
    result.reserveCapacity(rows)
    
    for i in 1..<rows {
        var row = Array(repeating: 1, count: i + 1)
        for j in stride(from: 1, to: result.count/2 + 1, by: 1) {
            row[j] = result[i - 1][j - 1] + result[i - 1][j]
            row[row.count - 1 - j] = row[j]
        }
        
        result.append(row)
    }
    
    return result
}

print(getPascalTraingle2(rows: 6))
