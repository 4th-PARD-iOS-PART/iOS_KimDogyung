//
//  FormViewController.swift
//  6th_hw_KimDogyung
//
//  Created by 김도경 on 2024/10/29.
//

import UIKit

class FormViewController:UIViewController {
    
    let partInput:UITextField = {
        let textField = UITextField()
        textField.placeholder = "파트를 입력해주세요."
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let nameInput:UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요."
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let ageInput:UITextField = {
        let textField = UITextField()
        textField.placeholder = "나이를 입력해주세요."
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    let addButton:UIButton = {
        var config = UIButton.Configuration.plain()
        config.title = "Add" // Correct way to set title with configuration
        config.buttonSize = .medium
        let button = UIButton(configuration: config)
        button.addTarget(self, action: #selector(addData), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Closure to notify ViewController of new data addition
    var onDataAdded: (() -> Void)?
    
    @objc func addData(){
        
        
        guard let name = nameInput.text, !name.isEmpty,
            let ageString = ageInput.text, let age = Int(ageString),
            let part = partInput.text, !part.isEmpty else {
            print("Invalid input")
            return
        }
        
        let newMember = Member(part: part, age: age, name: name)
        let apiService = APIService()
                
        guard let url = apiService.makeURL(endpoint: .user) else {
            print("Invalid URL")
            return
        }
        
        NetworkManager.shared.postRequest(url: url, body: newMember) { (result: Result<Member, Error>) in
            switch result {
            case .success(let data):
                print("Success: Data posted")
                
                DispatchQueue.main.async {
                    self.onDataAdded?() // Pass new member back
                    self.dismissViewController()
                }
            case .failure(let error):
                print("Error posting data:", error)
            }
        }
        

    }
    
    
    @objc func dismissViewController(){
        self.dismiss(animated: true)
    }
    
    func setUI(){
        view.addSubview(addButton)
        view.addSubview(partInput)
        view.addSubview(nameInput)
        view.addSubview(ageInput)
        
        NSLayoutConstraint.activate([
            nameInput.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            nameInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            nameInput.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            ageInput.topAnchor.constraint(equalTo: nameInput.bottomAnchor, constant: 8),
            ageInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            ageInput.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            partInput.topAnchor.constraint(equalTo: ageInput.bottomAnchor, constant: 8),
            partInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            partInput.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        setUI()
    }
    
}
