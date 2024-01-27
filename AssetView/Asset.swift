//
//  Asset.swift
//  AssetView
//
//  Created by Ajay Choudhary on 06/06/23.
//

import Foundation

enum AssetMediaType: String {
    case image
    case lottie
    case video
}

class Asset {
    var mediaType: AssetMediaType?
    var url: String?
    
    init(mediaType: AssetMediaType? = nil, url: String? = nil) {
        self.mediaType = mediaType
        self.url = url
    }
    
    static let assets: [Asset] = [
        Asset(
            mediaType: .image,
            url: "https://i.ibb.co/cxPpF6W/mac-graphic.jpg"
        ),
        
        Asset(
            mediaType: .lottie, 
            url: "https://lottie.host/acd47bb1-ca62-496a-b70b-31be26e21413/2fJsty7yCB.json"
        )
    ]
}
