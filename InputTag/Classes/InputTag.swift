//
//  Input.swift
//  Input
//
//  Created by guanho on 2016. 6. 27..
//  Copyright © 2016년 guanho. All rights reserved.
//

public class InputTag{
    public init(){
        
    }
    private static var radioGroup : Array<Radio> = Array<Radio>()
    
    public static func getRadioGroup() -> Array<Radio>{
        return radioGroup
    }
    public static func radioAdd(radio: Radio){
        if radio.isSelect == true{
            let radioGroup = InputTag.getRadioGroup()
            for radioValue in radioGroup{
                if radio.name == radioValue.name{
                    radioValue.isSelect = false
                }
            }
        }
        radioGroup.append(radio)
    }
    
    public func getText(frame: CGRect, ctrl: UITextFieldDelegate, value: String = "", backgroundColor: UIColor = UIColor.whiteColor(), color: UIColor = UIColor.blackColor(), borderColor: UIColor = UIColor.blackColor(), borderWidth: CGFloat = 1, cornerRadius:CGFloat = 0, rectEdge: UIRectEdge = .All) -> Text {
        return Text(frame: frame, ctrl: ctrl, value: value, backgroundColor: backgroundColor, color: color, borderColor: borderColor, borderWidth: borderWidth, cornerRadius: cornerRadius, rectEdge: rectEdge)
    }
    
    
    public func getButton(frame: CGRect, title: String = "", backgroundColor: UIColor = UIColor.lightGrayColor(), color: UIColor = UIColor.blackColor(), borderColor: UIColor = UIColor.lightGrayColor(), borderWidth: CGFloat = 1, borderRadius: CGFloat = 0, rectEdge: UIRectEdge = .All) -> Button{
        return Button(frame: frame, title: title, backgroundColor: backgroundColor, color: color, borderColor: borderColor, borderWidth: borderWidth, borderRadius: borderRadius, rectEdge: rectEdge)
    }
    public func getButton(frame: CGRect, named: String) -> Button{
        return Button(frame: frame, named: named)
    }
    public func getButton(frame: CGRect, image: UIImage) -> Button{
        return Button(frame: frame, image: image)
    }
    public func getCheckBox(frame: CGRect, checked : Bool = false, backgroundColor : UIColor = UIColor.whiteColor(), color : UIColor = UIColor.blackColor(), borderColor : UIColor = UIColor.grayColor(), rectEdge : UIRectEdge = UIRectEdge.All) -> CheckBox{
        return CheckBox(frame: frame, checked: checked, backgroundColor: backgroundColor, color: color, borderColor: borderColor, rectEdge: rectEdge)
    }
    public func getRadio(frame: CGRect, name: String, value: AnyObject, selected : Bool = false, backgroundColor : UIColor = UIColor.whiteColor(), color : UIColor = UIColor.blackColor(), borderColor : UIColor = UIColor.grayColor(), rectEdge : UIRectEdge = UIRectEdge.All) -> Radio{
        return Radio(frame: frame, name: name, value: value, selected: selected, backgroundColor: backgroundColor, color: color, borderColor: borderColor, rectEdge: rectEdge)
    }
    
}