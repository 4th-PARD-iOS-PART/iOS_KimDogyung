//
//  PosterModel.swift
//  3rd_hw_KimDogyung
//
//  Created by 김도경 on 2024/09/26.
//

import UIKit

struct SearchModel{
    var image: String
    var title: String
}

extension SearchModel{
    
    static var modeling =
        [
         SearchModel(image: "landscape4", title: "Citation"),
         SearchModel(image: "landscape7", title: "Oloture"),
         SearchModel(image: "landscape2", title: "Teh Setup"),
         SearchModel(image: "landscape6", title: "Breaking Bad"),
         SearchModel(image: "landscape5", title: "The Governor"),
         SearchModel(image: "landscape3", title: "Your Excellency"),
        ]
    
}
