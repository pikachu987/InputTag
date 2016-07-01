//
//  Button.swift
//  Input
//
//  Created by guanho on 2016. 6. 27..
//  Copyright © 2016년 guanho. All rights reserved.
//

public class Button : UIButton{
    private var cornerRadius : CGFloat!
    private var borderWidth : CGFloat!
    private var borderLayer : CALayer!
    private var rectEdge : UIRectEdge!
    
    //UIColor property
    public var borderColor: UIColor = UIColor.blackColor(){
        didSet{
            border()
        }
    }
    
    convenience init(frame: CGRect, title: String, backgroundColor : UIColor, color : UIColor, borderColor : UIColor, borderWidth : CGFloat, borderRadius : CGFloat, rectEdge: UIRectEdge){
        self.init()
        self.frame = frame
        self.rectEdge = rectEdge
        self.setTitle(title, forState: .Normal)
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = borderRadius
        self.setTitleColor(color, forState: .Normal)
        border()
    }
    convenience init(frame: CGRect, named: String){
        self.init()
        self.frame = frame
        self.setImage(UIImage(named: named), forState: .Normal)
    }
    convenience init(frame: CGRect, image: UIImage){
        self.init()
        self.frame = frame
        self.setImage(image, forState: .Normal)
    }
    
    
    //setBorder
    private func border(){
        if rectEdge != nil{
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
    }
    
    
    //callback
    private var callback : (Button -> Void)!
    public func callBack(callback: (Button -> Void)){
        self.callback = callback
        self.addTarget(self, action: #selector(self.click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    @objc private func click(sender: Button) {
        self.callback(sender)
    }
}
