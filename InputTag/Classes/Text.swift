//
//  Text.swift
//  Input
//
//  Created by guanho on 2016. 6. 27..
//  Copyright © 2016년 guanho. All rights reserved.
//

public class Text : UITextField{
    private var cornerRadius : CGFloat!
    private var borderWidth : CGFloat!
    private var borderLayer : CALayer!
    private var rectEdge : UIRectEdge!
    private var maxLength : Int!
    //UIColor property
    public var borderColor: UIColor = UIColor.blackColor(){
        didSet{
            border()
        }
    }
    
    convenience init(frame: CGRect, ctrl : UITextFieldDelegate, value: String, backgroundColor : UIColor, color : UIColor, borderColor : UIColor, borderWidth : CGFloat, cornerRadius: CGFloat, rectEdge: UIRectEdge){
        self.init()
        self.delegate = ctrl
        self.frame = frame
        self.rectEdge = rectEdge
        self.backgroundColor = backgroundColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.text = value
        border()
        
        
    }
    
    //setBorder
    private func border(){
        if rectEdge == .All{
            self.layer.borderColor = borderColor.CGColor
            self.layer.cornerRadius = cornerRadius
            self.layer.borderWidth = borderWidth
        }else{
            borderLayer = CALayer()
            borderLayer.borderColor = borderColor.CGColor
            borderLayer.cornerRadius = cornerRadius
            borderLayer.borderWidth = borderWidth
            if rectEdge == .Top{
                borderLayer.frame = CGRect(x: 0, y: 0, width:  self.frame.size.width, height: borderWidth)
            }else if rectEdge == .Bottom{
                borderLayer.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width:  self.frame.size.width, height: borderWidth)
            }else if rectEdge == .Left{
                borderLayer.frame = CGRect(x: 0, y: 0, width: borderWidth, height: self.frame.size.height)
            }else if rectEdge == .Right{
                borderLayer.frame = CGRect(x: self.frame.size.width - borderWidth, y: 0, width: borderWidth, height: self.frame.size.height)
            }
            self.layer.masksToBounds = true
            self.layer.addSublayer(borderLayer)
        }
    }
    
    public func setPassword(){
        self.secureTextEntry = true
    }
    //padding
    public func setLeftPadding(padding : CGFloat = 10){
        self.leftView = UIView(frame: CGRectMake(0, 0, padding, self.frame.height))
        self.leftViewMode = UITextFieldViewMode.Always
    }
    public func setRightPadding(padding : CGFloat = 10){
        self.rightView = UIView(frame: CGRectMake(0, 0, padding, self.frame.height))
        self.rightViewMode = UITextFieldViewMode.Always
    }
    
    //maxLength
    public func maxLength(maxLength : Int){
        self.maxLength = maxLength
        self.addTarget(self, action: #selector(self.maxLengthFn(_:)), forControlEvents: .EditingChanged)
    }
    @objc private func maxLengthFn(sender: UITextField){
        if (self.text?.characters.count > maxLength) {
            self.deleteBackward()
        }
    }
    
    //callback
    private var callback : (Void -> Void)!
    public func callBack(callback: (Void -> Void)){
        self.callback = callback
        self.addTarget(self, action: #selector(self.click(_:)), forControlEvents: .TouchUpInside)
    }
    @objc private func click(sender: UITextField) {
        self.callback()
    }
}