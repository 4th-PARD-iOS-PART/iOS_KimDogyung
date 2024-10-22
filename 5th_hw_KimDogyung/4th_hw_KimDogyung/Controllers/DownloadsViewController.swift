//
//  DownloadsViewController.swift
//  3rd_hw_KimDogyung
//
//  Created by 김도경 on 2024/09/25.
//

import Foundation
import UIKit

class DownloadsViewController: UIViewController {
    
    private let downloadIconImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "downloadPage")
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    
    private let button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = UIColor.white
        config.title = "Find Something to Download"
        //config.titlePadding = 15
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 26, bottom: 12, trailing: 26)
        config.baseForegroundColor = .black
        
        
        
        let button = UIButton(configuration: config)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let label: UILabel = {
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.text = "Movies and TV shows that you download appear here.";
        label.font = .systemFont(ofSize: 19)
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(downloadIconImageView)
        view.addSubview(button)
        view.addSubview(label)
        
        setUIForIcon()
        setUIForLabel()
        setUIForButton()
    }
    
    func setUIForIcon() {
            NSLayoutConstraint.activate([
                downloadIconImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 204),
                downloadIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                downloadIconImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 110),
                
                downloadIconImageView.widthAnchor.constraint(equalToConstant: 194),
                downloadIconImageView.heightAnchor.constraint(equalToConstant: 194)
            ])
    }
    
    func setUIForLabel(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: downloadIconImageView.bottomAnchor, constant: 32),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            label.widthAnchor.constraint(equalToConstant: 295),
            //label.heightAnchor.constraint(equalToConstant: 46),
        ])
    }
    
    func setUIForButton(){
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 184),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 67),
            //button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -67),
        ])
    }
    
    
    
}
