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
            if hasLeftChild {
                (left as! BinarySearchTree).insert(value: value)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {
            if hasRightChild {
                (right as! BinarySearchTree).insert(value: value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
}

class TreeCode: LeetCode {
    override func run() {
        super.run()
        
        let bsTree = generateBSTree()
        let bTree = generateBTree()

        let bstpath = ""
        var bstpaths: [String] = []

        outputAllPathInBTree(root: bsTree, path: bstpath, paths: &bstpaths)

        print("outputAllPathInBTree is: ")
        print(bstpaths)

        let btpath = ""
        var btpaths: [String] = []

        outputAllPathInBTree(root: bTree, path: btpath, paths: &btpaths)

        print("outputAllPathInBTree is: ")
        print(btpaths)
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

    func generateBSTree() -> BinarySearchTree<Int> {
        let bsTree = BinarySearchTree(value: 7)
        bsTree.insert(value: 20)
        bsTree.insert(value: 9)
        bsTree.insert(value: 10)
        bsTree.insert(value: 25)
        bsTree.insert(value: 2)
        bsTree.insert(value: 40)
        bsTree.insert(value: 16)
        bsTree.insert(value: 6)

        print("bsTree is: ")
        print(bsTree)

        print("find 9-35: ")
        findTree(tree: bsTree)

        print("\r")

        return bsTree
    }

    func generateBTree() -> BinaryTree<Int> {
        let bTree = BinaryTree(value: 1)

        bTree.right = BinaryTree(value: 3)

        let bl = BinaryTree(value: 2)
        bl.right = BinaryTree(value: 5)

        bTree.left = bl

        print("binary tree is: ")
        print(bTree)
        print("\r")

        return bTree
    }

    func outputAllPathInBTree(root: BinaryTree<Int>?, path: String, paths: inout [String]) -> Void {
        if root == nil {
            return
        }

        var p = path.appending(String(root!.value))

        if root?.left == nil && root?.right == nil {
            paths.append(p)
        } else {
            p = p.appending("->")
            outputAllPathInBTree(root: root?.left, path: p, paths: &paths)
            outputAllPathInBTree(root: root?.right, path: p, paths: &paths)
        }
    }
}





