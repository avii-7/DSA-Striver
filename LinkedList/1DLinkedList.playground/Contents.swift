import Foundation

var greeting = "Hello, playground"

final class Node<T: Equatable> {
    
    let data: T
    
    var next: Node?
    
    var count: Int {
        var count = 0
        var temp: Node<T>? = self
        while(temp != nil) {
            count += 1
            temp = temp?.next
        }
        return count
    }
    
    init(data: T, next: Node?) {
        self.data = data
        self.next = next
    }
    
    convenience init(data: T) {
        self.init(data: data, next: nil)
    }
    
    convenience init?(arr: [T])  {
        if arr.isEmpty { return nil }
        self.init(data: arr[0])
        var mover: Node<T> = self
        
        for index in 1..<arr.count {
            let temp = Node(data: arr[index])
            mover.next = temp
            mover = temp
        }
    }
    
    func traverse() {
        var temp: Node<T>? = self
        while(temp != nil) {
            print(temp!.data, terminator: " ")
            temp = temp?.next
        }
    }
    
    func deleteTail() {
        var mover: Node<T>? = self
        var lastSecond: Node<T>? = nil
        
        while(mover?.next != nil) {
            lastSecond = mover
            mover = mover?.next
        }
        
        lastSecond?.next = nil
    }
    
    func deleteTail2() {
        var mover: Node<T>? = self
        
        if mover?.next == nil {
            return
        }
        
        while(mover?.next?.next != nil) {
            mover = mover?.next
        }
        
        mover?.next = nil
    }
    
    func delete(ele: T) -> Node<T>? {
        var mover: Node<T>? = self
        
        if mover!.data == ele {
            return mover?.next
        }
        
        while mover != nil {
            if mover?.next?.data == ele {
                mover?.next = mover?.next?.next
                break
            }
            
            mover = mover?.next
        }
        
        return self
    }
    
    func insertAtTail(ele: T) {
        var mover: Node<T>? = self
        
        while mover?.next != nil {
            mover = mover?.next
        }
        
        mover?.next = Node(data: ele)
    }
    
    func insert(atPosition position: Int, node: Node<T>) -> Node<T> {
        
        if position == 1 {
            node.next = self
            return node
        }
        
        var count = 2
        
        var mover: Node<T>? = self
//        var previous: Node<T>? = nil
        
        while(mover != nil) {
            
            if position == count {
                break
            }
            
            count += 1
            
            mover = mover?.next
        }
        
        let moverNext = mover?.next
        mover?.next = node
        node.next = moverNext
    
        return self
    }
}

let arr = [1, 2, 5, 1, 3, 15]
let node = Node(arr: arr)!
node.insert(atPosition: 1, node: .init(data: 11)).traverse()
print("")
node.insert(atPosition: 6, node: .init(data: 11)).traverse()
print("")
node.insert(atPosition: 4, node: .init(data: 11)).traverse()

