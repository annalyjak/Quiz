//
//  Question.swift
//  Quiz
//
//  Created by Anna on 07.06.2018.
//  Copyright © 2018 PWR. All rights reserved.
//

import Foundation

class Question {
    var contet: String
    var first: Andswer
    var second: Andswer
    var third: Andswer
    var fourth: Andswer
    
    init(contet: String, first: Andswer, second: Andswer, third: Andswer, fourth: Andswer){
        self.contet=contet
        self.first=first
        self.second=second
        self.third=third
        self.fourth=fourth
    }
    
    convenience init(){
        self.init(contet: "", first: Andswer.init(), second: Andswer.init(), third: Andswer.init(), fourth: Andswer.init())
    }
    
    func isCorrectAndswer() -> Bool {
        if((first.isCorret && first.isSelected) || (second.isCorret && second.isSelected) || (third.isCorret && third.isSelected) || (fourth.isCorret && fourth.isSelected)) {
            return true
        }
        return false
    }
}
