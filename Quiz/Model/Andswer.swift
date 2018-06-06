//
//  Andswer.swift
//  Quiz
//
//  Created by Anna on 06.06.2018.
//  Copyright © 2018 PWR. All rights reserved.
//

import Foundation

class Andswer {
    var qestionNumber: Int
    var number: Int
    var isCorret: Bool
    var isSelected: Bool
    var contet: String
    
    init(qestionNumber:Int, number:Int, isCorret:Bool, isSelected: Bool, contet: String){
        self.qestionNumber=qestionNumber
        self.number=number
        self.isCorret=isCorret
        self.isSelected=isSelected
        self.contet=contet
    }
    
    convenience init(){
        self.init(number: 1, isSelected: false, isCorret: false, contet: "")
    }
    
}
