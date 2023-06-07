//
//  LPAsset.swift
//  AssetView
//
//  Created by Ajay Choudhary on 06/06/23.
//

import Foundation

enum LPAssetMediaType: String {
    case image
    case lottie
    case video
}

class LPAsset {
    var mediaType: LPAssetMediaType?
    var url: String?
    
    init(mediaType: LPAssetMediaType? = nil, url: String? = nil) {
        self.mediaType = mediaType
        self.url = url
    }
    
    static let assets: [LPAsset] = [
        LPAsset(mediaType: .image, url: "https://picsum.photos/200"),
        LPAsset(mediaType: .lottie, url: "https://assets9.lottiefiles.com/packages/lf20_jyylm3x9.json")
    ]
}
