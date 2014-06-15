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
    var weight:Float = 0.0 , height:Float = 1.0
    func calculateBMI() ->  (bmi:Float , catagory:BMILevel){
        var bmi:Float = 0
        if ( self.height>0 && self.weight>=0 ){
            bmi = 10000*self.weight/(self.height * self.height)
        }
        var catagory:BMILevel
        
        switch bmi{
        case 0..18.5:
            catagory = BMILevel.Light
        case 18.5..24:
            catagory = BMILevel.Normal
        case 24..27:
            catagory = BMILevel.Over
        case 27..30:
            catagory =  BMILevel.Fat1
        case 30..35:
            catagory = BMILevel.Fat2
        default:
            catagory = BMILevel.Fat3
        }
        return (bmi,catagory)
    }
}