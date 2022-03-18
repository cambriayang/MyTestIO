//
//  StringCode.swift
//  MyLeetCode
//
//  Created by Argost on 2020/9/4.
//  Copyright © 2020 Argost. All rights reserved.
//

import UIKit

extension String {
    subscript(_ i: Int)->Character {
        get {return self[index(startIndex, offsetBy: i)]}
    }
}

func printStringSeperator() -> Void {
    print("========LeetCode: String=========")
}

class StringCode: NSObject {
    override init() {
        let _: Void = printStringSeperator()
    }
    
    public func test() {
        let _ = longestCommonPrefix(["abcdfj", "abc", "abcmnihiuh", "abcmunh"])
        let _ = multiply("123", "3128")
        let _ = lengthOfLongestSubstring("adbdeacdmmm")
    }
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
    
    print(strs[0])
    return strs[0]
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
    
    print(result)
    return result
}

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
