//
//  QuickSort.swift
//  Sort
//
//  Created by slowdony on 2021/8/27.
//

import Foundation
//快速排序 采用分治思想,把一个序列分成一个较大和一个较小序列,然后递归两个子序列
//首先 定义一个基准 参考数 然后每个元素和这个基准元素对比,大的放在大的序列中,小的放到小的序列中,然后递归比较两个子序列,一次类推,直到比较完

//快速排序的本质就是把每个元素都分成轴点元素时,序列就已经成为排序的

class QuickSort : BaseSort {
    override func sortAction() {
        //基准元素
        pivotIndex(&arrayList)
        
    }
    //简便方法
    func pivotIndex(_ arr:inout [Int]) {
        if arr.count <= 1 {
            return
        }
        let pivot = arr.first!
        
        var leftArr = [Int]()
        var rightArr = [Int]()
        
        for i in 1..<arr.count {
            if cmpValue(pivot, arr[i]) < 0 {
                rightArr.append(arr[i])
                swapCount += 1
            }else{
                leftArr.append(arr[i])
                swapCount += 1
            }
        }
        pivotIndex(&leftArr)
        pivotIndex(&rightArr)
        leftArr.append(pivot)
        arr = leftArr + rightArr
    }
}

class QuickSort1: BaseSort {
    
    override func sortAction() {
        //基准元素
        //        pivotIndex(&arrayList)
        quickSort( 0, arrayList.count)
    }
    
    func quickSort(_ start:Int,_ end:Int){
        //分割成一个元素时就不需要在分割了
        if end - start < 2 {
            return
        }
        
        let pivot = pivotSort(start, end)
        quickSort( start, pivot)
        quickSort( pivot+1, end)
    }
    
    func pivotSort(_ start:Int,_ end:Int) -> Int{
        
        //轴点元素
        let pivot = arrayList[start]
        var i = start
        var j = end
        j-=1
        while i < j {
            //先判断最右元素是否小于轴点元素,大于就进行j--,小于就替换<---
            while i < j {
                if cmpValue(pivot, arrayList[j]) < 0 {
                    j -= 1
                }else{
//                    arr.swapAt(i, j)
                    arrayList[i] = arrayList[j]
                    i += 1
                    swapCount += 1
                    //元素替换完,就跳出循环,从左往右判断--->
                    //swap(i, j)
                    break
                }
            }
            
            while i < j {
                //先判断左元素是否大于轴点元素,大于就进行就替换,小于就i++
                //--->
                if cmpValue(pivot, arrayList[i]) > 0 {
                    i += 1
                }else{
                    //元素替换完就跳出循环,然后又从右往左循环<---
                    //swap(i, j)
//                  arr.swapAt(i, j)
                    arrayList[j] = arrayList[i]
                    j -= 1
                    swapCount += 1
                    break
                }
            }
        }
        //最后吧轴点元素赋值给i或者j
        arrayList[i] = pivot
        return i
        
    }
    
}

// 优化版本
class QuickSort2: BaseSort
{
    
    override func sortAction() {
        //基准元素
        quickSort( 0, arrayList.count)
    }
    
    func quickSort(_ start:Int,_ end:Int){
        //分割成一个元素时就不需要在分割了
        if end - start < 2 {
            return
        }
        
        let pivot = pivotSort(start, end)
        quickSort( start, pivot)
        quickSort( pivot+1, end)
    }
    
    func pivotSort(_ start:Int,_ end:Int) -> Int{
        
        //轴点元素 轴点元素为随机
        //目的是使轴点元素尽量可以平均分 
        let random = Int(arc4random_uniform(UInt32(end-start)))+start
        arrayList.swapAt(start, random)
        let pivot = arrayList[start]
        
        var i = start
        var j = end
        j-=1
        while i < j {
            //先判断最右元素是否小于轴点元素,大于就进行j--,小于就替换<---
            while i < j {
                if cmpValue(pivot, arrayList[j]) < 0 {
                    j -= 1
                }else{
//                    arr.swapAt(i, j)
                    arrayList[i] = arrayList[j]
                    i += 1
                    swapCount += 1
                    //元素替换完,就跳出循环,从左往右判断--->
                    //swap(i, j)
                    break
                }
            }
            
            while i < j {
                //先判断左元素是否大于轴点元素,大于就进行就替换,小于就i++
                //--->
                if cmpValue(pivot, arrayList[i]) > 0 {
                    i += 1
                }else{
                    //元素替换完就跳出循环,然后又从右往左循环<---
                    //swap(i, j)
//                  arr.swapAt(i, j)
                    arrayList[j] = arrayList[i]
                    j -= 1
                    swapCount += 1
                    break
                }
            }
        }
        //最后吧轴点元素赋值给i或者j
        arrayList[i] = pivot
        return i
        
    }
    
}
