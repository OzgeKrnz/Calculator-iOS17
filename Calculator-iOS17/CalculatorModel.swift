//
//  CalculatorModel.swift
//  Calculator-iOS17
//
//  Created by özge kurnaz on 9.02.2025.
//

import Foundation


class CalculatorModel{

    
    var currentNumber = Int()
    var previousNumber = Int()
    var operation = ["+","-","×","÷"]
    
    func inputNumber(_ num: Int){
        currentNumber = num
        
        
    }
    
    func inputOperation(_ oprtn: [String]){
        if operation.contains(oprtn){
            
        }
    }
}
