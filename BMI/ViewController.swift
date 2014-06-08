//
//  ViewController.swift
//  BMI
//
//  Created by Mac on 2014/6/7.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var heightField : UITextField
    @IBOutlet var weightField : UITextField
    @IBOutlet var valueLabel : UILabel
    @IBOutlet var catagoryLabel : UILabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    /*
    // conenct Action to storyboard keyboard end-editing
    @IBAction func keyboardDismiss(sender : AnyObject) {
        sender.resignFirstResponder()
    }
    */
    

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    
    @IBAction func calculateBMI(sender : AnyObject) {
        
        catagoryLabel.textColor = UIColor.blackColor()
        if ( validateNumber(weightField.text) && validateNumber(heightField.text) ){
            var wValue = (weightField.text as NSString).floatValue
            var hValue = (heightField.text as NSString).floatValue
            let newBMI = BMIKernel(weight: wValue,height: hValue)
            var (bmi,catagory) = newBMI.calculateBMI()
            valueLabel.text = String(NSString(format:"%.1f",bmi))
            catagoryLabel.text = catagory.responseString()
            catagoryLabel.textColor = catagory.responseColor()
        }
        else{
            valueLabel.text = "請重新輸入"
            catagoryLabel.text = ""
        }
       
    }

    func validateNumber(string:String)->Bool{
        let expression = "^([0-9]+)?(\\.([0-9]{1,2})?)?$"
        if ( string.isEmpty ) {
            return false
        }
        else{
            var regex = NSRegularExpression(pattern:expression,options: nil, error: nil)
            var numberOfMatches:Int = regex.numberOfMatchesInString(string,
                options: NSMatchingOptions.ReportCompletion,
                range: NSMakeRange(0, countElements(string)))
            return numberOfMatches != 0
        }
    }
}

