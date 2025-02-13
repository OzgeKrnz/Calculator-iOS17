//
//  CalculatorView.swift
//  Calculator-iOS17
//
//  Created by özge kurnaz on 7.02.2025.
//

import UIKit

protocol CalculatorViewDelegate: AnyObject{
    func didTappedButton(_ title:String)
}

class CalculatorView: UIView{
    weak var delegate: CalculatorViewDelegate?
    
    let model = CalculatorModel()
    
    var stackView = UIStackView()
    var rowStack = UIStackView()
    
    let displayLabel: UILabel = {
        
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 50, weight: .light)
        label.textAlignment = .right
        label.textColor = .white
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let buttons = ["AC","+/-","%","÷",
                   "7","8","9","×","4",
                   "5","6","-","1","2",
                   "3","+","0",".","="]
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        backgroundColor = .black
        addSubview(displayLabel)
        
        // Display View Auto Layout
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            displayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            displayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            displayLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
        setupButtons()
    }
    
    private func setupButtons(){
        
        //Stack View
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
        
        // satırları ayarlama
        rowStack.axis = .horizontal
        rowStack.spacing = 10
        rowStack.distribution = .fillEqually
        
        for (index ,buttonTitle) in buttons.enumerated() {
            let button = createButton(title: buttonTitle)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

            rowStack.addArrangedSubview(button)
            
            if (index + 1) % 4 == 0 {
                stackView.addArrangedSubview(rowStack)
                rowStack = UIStackView()
                rowStack.axis = .horizontal
                rowStack.spacing = 10
                rowStack.distribution = .fillEqually
            }
         
        }
        if !rowStack.arrangedSubviews.isEmpty {
            stackView.addArrangedSubview(rowStack)
        }
 
    }
    
    func createButton(title: String)->UIButton{
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.setTitleColor(.white, for: .normal)
        
        let buttonColor: UIColor
           if ["÷", "×", "-", "+", "="].contains(title) {
               buttonColor = .orange
           } else if ["AC", "+/-", "%"].contains(title) {
               buttonColor = .lightGray
           } else {
               buttonColor = .darkGray
           }
        button.backgroundColor = buttonColor
        button.layer.cornerRadius = 30
        
        
        return button
        
    }
    
    
    @objc func buttonTapped(_ sender: UIButton){
        guard let title = sender.currentTitle else{return}
        delegate?.didTappedButton(title)
        
        
        if ["0","1","2","3","4","5","6","7","8","9"].contains(title){
            model.inputNumber(title)
        } else if ["+", "-", "×", "÷"].contains(title){
            model.inputOperation(title)
        }else if title == "=" {
            model.currentNumber = model.calcResult()
            model.storedNum = ""
            model.operation = nil
        }
        else if ["AC"].contains(title){
            model.clear()
            displayLabel.text = "0"
        }
        
        updateDisplay()
        
        
        
    }
    
    private func updateDisplay(){
        if let operation = model.operation{
            displayLabel.text = "\(model.storedNum) \(operation) \(model.currentNumber)"
            
        }else{
            displayLabel.text = model.currentNumber
        }
    }
    
 
    

}
