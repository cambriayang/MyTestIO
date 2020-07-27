//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

var solution = Solution()
var turple1 = solution.lengthOfLongestSubstring("adbdeacdmmm")
print(turple1)

let strs2: [String] = ["abcdfj", "abc", "abcmnihiuh", "abcmunh"]
let str2: String = solution.longestCommonPrefix(strs2)
print(str2)

var array3 = [2,3,1,20,88,9,1000,10,256,78,88,70]
solution.bubbleSort(arr: &array3)
print(array3)

var array4 = [2,3,1,20,88,9,1000,10,256,78,88,70]
solution.insertSort(arr: &array4)
print("insertsort: \(array4)")

var array5 = [2,3,1,20,88,9,1000,10,256,78,88,70]
solution.quickSort(arr: &array5, left: array5.startIndex, right: array5.endIndex-1)
print("quicksort: \(array5)")

extension String {
    subscript(_ i: Int)->Character {
        get {return self[index(startIndex, offsetBy: i)]}
    }
}

class Node<T> {
    var value: T
    var next: Node<T>?
    init(_ val: T) {
        self.value = val
        self.next = nil
    }
}

class IntLinkList {
    var head: Node<Int>?
    var tail: Node<Int>?
    
    init() {
        tail = nil
        head = tail
    }
    
    var isEmpty: Bool {
        get {
            return head == nil
        }
    }
    
    func append(value: Int) {
        let node = Node(value)
        if tail == nil {
            tail = node
            head = tail
        } else {
            tail!.next = node
            tail = tail!.next
        }
    }
    
    func appendToHead(value: Int) {
        let node = Node(value)
        if head == nil {
            head = node
            tail = head
        } else {
            node.next = head?.next
            head = node
        }
    }
    
    func insertAt(index: Int, value: Int) {
        if index == 0 {
            self.appendToHead(value: value)
        }
        
        var tmp = head
        
        var i: Int = 0
        
        while i != index && tmp == nil {
            tmp = tmp?.next
            i+=1
        }
        
        if i == index {
            let node = Node(value)
            node.next = tmp?.next
            tmp?.next = node
        } else {
            //说明index太大，还没到，链表就走完了
            self.append(value: value)
        }
    }
}

let list1 = IntLinkList()
list1.append(value: 1)
list1.append(value: 2)
list1.append(value: 4)
list1.append(value: 5)
list1.append(value: 22)

let list2 = IntLinkList()
list2.append(value: 1)
list2.append(value: 3)
list2.append(value: 4)
list2.append(value: 5)
list2.append(value: 6)
list2.append(value: 7)
list2.append(value: 8)


class Solution {
    func lengthOfLongestSubstring(_ s: String) -> (Int, String?) {
        if s.isEmpty {
            return (0, nil)
        }
        
        var maxLength = 0
        var start = maxLength
        
        var retString: String? = " "
        let strArray = Array(s)
        
        var hashTable: Dictionary<Character, Int> = [Character:Int]()
                
        for i in 0..<s.count {
            if hashTable.keys.contains(s[i]) && hashTable[s[i]]! >= start {
                start = hashTable[s[i]]!+1
            }
            
            hashTable[s[i]] = i
            
            //此处就是获取子串，由于会一直遍历到最后，所以如果有多个相等长度的子串，会停留在最后一个子串，返回
            if i+1-start >= maxLength {
                let subArr = strArray[start..<i+1]
                let subStr: String = subArr.map{String.init($0)}.joined()
                retString = subStr
            }
            
            maxLength = max(maxLength, i+1-start)
        }

        return (maxLength, retString!)
    }
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count <= 0 {
            return ""
        }
        
        if strs.count == 1 {
            return strs[0]
        }
        
        let str = strs[0]
        for i in 0..<str.count {
            let c: Character = str[i]
            for j in 1..<strs.count {
                if i == strs[j].count || c != strs[j][i] {
                    let rightIndex = strs[0].index(strs[0].startIndex, offsetBy: i)
                    return String(strs[0][strs[0].startIndex..<rightIndex])
                }
            }
        }
        
