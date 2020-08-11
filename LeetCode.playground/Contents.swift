//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

var solution = Solution()

let r15 = solution.findMaxInWindow(3, [1,3,-1,-3,5,3,6])
print(r15)

let list3 = IntLinkList()
list3.append(value: 10)
list3.append(value: 12)
list3.append(value: 4)
list3.append(value: 5)
list3.append(value: 2)

var prev = solution.reverseList(list3.head)

while prev?.next != nil  {
    print(prev!.value as Any, terminator: " ")
    prev = prev!.next
}
print(prev!.value)
print(solution.maxProfit([7,1,5,3,6,4]))
print(solution.maxProfitII([7,1,5,3,6,4]))

let ress = solution.restoreIpAddresses("25525511135")
print(ress)
solution.longestConsecutive([100,4,200,1,3,2])
var nums = [3,2,3,1,2,4,5,5,6]
let r10 = solution.findKthLargest(&nums, 4)
print(solution.findLengthOfLCIS([1,3,5,4,7]))
let res = solution.threeSum([-1,0,1,2,-1,-4])
print(solution.multiply("123", "3128"))
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

let array6 = [8,8,8,8,8,8,8,8,8,8,8,8,8,7,7,1,1,6,6,1,1,1,2,1,2,4,4,3,3,5,5]
let array7 = solution.sortFrequencyArray(source: array6)
print(array7)

let list = solution.bindTwoLink(firstList: list1, second: list2)

var head = list.head

