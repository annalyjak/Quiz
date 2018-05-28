//
//  Information.swift
//  Quiz
//
//  Created by Anna on 28.05.2018.
//  Copyright © 2018 PWR. All rights reserved.
//

import Foundation

class Information {
    var number: Int
    var image: String
    var textInfo: String
    
    init(number:Int, image:String, textInfo: String){
        self.number=number
        self.image=image
        self.textInfo=textInfo
    }
    
    convenience init(){
        self.init(number: 1, image: "", textInfo: "")
    }
    
}
