//
//  HeapSort.swift
//  Sort
//
//  Created by slowdony on 2021/8/29.
//

import UIKit
/**
 堆排序 (对选择排序的一种优化)
 无序序列原地建堆,依次拿出堆顶元素,并恢复堆特性
 
1️⃣.原地建堆(heapify)
2️⃣.重复执行以下操作,知道堆元素为1
  1.交换堆顶元素和堆尾元素
  2.堆的元素数量减一
  3.对0位置进行1次shiftDown操作
  
 稳定性:❌
 时间复杂度:  O(nlog(n))
 空间复杂度: O(1)
 In-place:✅
 
 下标为i的节点的父节点下标为 (i-1)/2
 下标为i的节点的左孩子节点下标:i*2+1
 下标为i的节点的右孩子节点下标:i*2+2
 */
class HeapSort: BaseSort {

    override func sortAction() {
        let heapSize = arrayList.count
        ///建堆
        //先从最后一个节点开始, (heapSize-1-1)/2 = heapSize/2-1
        var i =  heapSize/2-1
        while i >= 0 {
            heapfiy(heapSize, i)
            i -= 1
        }
        
        ///排序
        var j = heapSize-1
        while j > 0 {
            //把堆顶元素和堆尾元素替换
            swap(j, 0)
            //重新修复堆
            heapfiy(j, 0)
            //此时堆尾元素已经排好,移除后继续替换新的堆顶元素和堆尾元素
            j -= 1
        }
    }
    
    
    /// 维护堆的性质
    /// - Parameters:
    ///   - n: 数组长度
    ///   - i: 待维护节点的下标
    func heapfiy(_ n:Int,_ i:Int){
        //假设父节点最大为i
        var largest = i
        //左节点
        let lson = i*2+1
        //右节点
        let rson = i*2+2
        //左节点大于父节点 把左节点赋值给父节点
        if lson < n && cmpIndex(largest, lson) < 0 {
            largest = lson
        }
        //右节点大于父节点 把右节点赋值给父节点
        if rson < n && cmpIndex(largest, rson) < 0{
            largest = rson
        }
        //
        if largest != i {
            swap(largest, i)
            heapfiy(n, largest)
        }
    }
}
