//
//  LinkList.swift
//  MyLeetCode
//
//  Created by Argost on 2020/9/4.
//  Copyright © 2020 Argost. All rights reserved.
//

import UIKit

class Node<T> {
    var value: T
    var next: Node<T>?
    init(_ val: T) {
        self.value = val
        self.next = nil
    }
}

extension Node where T: Equatable {
    static func != (lhs: Node<T>, rhs: Node<T>)-> Bool {
        return (lhs.value == rhs.value)
    }
}

func printLinkListSeperator() -> Void {
    print("========LeetCode: LinkList=========")
}

class LinkList: NSObject {
    public func test() {
        let _: Void = printLinkListSeperator()
        reverseLinkList()
    }
    
    func reverseLinkList() -> Void {
        let list3 = IntLinkList()
        list3.append(value: 10)
        list3.append(value: 12)
        list3.append(value: 4)
        list3.append(value: 5)
        list3.append(value: 2)
        
        var prev = reverseList(list3.head)
        
        while prev?.next != nil  {
            print(prev!.value as Any, terminator: " ")
            prev = prev!.next
        }
        print(prev!.value)
        
        var h = reverseList(prev, 0, 3)
        
        while h?.next != nil  {
            print(h!.value as Any, terminator: " ")
            h = h!.next
        }
        print(h!.value)
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
    
    public func append(value: Int) {
        let node = Node(value)
        if tail == nil {
            tail = node
            head = tail
        } else {
            tail!.next = node
            tail = tail!.next
        }
    }
    
    public func appendToHead(value: Int) {
        let node = Node(value)
        if head == nil {
            head = node
            tail = head
        } else {
            node.next = head?.next
            head = node
        }
    }
    
    public func insertAt(index: Int, value: Int) {
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

func reverseList(_ head: Node<Int>?, _ from: Int, _ to: Int) -> Node<Int>? {
    var len = 0
    var cur = head
    var fpre: Node<Int>?
    var tpos: Node<Int>?
    
    while cur != nil {
        len = len+1 //自增往前移动
        fpre = (len == from-1) ? cur : fpre
        tpos = (len == to+1) ? cur : tpos
        cur = cur?.next
    }
    
    if from > to || from < 1 || to > len {
        return head
    }
    
    cur = fpre == nil ? head : fpre?.next
    
    var node2: Node<Int> = (cur?.next)! //这里的cur和node2是用于链表反转部分的两个指针
    
    cur?.next = tpos //反转部分的头结点必然指向tpos
    var next: Node<Int>? //第三个辅助指针
    while node2 != tpos! {//这两个指针向前移动反转的条件是node2还没有到达tpos
        next = node2.next//分割
        node2.next = cur//反转
        cur = node2//前移：过了这里cur会指向to坐标的节点
        node2 = next!//前移：过了这里node2会指向tpos
    }
    
    if fpre != nil {
        //如果不是从头节点开始反转（即从中间某个节点开始反转）。需要将fpre与反转结束后的cur接起来
        fpre?.next = cur
        return head
    }
    
    return cur
}
