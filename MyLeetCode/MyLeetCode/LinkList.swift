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

func printLinkListSeperator() -> Void {
    print("========LeetCode: LinkList=========")
}

class LinkList: NSObject {

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
