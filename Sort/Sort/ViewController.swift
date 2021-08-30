//
//  ViewController.swift
//  Sort
//
//  Created by slowdony on 2021/8/27.
//

import UIKit
/**
 原地算法
 不依赖额外的资源或者依赖少数的额外资源,仅靠输出来覆盖输入
 控件复杂度为O(1)的都可以认为是原地算法
 
 非原地算法 : Not-in-place 或 Out-in-place
 原地算法:In-place
 
 时间复杂度:
 空间复杂度:
 
 稳定性:
 
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let randomArr = BaseSort.createRandom(count: 1000, min: 0, max: 30)
        let sortArr = BaseSort.careatSort(min: 0, max: 10)
        BaseSort.testSorts(array: randomArr,QuickSort2(),SelectionSort(),HeapSort(),InversionSort(),InversionSort1(),InversionSort2())
    }
}

