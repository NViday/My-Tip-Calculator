//
//  PersonControl.swift
//  TheBill
//
//  Created by N'Vida Ange-Janine Yotcho on 12/26/15.
//  Copyright © 2015 N'Vida Ange-Janine Yotcho. All rights reserved.
//  Person Control is written in such way more avatar can be displayed 
//  on the the main view . 
//  But since I just needed one avatar, I just kept the functions 

import UIKit

class PersonControl: UIView {

    //MArk : properties
    
    
    var persons = [UIButton]()
    var numberOfPersons : Int ;
    
    let avatarImage  = UIImage(named: "person")
    
    
    
    //MARK initialization
    required init?(coder aDecoder: NSCoder) {
        numberOfPersons = 1
        super.init(coder: aDecoder)
        
        
        let PersonIcon = UIButton()
        PersonIcon.adjustsImageWhenHighlighted = false
        PersonIcon.setBackgroundImage(avatarImage, forState: .Normal)
        persons += [PersonIcon]
        addSubview(PersonIcon)
        
        
    }
    
    
    
    //To display properly the buttons
    
    override func layoutSubviews() {
        let buttonSize = Int ( frame.size.height)
        var buttonFrame = CGRectMake(0, 0, CGFloat(buttonSize ), CGFloat(buttonSize))
        
        //Offset each button's origin by the length of the button plud spacing
        
        //for each ...
        for(index, button) in persons.enumerate(){
            buttonFrame.origin.x = CGFloat(index * ( buttonSize + numberOfPersons))
            button.frame = buttonFrame
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + 3 ) * numberOfPersons
        
        return CGSize(width: width, height: buttonSize)
        
    }
}
