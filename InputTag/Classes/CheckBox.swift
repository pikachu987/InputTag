//
//  CheckBox.swift
//  Input
//
//  Created by guanho on 2016. 6. 27..
//  Copyright © 2016년 guanho. All rights reserved.
//

public class CheckBox : UIButton{
    private let cornerRadius : CGFloat = 4
    private let borderWidth : CGFloat = 1
    private var borderLayer : CALayer!
    private var rectEdge : UIRectEdge!
    
    //Bool property
    public var isChecked: Bool = false {
        didSet{
            check()
        }
    }
    //UIColor property
    public var borderColor: UIColor = UIColor.blackColor(){
        didSet{
            border()
        }
    }
    
    convenience init(frame: CGRect, checked : Bool, backgroundColor : UIColor, color : UIColor, borderColor : UIColor, rectEdge: UIRectEdge){
        self.init()
        self.frame = frame
        self.rectEdge = rectEdge
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.setTitleColor(color, forState: .Normal)
        let width = self.frame.width
        let height = self.frame.height
        var size : CGFloat
        
        if width == height{
            size = width
        }else{
            if width > height{
                size = height
            }else{
                size = width
            }
            self.frame.size = CGSize(width: size, height: size)
        }
        
        
        self.titleLabel?.font = UIFont(descriptor: UIFontDescriptor(name: (self.titleLabel?.font.fontName)!, size: size), size: size)
        
        awakeFromNib()
        border()
        self.isChecked = checked
        check()
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
    
    //setCheck
    private func check(){
        if isChecked == true {
            self.setTitle("✓", forState: .Normal)
        } else {
            self.setTitle("", forState: .Normal)
        }
    }
    
    
    //callback
    private var callback : (CheckBox -> Void)!
    public func callBack(callback: (CheckBox -> Void)){
        self.callback = callback
        self.addTarget(self, action: #selector(self.click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    @objc private func click(sender: CheckBox) {
        self.callback(sender)
    }
    
    //checkAction
    override public func awakeFromNib() {
        self.addTarget(self, action: #selector(self.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    @objc private func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}