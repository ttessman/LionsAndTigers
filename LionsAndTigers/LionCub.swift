//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Tyler Tessmann on 2/9/15.
//  Copyright (c) 2015 tylerOtto. All rights reserved.
//

import Foundation

class LionCub: Lion {
    
    override func roar() {
        super.roar()
        
        println("LionCub: growl growl")
    }
    
    override func randomFact() -> String {
        var randomFactCub:String
        
        if isAlphaMale {
            randomFactCub = "Cubs are usually hidden in the dense bush for approximately six weeks."
        
        } else {
            randomFactCub = "Cubs begin eating meat at about the age of six weeks"
        }
        
        return randomFactCub
    }
    
}
