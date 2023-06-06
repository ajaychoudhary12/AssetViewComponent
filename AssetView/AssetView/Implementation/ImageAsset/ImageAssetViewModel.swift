//
//  ImageAssetViewModel.swift
//  AssetView
//
//  Created by Ajay Choudhary on 06/06/23.
//

import Foundation

class ImageAssetViewModel: AssetViewModel {
    weak var viewActions: AssetViewActions?
    
    var asset: LPAsset {
        didSet {
            viewActions?.applyModel()
        }
    }
    
    init(viewActions: AssetViewActions? = nil, asset: LPAsset) {
        self.viewActions = viewActions
        self.asset = asset
    }
}
