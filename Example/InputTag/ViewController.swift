//
//  ViewController.swift
//  InputTag
//
//  Created by pikachu987 on 07/01/2016.
//  Copyright (c) 2016 pikachu987. All rights reserved.
//

import UIKit
import InputTag

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //input type = checkbox
        
        
        //frame : CGRect, ctrl : UIViewController, checked : Bool, backgroundColor : UIColor, color : UIColor, borderColor : UIColor, rectEdge : UIRectEdge
        
        
        let checkBox1 = InputTag().getCheckBox(CGRect(x: 10, y: 30, width: 20, height: 20))
        self.view.addSubview(checkBox1)
        
        
        //callback Function
        
        
        checkBox1.callBack { (_) in print("click : (checkBox1.isChecked)") }
        
        let checkBox2 = InputTag().getCheckBox(CGRect(x: 40, y: 30, width: 40, height: 40), checked: true, backgroundColor: UIColor.lightGrayColor(), color: UIColor.redColor(), borderColor: UIColor.greenColor())
        self.view.addSubview(checkBox2)
        
        let checkBox3 = InputTag().getCheckBox(CGRect(x: 90, y: 30, width: 40, height: 40), checked: true, rectEdge: .Bottom)
        self.view.addSubview(checkBox3)
        
        //input type = checkbox
        
        
        //frame : CGRect, ctrl : UIViewController, name : String, value : AnyObject, selected : Bool, backgroundColor : UIColor, color : UIColor, borderColor : UIColor, rectEdge : UIRectEdge
        
        
        let radio1 = InputTag().getRadio(CGRect(x: 10, y: 80, width: 20, height: 20), name: "aa", value: "aa1", selected: true)
        self.view.addSubview(radio1)
        radio1.callBack { (_) in print("hey") }
        let radio2 = InputTag().getRadio(CGRect(x: 40, y: 80, width: 30, height: 60), name: "aa", value: "aa2", selected: true, backgroundColor: UIColor.lightGrayColor(), color: UIColor.redColor(), borderColor: UIColor.greenColor())
        self.view.addSubview(radio2)
        
        let radio3 = InputTag().getRadio(CGRect(x: 80, y: 80, width: 100, height: 15), name: "bb", value: "aa3", selected: true, rectEdge: .Bottom)
        self.view.addSubview(radio3)
        
        InputTag.radioAdd(radio1)
        InputTag.radioAdd(radio3)
        InputTag.radioAdd(radio2)
        
        let button1 = InputTag().getButton(CGRect(x: 10, y: 160, width: 60, height: 30),title: "Test")
        self.view.addSubview(button1)
        button1.callBack { (_) in print("button1Clicked") }
        
        let button2 = InputTag().getButton(CGRect(x: 160, y: 160, width: 100, height: 40), backgroundColor: UIColor.blueColor(), color: UIColor.redColor(), borderColor: UIColor.greenColor(), borderWidth: 7, borderRadius: 15)
        self.view.addSubview(button2)
        button2.callBack { (_) in print("button2Clicked") }
        
        let text1 = InputTag().getText(CGRect(x: 10, y: 210, width: 200, height: 40), ctrl: self)
        self.view.addSubview(text1)
        text1.setPassword()
        text1.setLeftPadding()
        text1.setRightPadding()
        text1.maxLength(5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

