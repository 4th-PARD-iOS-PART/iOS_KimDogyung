//
//  SearchImageTableViewCell.swift
//  3rd_hw_KimDogyung
//
//  Created by 김도경 on 2024/10/02.
//

import UIKit

class SearchImageTableViewCell: UITableViewCell {
    static let identifier = "SearchImageTableViewCell"
    
    
    let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.72)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let imageButton: UIButton = {
        var button = UIButton(type: .custom)
        button.setImage(UIImage(named: "searchPlay"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.frame = CGRect(x: 0, y: 0, width: 28, height: 28) 이건 어따 쓰는 걸까
        return button
    }()
    
    func setUIForCell(){
        NSLayoutConstraint.activate([
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            cellImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellImageView.widthAnchor.constraint(equalToConstant: 146),
            cellImageView.heightAnchor.constraint(equalToConstant: 76),
            
            cellLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 7),
            //cellLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cellLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            imageButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            //imageButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 346.33),
            imageButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            imageButton.widthAnchor.constraint(equalToConstant: 28),
            imageButton.heightAnchor.constraint(equalToConstant: 28),
        ])
    }

    // init 은 어떤 함수?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1.0)
        
        
        contentView.addSubview(cellImageView)
        contentView.addSubview(cellLabel)
        contentView.addSubview(imageButton)
        
        setUIForCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 이게 뭐하는 함수?
    override func layoutSubviews() {
        super.layoutSubviews()
//        cellImageView.frame = contentView.bounds
//        cellLabel.frame = contentView.bounds
//        imageButton.frame = contentView.bounds
    }
    
    // cell에 image랑 title 전달
    public func configure(with model: SearchModel) {
        cellImageView.image = UIImage(named: model.image) // Set image from model
        cellLabel.text = model.title                      // Set title from model
    }
    
}