        return strs[0]
    }
    
    func bubbleSort(arr: inout [Int]) {
        for i in 0..<arr.count-1 {
            for j in 0..<arr.count-1-i {
                if arr[j] > arr[j+1] {
                    arr.swapAt(j, j+1)
                }
            }
        }
    }
    
    func insertSort(arr: inout [Int]) {
        for i in 1..<arr.endIndex {
            let temp = arr[i]
            for j in (0..<i).reversed() {
                if arr[j] > temp {
                    arr.swapAt(j, j+1)
                }
            }
        }
    }
    
    //寻找pivot的函数
    func partition(arr: inout [Int], left: Int, right: Int) -> Int {
        let pivot = left
        var index = pivot+1
        for i in index...right {
            if arr[i] < arr[pivot] {
                arr.swapAt(i, index)
                index+=1
                //i和index都更新，以pivot为分隔，两边都冒泡，后面再将假设的pivot替换为真正的pivot，然后继续递归
            }
        }
        //此处相当于pivot需要更新
        arr.swapAt(pivot, index-1)
        return index-1
    }
    
    func quickSort(arr: inout [Int], left: Int, right: Int) {
        if arr.count <= 1 {
            //nothing, live it alone
        }
        
        let left = left
        let right = right
        if left < right {
            let partitionIndex = partition(arr: &arr, left: left, right: right)
            quickSort(arr: &arr, left: left, right: partitionIndex-1)
            quickSort(arr: &arr, left: partitionIndex+1, right: right)
        }
    }
    
    func sortFrequencyArray(source: [Int]) -> [Int] {
        if source.count <= 1 {
            return source
        }
        
        //key是数字，value是出现的频率
        var hashTable: Dictionary<Int, Int> = [Int:Int]()
        for i in 0..<source.count {
            let key: Int = source[i]
            
            if hashTable.keys.contains(key) {
                //更新数值
                var value = hashTable[key]
                value! += 1
                hashTable[key] = value
            } else {
                hashTable[key] = 1
            }
        }
        
        let values = hashTable.sorted{
            if $0.1 == $1.1 {
                //如果value（频率）相等，则按照key倒序
                return $0.0 > $1.0
            }
            
            //如果value（频率）不等，则按照value倒序
            return $0.1 > $1.1
        }
        
        var result: [Int] = [Int]()
        
        for i in 0..<values.count {
            for _ in 0..<values[i].1 {
                result.append(values[i].0)
            }
        }
        
        return result
    }
    
    //left和right是已经排好序的链表
    func bindTwoLink(firstList left: IntLinkList, second right: IntLinkList) -> IntLinkList {
        guard !left.isEmpty else {return right}
        
        guard !left.isEmpty else {return right}
        
        let list = IntLinkList()
        
        var currentLeft = left.head
        var currentRight = right.head
        
        if let leftNode = currentLeft , let rightNode = currentRight {
            if leftNode.value < rightNode.value {
                list.head = leftNode
                currentLeft = leftNode.next
            } else {
                list.head = rightNode
                currentRight = rightNode.next
            }
            list.tail = list.head
        }
        
        while let leftNode = currentLeft, let rightNode = currentRight {
            if leftNode.value < rightNode.value {
                list.tail?.next = leftNode
                currentLeft = leftNode.next
            } else {
                list.tail?.next = rightNode
                currentRight = rightNode.next
            }
            list.tail = list.tail?.next
        }
        
        //此处还有最后两个尾端没有遍历到
        if let leftNode = currentLeft {list.tail?.next = leftNode}
        if let rightNode = currentRight {list.tail?.next = rightNode}
        
        return list
    }
    
    //获取[9,35]
    func findTree(tree: BinarySearchTree<Int>) {
        if tree.value <= 9 {
            //在右边找
            if tree.value == 9 {
                print(tree.value, terminator: " ")
            }
            
            if tree.hasRightChild {
                findTree(tree: tree.right!)
            }
        } else if tree.value >= 35 {
            //在左边找
            if tree.value == 35 {
                print(tree.value, terminator: " ")
            }
            
            if tree.hasLeftChild {
                findTree(tree: tree.left!)
            }
        } else if tree.value > 9 && tree.value < 35 {
            print(tree.value, terminator: " ")
            if tree.hasLeftChild {
                findTree(tree: tree.left!)
            }
            if tree.hasRightChild {
                findTree(tree: tree.right!)
            }
        }
    }
    
    func trailing_zero_num(number: Int) -> Int {
        var num = 0
        var n = number
        while Bool(truncating: n as NSNumber) {
            num += n/5
            n = n/5
        }
        return num
    }
}

let array6 = [8,8,8,8,8,8,8,8,8,8,8,8,8,7,7,1,1,6,6,1,1,1,2,1,2,4,4,3,3,5,5]
let array7 = solution.sortFrequencyArray(source: array6)
print(array7)

let list = solution.bindTwoLink(firstList: list1, second: list2)

var head = list.head

while head?.next != nil  {
    print(head!.value as Any, terminator: " ")
    head = head!.next
}

print(head!.value)

class TreeNode<T> {
    var value: T
    var children: [TreeNode] = []
    weak var parent: TreeNode?
    
    init(value: T) {
        self.value = value
    }
    
    func add(child: TreeNode) {
        children.append(child)
        child.parent = self
    }
}

let beverages = TreeNode(value: "beverages")

let hotBeverages = TreeNode(value: "hot")
let coldBeverages = TreeNode(value: "cold")

beverages.add(child: hotBeverages)
beverages.add(child: coldBeverages)

print(beverages)

extension TreeNode: CustomStringConvertible {
    var description: String {
        var text = "\(value)"
        if !children.isEmpty {
            text += "{"+children.map{$0.description}.joined(separator: ", ")+"}"
        }
        return text
    }
}

extension TreeNode where T: Equatable {
    func search(value: T) -> TreeNode? {
        if value == self.value {
            return self
        }
        
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        
        return nil
    }
}

extension BinarySearchTree: CustomStringConvertible {
  public var description: String {
    var s = ""
    if let left = left {
      s += "(\(left.description)) <- "
    }
    s += "\(value)"
    if let right = right {
      s += " -> (\(right.description))"
    }
    return s
  }
}

class BinarySearchTree<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    init(value: T) {
        self.value = value
    }
    
    var isRoot: Bool {
        return parent == nil
    }
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    var isLeftChild: Bool {
        return parent?.left === self
    }
    
    var isRightChild: Bool {
        return parent?.right === self
    }
    
    var hasLeftChild: Bool {
        return left != nil
    }
    
    var hasRightChild: Bool {
        return right != nil
    }
    
    var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    
    var count: Int {
        return (left?.count ?? 0)+1+(right?.count ?? 0)
    }
    
    func insert(value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
}

let tree = BinarySearchTree<Int>(value: 7)
tree.insert(value: 20)
tree.insert(value: 9)
tree.insert(value: 10)
tree.insert(value: 25)
tree.insert(value: 2)
tree.insert(value: 40)
tree.insert(value: 16)
print(tree)

solution.findTree(tree: tree)
print("")
//let n = solution.trailing_zero_num(number: 30)
//print(n)
