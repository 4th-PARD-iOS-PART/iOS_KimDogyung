//
//  HomeTableViewCell.swift
//  6th_hw_KimDogyung
//
//  Created by 김도경 on 2024/10/28.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier = "HomeTableViewCell"
    
    let partLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setUI(){
        contentView.addSubview(partLabel)
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            partLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            partLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            partLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: partLabel.trailingAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
        
    }
    
    
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: Member) {
        partLabel.text = "[\(model.part)]"
        nameLabel.text = model.name
    }
}
