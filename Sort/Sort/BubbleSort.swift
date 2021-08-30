//
//  BubbleSort.swift
//  Sort
//
//  Created by slowdony on 2021/8/27.
//


/**
 冒泡排序
 两两对比,把最大的一直挪到最后面
 时间复杂度 最好 O(n) 最坏 O(n^2)
 空件复杂度 O(1)
 稳定性:✅
 In-place:✅
 */
import Foundation
class BubbleSort : BaseSort {
    
    override func sortAction() {
        let count = arrayList.count
        for i in 0..<count {
            for j in 1..<count-i {
                if cmpIndex(j-1, j) > 0{
                    swap(j-1,j)
                }
            }
        }
    }
    

}
//优化方案 如果部分有序,减少比较次数
class BubbleSort1 : BaseSort {
    override func sortAction() {
        let count = arrayList.count
        for i in 0..<count {
            var ischange = true
            for j in 1..<count-i {
                if cmpIndex(j-1, j) > 0{
                    swap(j-1,j)
                    ischange = false
                }
            }
            if ischange { break }
        }
    }
}
