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
        Asset(mediaType: .image, url: "https://picsum.photos/200"),
        Asset(mediaType: .lottie, url: "https://assets9.lottiefiles.com/packages/lf20_jyylm3x9.json")
    ]
}