while head?.next != nil  {
    print(head!.value as Any, terminator: "&")
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
//solution.outABWithGCD()

let s1 = "mabonm"
let s2 = "eidboammnj"
//let r1 = solution.checkInclusion2(s1, s2)
let r2 = solution.checkInclusion(s1, s2)

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
    
    func outABWithGCD() {
        let queue1 = DispatchQueue(label: "com.queue1.a", qos: .utility)
        let queue2 = DispatchQueue(label: "com.queue2.b", qos: .utility)
        
        var change: Bool = true
        
        queue1.async {
            var count1 = 0
            while true {
                if change {
                    print("queue1:A")
                    change = false
                    count1+=1
                }
                
                if count1 == 10 {
                    break
                }
            }
        }
        
        queue2.async {
            var count2 = 0
            while true {
                if !change {
                    print("queue2:B")
                    change = true
                    count2+=1
                }
                
                if count2 == 10 {
                    break
                }
            }
        }
    }
    
    func checkInclusion2(_ s1: String, _ s2: String) -> Bool {
        if s1.isEmpty || s2.isEmpty {return false}
       
        var s1HashTable: [Character:Int] = [Character:Int]()
        
        for i in 0..<s1.count {
            let c = s1[i]
            s1HashTable[c] = i
        }
        
        if s1HashTable.keys.count > s2.count {return false}
        
        var result: Bool = true
        
        for i in 0..<s2.count {
            let c = s2[i]
            if s1HashTable[c] != nil {
                if s2.count-i < s1HashTable.keys.count {
                    return false
                }
                //证明s2中有s1的字符，下面需要连续的字符表明s1的排列包含于s2
                var index = 0
                for j in 0..<s1HashTable.keys.count {
                    let tmp = s2[i+j]
                    print(tmp)
                    if s1HashTable[tmp] == nil {
                        //有一个不连续，没有的字符
                        result = false
                        break
                    }
                    index = j
                    print(index)
                }
                
                //执行完，如果index是s1HashTable.keys.count，说明循环走完，true，否则早就中断返回false了
                if index+1 == s1HashTable.keys.count {
                    result = true
                    return result
                }
            }
        }
        
        return result
    }
    
    //保证了字符串都是小写字母，97是小写的a，65是大写的A
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.isEmpty || s2.isEmpty {return false}
        guard s1.count <= s2.count else {
            return false
        }

        func allZero(_ counts: [Int]) -> Bool {
            for i in 0 ..< 26 {
                if counts[i] != 0 {
                    return false
                }
            }
            return true
        }

        let chars1 = Array(s1.unicodeScalars)
        let chars2 = Array(s2.unicodeScalars)
        let len1 = chars1.count
        let len2 = chars2.count
        var counts = [Int](repeatElement(0, count: 26))

        //可以简单理解有两个同时滑动的窗口，都向右滑，上面一个窗口后面会为空
        for i in 0 ..< len1 {
            //s1从右边滑进的+1，从右边滑出的-1
            counts[Int(chars1[i].value - 97)] += 1
            //s2从右边滑进的-1，从右边滑出的-1
            counts[Int(chars2[i].value - 97)] -= 1
        }

        if allZero(counts) {return true}
        
        //因为都是s2，所以只看滑进还是滑出
        for i in len1 ..< len2 {
            //从右边滑进，-1
            counts[Int(chars2[i].value - 97)] -= 1
            //从右边滑出，+1
            counts[Int(chars2[i - len1].value - 97)] += 1
            
            if allZero(counts) {return true}
        }

        //窗口的大小是短串的长度，必须要这样，否则肯定是false
        return false
    }
    
    func multiply(_ num1: String, _ num2: String) -> String {
        if Int(num1) == 0 || Int(num2) == 0 {return "0"}
        var result = ""
        var resultArray: [Int] = [Int].init(repeatElement(0, count: num1.count+num2.count))
        //这两个for执行完，结果数组里面是未处理过进位的结果
        for i in (0..<num1.count) {
            for j in 0..<num2.count {
                let c1 = Int(String(num1[i]))!
                let c2 = Int(String(num2[j]))!
                
                let res = c1*c2
                resultArray[i+j] += res
            }
        }
        
        //处理进位
        var carrys = 0
        for i in (0..<resultArray.count).reversed() {
            if resultArray[i] == 0 {
                continue
            }
            
            let tmp = resultArray[i]+carrys
            
            carrys = tmp/10
            resultArray[i] = tmp%10
        }
        
        //最后一位如果是0，则需要舍弃
        let end = resultArray.last!==0 ? resultArray.count-1 : resultArray.count
        for i in 0..<end {
            result += String(resultArray[i])
        }
        
        return result
    }
    
    func reverseWords(_ s: String) -> String {
        return s.split {$0.isWhitespace}.reversed().joined(separator: " ")
    }
    
    func threeSum(_ nums: [Int])->[[Int]]? {
        var tempNums = nums
        
        if nums.count <= 0 {return nil}
        //排序
        insertSort(arr: &tempNums)
        if tempNums[0] > 0 {return nil}
        
        var res = [[Int]]()
        
        for i in 0..<tempNums.count {
            let target = -tempNums[i]
            
            var j = i+1
            var k = tempNums.count-1
            
            while k-j > 0 {
                let numj = tempNums[j]
                let numk = tempNums[k]
                
                if numj+numk < target {
                    j += 1
                } else if numj+numk > target {
                    k -= 1
                } else {
                    //找到，返回i，j，k
                    res.append([tempNums[i],numj,numk])
                    break
                }
            }
        }
        
        return res
    }
    
    func dfs(_ i: Int,_ j: Int,_ m: Int,_ n:Int,_ grid: inout [[Int]],_ tempArea: inout Int) -> Int {
        if i<0 || i>=m || j<0 || j>=n || grid[i][j] == 0 {
            return tempArea
        }
        grid[i][j] = 0
        tempArea += 1
        tempArea = dfs(i+1, j, m, n, &grid, &tempArea)
        tempArea = dfs(i-1, j, m, n, &grid, &tempArea)
        tempArea = dfs(i, j+1, m, n, &grid, &tempArea)
        tempArea = dfs(i, j-1, m, n, &grid, &tempArea)
        return tempArea
    }
    
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var tempGrid = grid
        var area = 0
        let m = tempGrid.count
        var n = 0
        var islandMax = 0
        for i in 0..<m {
            n = tempGrid[i].count
            for j in 0..<n {
                area = 0
                area = dfs(i, j, m, n, &tempGrid, &area)
                islandMax = max(islandMax, area)
            }
        }
        return islandMax
    }
    
    func findLengthOfLCIS(_ nums: [Int])->Int {
        if nums.count <= 1 {return nums.count}
        var ans = 1
        var count = 1
        
        for i in 0..<nums.count-1 {
            if nums[i+1] > nums[i] {
                count += 1
            } else {
                count = 1
            }
            
            ans = count>ans ? count : ans
        }
        
        return ans
    }
    
    func findKthLargest(_ nums: inout [Int], _ k: Int) -> Int {
        return quickSelect(&nums, 0, nums.count-1, nums.count-k)
    }
    
    func quickSelect(_ a: inout [Int], _ l: Int, _ r: Int, _ index: Int) -> Int {
        let q = partition(arr: &a, left: l, right: r)
        if q == index {
            return a[q]
        } else {
            return q<index ? quickSelect(&a, q+1, r, index) : quickSelect(&a, l, q-1, index)
        }
    }
    
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        let nums = nums.sorted(){$0 < $1}
        print(nums)
        var longestStreak = 1
        var currentStreak = 1
        for i in 1..<nums.count {
            if nums[i] != nums[i - 1] {
                if nums[i - 1] + 1 == nums[i] {
                    currentStreak += 1
                } else {
                    longestStreak = max(longestStreak, currentStreak)
                    currentStreak = 1
                }
            }
        }
        return max(longestStreak, currentStreak)
    }
    
    func restoreIpAddresses(_ s: String) -> [String] {
        //回溯法
        var res:[String]=[]
        var tmp:[String]=[]
        let chs:[Character]=[Character](s)
        backTrace(&res,&tmp,chs,0,0)
        return res
    }
    
    func backTrace(_ res:inout [String],_ tmp:inout [String],_ chs:[Character],_ ind:Int,_ has:Int){
        if ind == chs.count && has == 4{
            var str:String=""
            for i in tmp{
                str += i+"."
            }
            str.removeLast()
            res.append(str)
            return
        }
        if (has == 4 && ind < chs.count) || (ind == chs.count && has < 4){return}
        for i in ind...ind+2{
            if i >= chs.count{break}    //确保i是一个有效的下标
            if i > ind && chs[ind] == "0"{break}
            let str:String=String(chs[ind...i])
            if str.count == 3 && str > "255"{continue}  //长度为1和2的数都可以，为3的话需要筛选
            tmp.append(str)
            backTrace(&res,&tmp,chs,i+1,has+1)
            tmp.removeLast()
        }
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 2 {return 0}
        
        var minPrice = Int.max
        var maxProfit = 0
        for i in 0..<prices.count {
            if prices[i] < minPrice {
                minPrice = prices[i]
            } else if prices[i] - minPrice > maxProfit {
                maxProfit = prices[i]-minPrice
            }
        }
        
        return maxProfit
    }
    
    func maxProfitII(_ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0
        }
        
        var maxProfit = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i-1] {
                maxProfit += prices[i]-prices[i-1]
            }
        }
        return maxProfit
    }
    
    func reverseList(_ head: Node<Int>?) -> Node<Int>? {
        var cur = head
        var last: Node<Int>?
        var next: Node<Int>?
        
        while (cur != nil) {
            next = cur?.next
            cur?.next = last
            last = cur
            cur = next
        }
        
        return last
    }
    
    func findMaxInWindow(_ count: Int, _ nums: [Int]) -> [Int] {
        var res = [Int]()
        
        if nums.count < 0 {
            return []
        }
        
        var maxNum = Int.min
        
        if nums.count < count {
            for i in 0..<nums.count {
                if nums[i] > maxNum {
                    maxNum = nums[i]
                }
            }
            
            res.append(maxNum)
            
            return res
        }
                
        for i in 0..<count {
            if nums[i] > maxNum {
                maxNum = nums[i]
            }
        }
        
        res.append(maxNum)
        
        for j in (nums.count-count-1)..<nums.count {
            if nums[j] > maxNum {
                maxNum = nums[j]
            }
            
            res.append(maxNum)
        }
        
        return res
    }
}





