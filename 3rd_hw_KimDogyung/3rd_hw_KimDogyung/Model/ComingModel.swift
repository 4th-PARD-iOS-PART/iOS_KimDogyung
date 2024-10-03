//
//  ComingModel.swift
//  3rd_hw_KimDogyung
//
//  Created by 김도경 on 2024/10/02.
//

import UIKit

struct ComingModel{
    var image: String
    var title: String
    var subTitle: String
    var description: String
    var tag: String
}

extension ComingModel{
    
    static var modeling =
        [
         ComingModel(image: "coming3", 
                     title: "Calstle & Calstle",
                     subTitle: "Season 1 Coming December 14",
                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam  enim non posuere pulvinar diam.",
                     tag: "Steamyn • Soapy • Slow • Burn • Suspenseful • Teen • Mystery"
                    ),
         ComingModel(image: "coming1",
                     title: "Tiny Pretty Things",
                     subTitle: "Season 1 Coming December 14",
                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam  enim non posuere pulvinar diam.",
                     tag: "Steamyn • Soapy • Slow • Burn • Suspenseful • Teen • Mystery"
                    ),
         ComingModel(image: "coming2",
                     title: "Faster",
                     subTitle: "Season 1 Coming December 14",
                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam  enim non posuere pulvinar diam.",
                     tag: "Steamyn • Soapy • Slow • Burn • Suspenseful • Teen • Mystery"
                    ),
        ]
    
}

