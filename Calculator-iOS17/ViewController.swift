//
//  ViewController.swift
//  Calculator-iOS17
//
//  Created by özge kurnaz on 7.02.2025.
//

import UIKit

class ViewController: UIViewController {
    
    let calculatorView = CalculatorView()
    
    override func loadView() {
        view = calculatorView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

}

#Preview{
    ViewController()
}

