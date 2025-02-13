//
//  ViewController.swift
//  Calculator-iOS17
//
//  Created by özge kurnaz on 7.02.2025.
//

import UIKit

class ViewController: UIViewController,CalculatorViewDelegate {
    
    let calculatorView = CalculatorView()
    let calculatorModel = CalculatorModel()
    

    override func loadView() {
        view = calculatorView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorView.delegate = self
        
    }
    
    func didTappedButton(_ title: String) {
        print("Basıldı: \(title)")
        calculatorModel.inputNumber(title)
    }
    

}

#Preview{
    ViewController()
}

