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
}
