//
//  DetailHeaderUIView.swift
//  4th_hw_KimDogyung
//
//  Created by 김도경 on 2024/10/20.
//

import UIKit

protocol HeaderViewDelegate: AnyObject {
    func didTapBackButton()
}

class DetailHeaderUIView:UIView {
    
    weak var delegate: HeaderViewDelegate?
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "janggu")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let customBackButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "back"), for: .normal)
        
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let tvShareButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "tvShare"), for: .normal)
        
        //button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let topButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let playMainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "play-large")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    
    let neflixLogoIamgeView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let seriesLabel: UILabel = {
        let label = UILabel()
        let text = "SERIES"
            
        // Create an attributed string with the desired kerning (spacing)
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.kern, value: 2.5, range: NSRange(location: 0, length: text.count)) // Adjust the value for spacing
            
        label.attributedText = attributedString
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let logoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Selling Sunset"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let yearLabel:UILabel = {
        let label = UILabel()
        label.text = "2022"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let seasonsLabel:UILabel = {
        let label = UILabel()
        label.text = "5 Seasons"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let tvImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tvma")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let hdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hd")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let visionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "vision")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let adImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ad")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let playButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = UIColor.white
        config.title = "Play"
        if let image = UIImage(named: "play"){
            let size = CGSize(width: 18, height: 18)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            config.image = scaledImage
        }
        config.imagePadding = 8
        config.titlePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10)
        config.baseForegroundColor = .black
        
        let playButton = UIButton(configuration: config)
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()
    
    let downloadButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = UIColor(red: 44/255.0, green: 44/255.0, blue: 44/255.0, alpha: 1.0)
        config.title = "Download"
        if let image = UIImage(named: "detail_download") {
            let resizedImage = UIGraphicsImageRenderer(size: CGSize(width: 18, height: 18)).image { _ in
                image.draw(in: CGRect(origin: .zero, size: CGSize(width: 18, height: 18)))
            }
            config.image = resizedImage
        }
        config.imagePadding = 8
        config.titlePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10)
        config.baseForegroundColor = .gray
        
        let downloadButton = UIButton(configuration: config)
        downloadButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        return downloadButton
    }()
    
    let descriptionTitleLabel:UILabel = {
        let label = UILabel()
        label.text = "S5:E10 Nothing Remains The Same"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let descriptionLabel:UILabel = {
        let label = UILabel()
        label.text = "Hearts flip as Heather weds Tarek. Jason and Mary grapple with being ghosted. Go solo or take the next step: The agents face life-changing decisions."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let myListButton : UIButton = {
            var config = UIButton.Configuration.filled()
            config.background.backgroundColor = .clear
            config.imagePadding = 6
            config.imagePlacement = .top
            if let image = UIImage(named: "plus"){
                let size = CGSize(width: 24, height: 24)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                config.image = scaledImage
            }
            var text = AttributedString.init("My List")
            text.foregroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            text.font = UIFont.systemFont(ofSize: 10 , weight: .light)
            config.attributedTitle = text
            let button = UIButton(configuration: config)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
            
    }()
    
    let rateButton : UIButton = {
            var config = UIButton.Configuration.filled()
            config.background.backgroundColor = .clear
            config.imagePadding = 6
            config.imagePlacement = .top
            if let image = UIImage(named: "rate"){
                let size = CGSize(width: 26, height: 26)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                config.image = scaledImage
            }
            var text = AttributedString.init("Rate")
            text.foregroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            text.font = UIFont.systemFont(ofSize: 10 , weight: .light)
            config.attributedTitle = text
            let button = UIButton(configuration: config)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
            
    }()
    
    
    
    let shareButton : UIButton = {
            var config = UIButton.Configuration.filled()
            config.background.backgroundColor = .clear
            config.imagePadding = 6
            config.imagePlacement = .top
            if let image = UIImage(named: "share-air"){
                let size = CGSize(width: 24, height: 24)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                config.image = scaledImage
            }
            var text = AttributedString.init("Share")
            text.foregroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            text.font = UIFont.systemFont(ofSize: 10 , weight: .light)
            config.attributedTitle = text
            let button = UIButton(configuration: config)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
    }()
    
    let buttonStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 63
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let redBox:UIView = {
        let box = CGRect(x: 0, y: 0, width: 56, height: 4)
        let redBox = UIView(frame: box)
        redBox.backgroundColor = .red
        redBox.translatesAutoresizingMaskIntoConstraints = false
        return redBox
    }()
    
    let episodesLabel: UILabel = {
        let label = UILabel()
        label.text = "Episodes"
        label.numberOfLines = 1
        
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let collectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Collection"
        label.numberOfLines = 1
        
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let moreLabel: UILabel = {
        let label = UILabel()
        label.text = "More Like This"
        label.numberOfLines = 1
        
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let trailersLabel: UILabel = {
        let label = UILabel()
        label.text = "Trailers & More"
        label.numberOfLines = 1
        
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let tapStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let seasonLabel:UILabel = {
        let label = UILabel()
        label.text = "Season 5"
        label.numberOfLines = 1
        
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let seasonButton : UIButton = {
        
            var config = UIButton.Configuration.filled()
            config.background.backgroundColor = .clear
            config.imagePadding = 6
        config.imagePlacement = .trailing
            if let image = UIImage(named: "chevron-down"){
                let size = CGSize(width: 16, height: 16)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                config.image = scaledImage
            }
        //config.imagePadding = 8
        //config.titlePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            var text = AttributedString.init("Season 5")
            text.foregroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            text.font = UIFont.systemFont(ofSize: 12 , weight: .light)
            config.attributedTitle = text
            let button = UIButton(configuration: config)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
            
    }()
    
    
    func setupHeaderView(){
        self.backgroundColor = .black
        
        mainImageView.addSubview(playMainImageView)
        self.addSubview(mainImageView)
        topButtonStackView.addArrangedSubview(tvShareButton)
        topButtonStackView.addArrangedSubview(customBackButton)
        self.addSubview(topButtonStackView)
        
        logoStackView.addArrangedSubview(neflixLogoIamgeView)
        logoStackView.addArrangedSubview(seriesLabel)
        self.addSubview(logoStackView)
        
        self.addSubview(titleLabel)
        
        titleStackView.addArrangedSubview(yearLabel)
        titleStackView.addArrangedSubview(tvImageView)
        titleStackView.addArrangedSubview(seasonsLabel)
        titleStackView.addArrangedSubview(visionImageView)
        titleStackView.addArrangedSubview(hdImageView)
        self.addSubview(titleStackView)
        self.addSubview(playButton)
        self.addSubview(downloadButton)
        self.addSubview(descriptionTitleLabel)
        self.addSubview(descriptionLabel)
        
        buttonStackView.addArrangedSubview(myListButton)
        buttonStackView.addArrangedSubview(rateButton)
        buttonStackView.addArrangedSubview(shareButton)
        self.addSubview(buttonStackView)
        
        self.addSubview(redBox)
        
        tapStackView.addArrangedSubview(episodesLabel)
        tapStackView.addArrangedSubview(collectionLabel)
        tapStackView.addArrangedSubview(moreLabel)
        tapStackView.addArrangedSubview(trailersLabel)
        self.addSubview(tapStackView)
        self.addSubview(seasonButton)
        
        NSLayoutConstraint.activate([
            
            topButtonStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topButtonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 295),
            topButtonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            customBackButton.widthAnchor.constraint(equalToConstant: 28),
            customBackButton.heightAnchor.constraint(equalToConstant: 28),
            tvShareButton.widthAnchor.constraint(equalToConstant: 28),
            tvShareButton.heightAnchor.constraint(equalToConstant: 28),
            
            mainImageView.topAnchor.constraint(equalTo: self.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainImageView.widthAnchor.constraint(equalTo: mainImageView.heightAnchor, multiplier: 4 / 3),

            //mainImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0),
            //mainImageView.heightAnchor.constraint(equalTo: mainImageView.widthAnchor, multiplier: 0.75), // Maintain aspect ratio of 4:3
            
            playMainImageView.centerXAnchor.constraint(equalTo: mainImageView.centerXAnchor),
            playMainImageView.centerYAnchor.constraint(equalTo: mainImageView.centerYAnchor),
            playMainImageView.widthAnchor.constraint(equalToConstant: 54),
            playMainImageView.heightAnchor.constraint(equalToConstant: 54),
            
            neflixLogoIamgeView.widthAnchor.constraint(equalToConstant: 21),
            neflixLogoIamgeView.heightAnchor.constraint(equalToConstant: 28),
//            neflixLogoIamgeView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            logoStackView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 11),
            logoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            logoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            titleLabel.topAnchor.constraint(equalTo: logoStackView.bottomAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            
            tvImageView.widthAnchor.constraint(equalToConstant: 30),
            tvImageView.heightAnchor.constraint(equalToConstant: 14),
            
            visionImageView.widthAnchor.constraint(equalToConstant: 50),
            visionImageView.heightAnchor.constraint(equalToConstant: 14),
            
            hdImageView.widthAnchor.constraint(equalToConstant: 17),
            hdImageView.heightAnchor.constraint(equalToConstant: 14),
            
            adImageView.widthAnchor.constraint(equalToConstant: 24),
            adImageView.heightAnchor.constraint(equalToConstant: 14),
            
            titleStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 9.5),
            titleStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            // trailingAnchor 적용시 스택 내부의 요소들이 늘어나서 배치됨
            //titleStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            
            playButton.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 11),
            playButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            playButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            downloadButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 8),
            downloadButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            downloadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: downloadButton.bottomAnchor, constant: 14),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            buttonStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 31),
            // trailingAnchor 적용시 스택 내부의 요소들이 늘어나서 배치됨
            //buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            redBox.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 36),
            redBox.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            redBox.widthAnchor.constraint(equalToConstant: 56),
            redBox.heightAnchor.constraint(equalToConstant: 4),
            
            
            tapStackView.topAnchor.constraint(equalTo: redBox.bottomAnchor, constant: 12),
            tapStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            tapStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            seasonButton.topAnchor.constraint(equalTo: tapStackView.bottomAnchor, constant: 30.5),
            seasonButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            
        ])
        
    }
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupHeaderView()
    }

    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func backButtonTapped() {
        // Notify the delegate when the back button is tapped
        delegate?.didTapBackButton()
    }
    
}
