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
        

        /*
         <input type="checkbox">
         
         InputTag().getCheckBox(
         frame : CGRect,
         checked : Bool,
         backgroundColor : UIColor,
         color : UIColor,
         borderColor : UIColor,
         rectEdge : UIRectEdge
         )
         */
        
        var userActionClickNumber = 0
        let hintLbl = UILabel(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 100))
        hintLbl.textAlignment = .Center
        hintLbl.numberOfLines = 3
        hintLbl.font = UIFont(name: (hintLbl.font?.fontName)!, size: 12)
        self.view.addSubview(hintLbl)
        
        let checkBox1 = InputTag().getCheckBox(CGRect(x: 30, y: 150, width: 20, height: 20))
        let checkBox2 = InputTag().getCheckBox(CGRect(x: 60, y: 140, width: 40, height: 40), checked: true, backgroundColor: UIColor.lightGrayColor(), color: UIColor.redColor(), borderColor: UIColor.greenColor())
        let checkBox3 = InputTag().getCheckBox(CGRect(x: 110, y: 140, width: 30, height: 30), checked: true, rectEdge: .Top)
        let checkBox4 = InputTag().getCheckBox(CGRect(x: 150, y: 140, width: 30, height: 30), checked: true, rectEdge: .Right)
        let checkBox5 = InputTag().getCheckBox(CGRect(x: 190, y: 140, width: 30, height: 30), checked: true, rectEdge: .Left)
        let checkBox6 = InputTag().getCheckBox(CGRect(x: 230, y: 140, width: 30, height: 30), checked: true, rectEdge: .Bottom)
        
        self.view.addSubview(checkBox1)
        self.view.addSubview(checkBox2)
        self.view.addSubview(checkBox3)
        self.view.addSubview(checkBox4)
        self.view.addSubview(checkBox5)
        self.view.addSubview(checkBox6)
        
        
        
        //callback Function
        checkBox1.callBack { (_) in
            userActionClickNumber += 1
            hintLbl.text = "checkBox1 click - userActionClick = \(userActionClickNumber)"
        }
        checkBox2.callBack { (_) in
            userActionClickNumber += 1
            hintLbl.text = "checkBox2 click - userActionClick = \(userActionClickNumber)"
        }
        checkBox3.callBack { (_) in
            userActionClickNumber += 1
            hintLbl.text = "checkBox3 click - userActionClick = \(userActionClickNumber)"
        }
        checkBox4.callBack { (_) in
            userActionClickNumber += 1
            hintLbl.text = "checkBox4 click - userActionClick = \(userActionClickNumber)"
        }
        checkBox5.callBack { (_) in
            userActionClickNumber += 1
            hintLbl.text = "checkBox5 click - userActionClick = \(userActionClickNumber)"
        }
        checkBox6.callBack { (_) in
            userActionClickNumber += 1
            hintLbl.text = "checkBox6 click - userActionClick = \(userActionClickNumber)"
        }
        
        
        
        
        
        
        /*
         <input type="radio">
         
         InputTag().getRadio(
         frame : CGRect,
         name : String, 
         value : AnyObject, 
         selected : Bool, 
         backgroundColor : UIColor, 
         color : UIColor, 
         borderColor : UIColor, 
         rectEdge : UIRectEdge
         )
         */
        
        
        let radio1 = InputTag().getRadio(CGRect(x: 10, y: 190, width: 20, height: 20), name: "foo", value: "radio1", selected: true)
        let radio2 = InputTag().getRadio(CGRect(x: 40, y: 190, width: 30, height: 30), name: "foo", value: "radio2", selected: true, backgroundColor: UIColor.lightGrayColor(), color: UIColor.redColor(), borderColor: UIColor.greenColor())
        let radio3 = InputTag().getRadio(CGRect(x: 10, y: 240, width: 100, height: 40), name: "boo", value: 2048, selected: true, borderColor: UIColor.blueColor())
        let radio4 = InputTag().getRadio(CGRect(x: 60, y: 240, width: 40, height: 40), name: "boo", value: "bar", selected: true)
        let radio5 = InputTag().getRadio(CGRect(x: 110, y: 240, width: 40, height: 40), name: "boo", value: 3.141592, selected: true)
        let radio6 = InputTag().getRadio(CGRect(x: 160, y: 240, width: 40, height: 40), name: "boo", value: false, selected: true)
        
        self.view.addSubview(radio1)
        self.view.addSubview(radio2)
        self.view.addSubview(radio3)
        self.view.addSubview(radio4)
        self.view.addSubview(radio5)
        self.view.addSubview(radio6)
        
        InputTag.radioAdd(radio1)
        InputTag.radioAdd(radio2)
        InputTag.radioAdd(radio3)
        InputTag.radioAdd(radio4)
        InputTag.radioAdd(radio5)
        InputTag.radioAdd(radio6)
        
        radio1.callBack { (element) in
            userActionClickNumber += 1
            hintLbl.text = "radio1 click - userActionClick = \(userActionClickNumber)   radio[name]=\(element.name) / radio[value]=\(element.value)"
        }
        radio2.callBack { (element) in
            userActionClickNumber += 1
            hintLbl.text = "radio2 click - userActionClick = \(userActionClickNumber)   radio[name]=\(element.name) / radio[value]=\(element.value)"
        }
        radio3.callBack { (element) in
            userActionClickNumber += 1
            hintLbl.text = "radio3 click - userActionClick = \(userActionClickNumber)   radio[name]=\(element.name) / radio[value]=\(element.value)"
        }
        radio4.callBack { (element) in
            userActionClickNumber += 1
            hintLbl.text = "radio4 click - userActionClick = \(userActionClickNumber)   radio[name]=\(element.name) / radio[value]=\(element.value)"
        }
        radio5.callBack { (element) in
            userActionClickNumber += 1
            hintLbl.text = "radio5 click - userActionClick = \(userActionClickNumber)   radio[name]=\(element.name) / radio[value]=\(element.value)"
        }
        radio6.callBack { (element) in
            userActionClickNumber += 1
            hintLbl.text = "radio6 click - userActionClick = \(userActionClickNumber)   radio[name]=\(element.name) / radio[value]=\(element.value)"
        }
        
        
        
        /*
         <input type="button">
         
         InputTag().getButton(
         frame : CGRect,
         title : String,
         backgroundColor : UIColor,
         color : UIColor,
         borderColor : UIColor,
         borderWidth : CGFloat,
         borderRadius : CGFloat,
         rectEdge : UIRectEdge
         )
         */
        
        let button1 = InputTag().getButton(CGRect(x: 10, y: 300, width: 60, height: 30),title: "Test")
        let button2 = InputTag().getButton(CGRect(x: 160, y: 300, width: 100, height: 40), backgroundColor: UIColor.blueColor(), color: UIColor.redColor(), borderColor: UIColor.greenColor(), borderWidth: 7, borderRadius: 15)
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        button1.callBack { (_) in
            userActionClickNumber += 1
            hintLbl.text = "button1 click - userActionClick = \(userActionClickNumber)"
            button2.hidden = !button2.hidden
        }
        button2.callBack { (_) in
            userActionClickNumber += 1
            hintLbl.text = "button2 click - userActionClick = \(userActionClickNumber)"
            button1.hidden = !button1.hidden
        }
        
        
        /*
         <input type="text">
         
         InputTag().getButton(
         frame : CGRect,
         ctrl : UITextFieldDelegate,
         value : String,
         backgroundColor : UIColor,
         color : UIColor,
         borderColor : UIColor,
         borderWidth : CGFloat,
         borderRadius : CGFloat,
         rectEdge : UIRectEdge
         )
         */
        
        
        let text1 = InputTag().getText(CGRect(x: 10, y: 370, width: 200, height: 40), ctrl: self)
        let text2 = InputTag().getText(CGRect(x: 10, y: 420, width: 200, height: 40), ctrl: self, value: "foo", rectEdge: .Bottom)
        let text3 = InputTag().getText(CGRect(x: 10, y: 470, width: 200, height: 40), ctrl: self, backgroundColor: UIColor.lightGrayColor(), color: UIColor.redColor(), borderColor: UIColor.greenColor())
        self.view.addSubview(text1)
        self.view.addSubview(text2)
        self.view.addSubview(text3)
        text1.setPassword()
        text1.setLeftPadding()
        text1.setRightPadding()
        text1.maxLength(5)
        
        text1.callBack { (_) in
            userActionClickNumber += 1
            hintLbl.text = "text1 click - userActionClick = \(userActionClickNumber)"
        }
        text2.callBack { (_) in
            userActionClickNumber += 1
            hintLbl.text = "text2 click - userActionClick = \(userActionClickNumber)"
        }
        text3.callBack { (_) in
            userActionClickNumber += 1
            hintLbl.text = "text3 click - userActionClick = \(userActionClickNumber)"
        }
        text1.editCallback { (element) in
            hintLbl.text = element.text
        }
        text2.editCallback { (element) in
            hintLbl.text = element.text
        }
        text3.editCallback { (element) in
            hintLbl.text = element.text
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

