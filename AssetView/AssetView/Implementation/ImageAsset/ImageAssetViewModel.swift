//
//  ImageAssetViewModel.swift
//  AssetView
//
//  Created by Ajay Choudhary on 06/06/23.
//

import UIKit

class ImageAssetViewModel: AssetViewModel {
    weak var viewActions: AssetViewActions?
    var delegate: AssetViewModelDelegate?
    var placeholderName: String?
    
    var asset: LPAsset {
        didSet {
            viewActions?.applyModel()
        }
    }
    
    init(
        asset: LPAsset,
        placeholderName: String? = nil,
        viewActions: AssetViewActions? = nil
    ) {
        self.placeholderName = placeholderName
        self.viewActions = viewActions
        self.asset = asset
    }
    
    func onAssetLoadingFailed() {
        delegate?.assetLoadedWith(success: false)
    }
    
    func onAssetLoadingSuccessful() {
        delegate?.assetLoadedWith(success: true)
    }
}
