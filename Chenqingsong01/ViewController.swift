//
//  ViewController.swift
//  Chenqingsong01
//
//  Created by mac on 2023/2/8.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var testLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "chenqingsong"
        return label
    }()
    
    lazy var testButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("button", for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(transText), for: .touchUpInside)
        return button
    }()
    
    lazy var newButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NewPage", for: .normal)
        button.setImage(UIImage(systemName: "arrowshape.right"), for: .normal)
        return button
    }()
    
    lazy var testSwitch: UISwitch = {
        let testSwitch = UISwitch()
        testSwitch.translatesAutoresizingMaskIntoConstraints = false
        return testSwitch
    }()
    
    lazy var testTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "input"
        textfield.borderStyle = .roundedRect
        
        textfield.addTarget(self, action: #selector(transTextfield), for: .valueChanged)
        return textfield
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "beidixiaoxiong"
        view.backgroundColor = .systemBackground
        
        setupUI()
        
        newButton.addTarget(self, action: #selector(newButtonPush), for: .touchUpInside)
    }
    
    
    func setupUI() {
        
        view.addSubview(testLabel)
        view.addSubview(testButton)
        view.addSubview(testSwitch)
        view.addSubview(testTextField)
        testTextField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(newButton)
        newButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testButton.widthAnchor.constraint(equalToConstant: 120),
            testButton.heightAnchor.constraint(equalToConstant: 44),
            testButton.topAnchor.constraint(equalTo: self.testLabel.bottomAnchor, constant: 20),
            
            testSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testSwitch.topAnchor.constraint(equalTo: self.testButton.bottomAnchor, constant: 20),
            
            testTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testTextField.widthAnchor.constraint(equalToConstant: 200),
            testTextField.heightAnchor.constraint(equalToConstant: 44),
            testTextField.topAnchor.constraint(equalTo: self.testSwitch.bottomAnchor, constant: 20),
            
            newButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newButton.widthAnchor.constraint(equalToConstant: 120),
            newButton.heightAnchor.constraint(equalToConstant: 44),
            newButton.topAnchor.constraint(equalTo: self.testTextField.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func transText() {
        self.testLabel.text = "hello chen"
    }
    
    @objc func transTextfield() {
        //testLabel.text = testTextField.text
    }
    
    @objc func newButtonPush() {
        //print("1223123")
        let vc = NewPageViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

