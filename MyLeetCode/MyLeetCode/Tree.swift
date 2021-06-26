//
//  Tree.swift
//  MyLeetCode
//
//  Created by Argost on 2020/9/4.
//  Copyright © 2020 Argost. All rights reserved.
//

import UIKit

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

extension BinaryTree: CustomStringConvertible {
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

class BinaryTree<T: Comparable> {
    public var value: T
    public var parent: BinaryTree?
    public var left: BinaryTree?
    public var right: BinaryTree?
    
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
}

class BinarySearchTree<T: Comparable> : BinaryTree<T> {
    func insert(value: T) {
        if value < self.value {
            if case let left as BinarySearchTree = left {
                left.insert(value: value)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {
            if case let right as BinarySearchTree = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
}

func printTreeSeperator() -> Void {
    print("========LeetCode: Tree=========")
}

class TreeCode: NSObject {
    override init() {
        printTreeSeperator()
    }

    //获取[9,35]
    func findTree(tree: BinarySearchTree<Int>) {
        if tree.value <= 9 {
            //在右边找
            if tree.value == 9 {
                print(tree.value, terminator: " ")
            }

            if tree.hasRightChild {
                findTree(tree: tree.right! as! BinarySearchTree<Int>)
            }
        } else if tree.value >= 35 {
            //在左边找
            if tree.value == 35 {
                print(tree.value, terminator: " ")
            }

            if tree.hasLeftChild {
                findTree(tree: tree.left! as! BinarySearchTree<Int>)
            }
        } else if tree.value > 9 && tree.value < 35 {
            print(tree.value, terminator: " ")
            if tree.hasLeftChild {
                findTree(tree: tree.left! as! BinarySearchTree<Int>)
            }
            if tree.hasRightChild {
                findTree(tree: tree.right! as! BinarySearchTree<Int>)
            }
        }
    }

    public func test() {
        let bsTree = BinarySearchTree(value: 7)
        bsTree.insert(value: 20)
        bsTree.insert(value: 9)
        bsTree.insert(value: 10)
        bsTree.insert(value: 25)
        bsTree.insert(value: 2)
        bsTree.insert(value: 40)
        bsTree.insert(value: 16)
        
        print("bsTree is: ")
        print(bsTree)

        print("find 9-35: ")
        findTree(tree: bsTree)
    }
}
