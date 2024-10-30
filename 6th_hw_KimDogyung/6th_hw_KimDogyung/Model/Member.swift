//
//  Member.swift
//  6th_hw_KimDogyung
//
//  Created by 김도경 on 2024/10/28.
//

import UIKit

struct Member: Codable {
    var part: String;
    var age: Int;
    var name: String;
}

extension Member{
    static var modeling = [
        Member(part: "iOS", age: 25, name: "Kim"),
        Member(part: "iOS", age: 25, name: "lee"),
    ]
    
}
