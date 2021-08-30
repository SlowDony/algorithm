//
//  SelectionSort.swift
//  Sort
//
//  Created by slowdony on 2021/8/29.
//

import UIKit
/**
 选择排序:
 从序列中找出最大元素,和末尾元素交换,比较多,交换少
 
 1️⃣.从序列中找到最大元素,然后与末尾元素交换位置(也可以找最小元素,然后和首部元素交换位置)
 2️⃣.忽略1️⃣的最大元素或者最小元素,然后重复1️⃣
 
 稳定性:❌
 In-place:✅
 时间复杂度: 最好 O(n^2) 最坏 O(n^2)
 空间复杂度:O(1)
 */
class SelectionSort: BaseSort {
    
    override func sortAction() {
        
        for i in 0..<arrayList.count {
            //默认最小元素为第一个元素
            var minIndex = i
            //然后遍历除过i后所以元素,找出最小元素
            for j in (i+1)..<arrayList.count  {
                //加上等于号是稳定排序,否则不稳定
                if cmpIndex(minIndex, j) >= 0  {
                    //把最小元素赋值给min
                    minIndex = j
                }
            }
            //把最小的元素赋值到i位置上
            swap(i,minIndex)
        }
    }
}
