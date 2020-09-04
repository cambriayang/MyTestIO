//
//  ArrayCode.swift
//  MyLeetCode
//
//  Created by Argost on 2020/9/4.
//  Copyright © 2020 Argost. All rights reserved.
//

import UIKit

class ArrayCode: NSObject {
    let r: Void = printArraySeperator()
    let r1 = findTheMidNumber([4,3,2,7,8,10,11,18,9])
    let r2 = maxProfit([7,1,5,3,6,4])
    let r3 = maxProfitII([7,1,5,3,6,4])
}

func printArraySeperator() -> Void {
    print("========LeetCode: Array=========")
}

func findTheMidNumber(_ data: [Int]) -> [Int] {
    var res = [Int]()
    
    if data.count == 0 {return res}
    if data.count <= 2 {return res}
    
    var rightMin = [Int](repeating: 0, count: data.count)
    var r_min = data[data.count-1]
    
    //从右往左，寻找每个位置及其之后的最小数
    for i in (0..<data.count).reversed() {
        if data[i] < r_min {
            r_min = data[i]
        }
        rightMin[i] = r_min
    }
    
    //从左往右，寻找左边大且比右边小的数
    var l_max = data[0]
    for i in 0..<data.count-1 {
        if data[i] > l_max {
            l_max = data[i]
            if data[i] < rightMin[i+1] {
                res.append(data[i])
            }
        }
    }
    print(res)
    return res
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
    
    print(maxProfit)
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
    
    print(maxProfit)
    return maxProfit
}
