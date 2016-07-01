//
//  Radio.swift
//  Input
//
//  Created by guanho on 2016. 6. 27..
//  Copyright © 2016년 guanho. All rights reserved.
//

public class Radio : UIButton{
    private var cornerRadius : CGFloat!
    private let borderWidth : CGFloat = 1
    private var borderLayer : CALayer!
    private var rectEdge : UIRectEdge!
    private var selectView : UIView!
    public var name : String!
    public var value : AnyObject!
    //Bool property
    public var isSelect: Bool = false {
        didSet{
            select()
        }
    }
    //UIColor property
    public var borderColor: UIColor = UIColor.blackColor(){
        didSet{
            border()
        }
    }
    
    convenience init(frame: CGRect, name: String, value: AnyObject, selected : Bool, backgroundColor : UIColor, color : UIColor, borderColor : UIColor, rectEdge: UIRectEdge){
        self.init()
        self.frame = frame
        self.name = name
        self.value = value
        self.rectEdge = rectEdge
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
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
        self.cornerRadius = 0.5*size
        
        let viewSize = size/2
        
        selectView = UIView(frame: CGRect(x: viewSize/2, y: viewSize/2, width: size-viewSize, height: size-viewSize))
        selectView.backgroundColor = color
        selectView.layer.cornerRadius = 0.5*(size-viewSize)
        self.addSubview(selectView)
        self.selectView.userInteractionEnabled = true
        self.selectView.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(self.viewClicked(_:))))
        
        awakeFromNib()
        border()
        self.isSelect = selected
        select()
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
    
    //setSelect
    private func select(){
        if isSelect == true {
            self.selectView.hidden = false
        } else{
            self.selectView.hidden = true
        }
    }
    
    
    //callback
    private var callback : (Radio -> Void)!
    public func callBack(callback: (Radio -> Void)){
        self.callback = callback
        self.addTarget(self, action: #selector(self.click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    @objc private func click(sender: Radio) {
        self.callback(sender)
    }
    
    //selectAction
    override public func awakeFromNib() {
        self.addTarget(self, action: #selector(self.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    @objc private func buttonClicked(sender: UIButton) {
        if sender == self {
            click()
        }
    }
    @objc private func viewClicked(sender: UIView) {
        click()
    }
    private func click(){
        let radioGroup = InputTag.getRadioGroup()
        for radioValue in radioGroup{
            if self.name == radioValue.name{
                radioValue.isSelect = false
            }
        }
        isSelect = !isSelect
    }
}