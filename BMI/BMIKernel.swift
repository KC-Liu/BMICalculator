//
//  BMIKernel.swift
//  BMI
//
//  Created by Mac on 2014/6/7.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

import Foundation
import UIKit

enum BMILevel{
    case Light, Normal, Over, Fat1, Fat2, Fat3
    func responseString() -> String {
        switch self{
        case Light: return "過輕"
        case Normal: return "正常"
        case Over: return "過重"
        case Fat1: return "輕度肥胖"
        case Fat2: return "中度肥胖"
        case Fat3: return "重度肥胖"
        }
    }
    func responseColor() -> UIColor{
        switch self{
        case Light: return UIColor.greenColor()
        case Fat1,Fat2,Fat3: return UIColor.redColor()
        default: return UIColor.blackColor()
        }
    }
}



struct BMIKernel{
    var weight:Float = 0.0 , height:Float = 0.0
    func calculateBMI() ->  (bmi:Float , catagory:BMILevel){
        var bmi:Float = 10000*self.weight/(self.height * self.height)
        var catagory:BMILevel
        if (bmi<18.5) {
            catagory = BMILevel.Light
        }
        else if(bmi<24){
            catagory = BMILevel.Normal
        }
        else if(bmi<27){
            catagory = BMILevel.Over
        }
        else if(bmi<30){
            catagory =  BMILevel.Fat1
        }
        else if(bmi<35){
            catagory = BMILevel.Fat2
        }
        else {
            catagory = BMILevel.Fat3
        }
        return (bmi,catagory)
    }
}