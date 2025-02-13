//
//  CalculatorModel.swift
//  Calculator-iOS17
//
//  Created by özge kurnaz on 9.02.2025.
//

import Foundation


class CalculatorModel{

    
    var currentNumber = "0"
    var storedNum = "0"
    var operation : String?
    
    func inputNumber(_ numTitle: String){
        if currentNumber == "0"{
            currentNumber = numTitle
        }else{
            currentNumber.append(numTitle)
        }
        
        
        
    }
    
    func inputOperation(_ oprtn: String){
        if ["+", "-", "×", "÷"].contains(oprtn){
            if operation != nil{
                currentNumber = calcResult()
            }
            storedNum = currentNumber
            currentNumber = ""
          
            operation = oprtn
        }
       
        
    }
    
    func calcResult()->String{
        guard let stored = Int(storedNum), let current = Int(currentNumber) else {return "hata"}
        
        switch operation{
        case "+":
            print(String(stored + current))
            return String(stored + current)
        case "-":
            return String(stored - current)
        case "×":
            return String(stored * current)
        case "÷":
            return current == 0 ? "Sıfıra bölünmez" : String(stored / current)
        default:
            return "hata"
        }
        
    }
    
    func clear(){
        currentNumber = "0"
        storedNum = ""
        operation = nil
        
    }
    
    
    
  
}
