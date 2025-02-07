//
//  ViewController.swift
//  Calculator-iOS17
//
//  Created by özge kurnaz on 7.02.2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    let buttons = ["AC","+/-","%","÷","7","8","9","x","4","5","6","-","1","2","3","+","0",".","="]
    
   
    
    
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(displayLabel)
        // Display View Auto Layout
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            displayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            displayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            displayLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        let zeroBtn = createButton(title: "0", action: #selector(numberPressed(_ :)))
        
        view.addSubview(zeroBtn)
        // Button Auto Layout
        zeroBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            zeroBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            zeroBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            //btn genişlik ve yükseklik
            zeroBtn.widthAnchor.constraint(equalToConstant: 80),
            zeroBtn.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        
        
        
        
    }
    
    @objc func numberPressed(_ sender: UIButton){
        if let number = sender.currentTitle{
            print("Basıldı: \(number)")
        }
    }
    
    func createButton(title: String, action:Selector)->UIButton{
        let button = UIButton(type: .system)
        button.backgroundColor = .darkGray
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 30
        
        //objc fonk cagırmak için
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
        
    }
    
    
   


}

#Preview{
    ViewController()
}

