//
//  ComingTableViewCell.swift
//  3rd_hw_KimDogyung
//
//  Created by 김도경 on 2024/10/02.
//

import UIKit

class ComingTableViewCell: UITableViewCell {
    static let identifier = "ComingTableViewCell"
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true // 이건 멀까
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.66, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11.4)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11.14)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping // 단어기준 줄바꿈
        label.numberOfLines = 0 // 0으로 세팅시 allows a label to display an unlimited number of lines
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11.4, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let remindButton : UIButton = {
            var config = UIButton.Configuration.filled()
            config.background.backgroundColor = .clear
            config.imagePadding = 7
            config.imagePlacement = .top
        //let image = UIImage(named: "remind")
        //config.image = image
        
        // 아래 코드 이해 안됨 리뷰 필요
            if let image = UIImage(named: "remind"){
                let size = CGSize(width: 24, height: 24)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                config.image = scaledImage
            }
        
            var text = AttributedString.init("Remind me")
            text.foregroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        text.font = UIFont.systemFont(ofSize: 11.13)
            config.attributedTitle = text
            let button = UIButton(configuration: config)
        // 아래 두코드 넣으니 타이틀이 한 줄로 나오는데 다른 버튼에도 넣으면 다시 뭉개짐 한쪽 버튼에만 넣어야 됨 -> 대체 왜?
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
            button.titleLabel?.lineBreakMode = .byClipping
            button.setContentCompressionResistancePriority(.required, for: .horizontal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
    }()
    
    let sharedButton : UIButton = {
            var config = UIButton.Configuration.filled()
            config.background.backgroundColor = .clear
            config.imagePadding = 7
            config.imagePlacement = .top
        //let image = UIImage(named: "share")
        //config.image = image
            if let image = UIImage(named: "share"){
                let size = CGSize(width: 24, height: 24)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                config.image = scaledImage
            }
        
            var text = AttributedString.init("share")
            text.foregroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        text.font = UIFont.systemFont(ofSize: 11.13)
            config.attributedTitle = text
            let button = UIButton(configuration: config)
        
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.spacing = 45
            //stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        
        stackView.addArrangedSubview(remindButton)
        stackView.addArrangedSubview(sharedButton)
        
        contentView.addSubview(mainImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(tagLabel)
        contentView.addSubview(stackView)
        
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(){
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            // 아마도 비율 때문인거 같은데 높이를 충분히 안주면 width가 화면 양쪽으로 안참 이것도 추후 리뷰
            mainImageView.heightAnchor.constraint(equalToConstant: 220),
            
            
            
            stackView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 227),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22.17),
            
            
            subTitleLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 73),
            subTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.25),
            
            titleLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 13.13),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.25),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12.87),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.25),
            
            tagLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            tagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.25),
        ])
    }
    
    public func configure(with model: ComingModel) {
        mainImageView.image = UIImage(named: model.image)
        subTitleLabel.text = model.subTitle
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        tagLabel.text = model.tag
    }
    
}
