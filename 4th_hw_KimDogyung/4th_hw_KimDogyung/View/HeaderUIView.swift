//
//  HeaderUIView.swift
//  3rd_hw_KimDogyung
//
//  Created by 김도경 on 2024/09/26.
//

import UIKit

class HeaderUIView: UIView{
    
    let playButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = UIColor.lightGray
        config.title = "Play"
        config.image = UIImage(named: "play")
        config.imagePadding = 15
        config.titlePadding = 15
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        config.baseForegroundColor = .black
        
        let playButton = UIButton(configuration: config)
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 20.46, weight: .bold)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()
    
    let myListButton : UIButton = {
            var config = UIButton.Configuration.filled()
            config.background.backgroundColor = .clear
            config.imagePadding = 6
            config.imagePlacement = .top
            if let image = UIImage(named: "plus"){
                let size = CGSize(width: 26, height: 26)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                config.image = scaledImage
            }
            var text = AttributedString.init("My List")
            text.foregroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            text.font = UIFont.systemFont(ofSize: 15 , weight: .light)
            config.attributedTitle = text
            let button = UIButton(configuration: config)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
            
        }()
    
    let infoButton : UIButton = {
            var config = UIButton.Configuration.filled()
            config.background.backgroundColor = .clear
            config.imagePadding = 6
            config.imagePlacement = .top
            if let image = UIImage(named: "info"){
                let size = CGSize(width: 26, height: 26)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                config.image = scaledImage
            }
            var text = AttributedString.init("Info")
            text.foregroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            text.font = UIFont.systemFont(ofSize: 14 , weight: .light)
            config.attributedTitle = text
            let button = UIButton(configuration: config)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "movie6")
        return imageView
    }()
    
    func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            //UIColor.systemBackground.cgColor
            UIColor.black.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
        
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.addSubview(headerImageView)
        addGradient()
       
        self.addSubview(myListButton)
        self.addSubview(playButton)
        self.addSubview(infoButton)
        
        applyConstraints()
    }
    
    func applyConstraints(){
        
        NSLayoutConstraint.activate([

            
            myListButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 52),
            myListButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 380),
                    
            playButton.widthAnchor.constraint(equalToConstant: 134),
            playButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 380),
            playButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                        
            infoButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 380),
            infoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerImageView.frame = bounds
        if let parentView = superview {
                    headerImageView.frame = CGRect(x: 0, y: -parentView.safeAreaInsets.top, width: bounds.width, height: bounds.height + parentView.safeAreaInsets.top)
                }
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
}
