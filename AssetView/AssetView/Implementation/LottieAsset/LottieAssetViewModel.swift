//
//  LottieAssetViewModel.swift
//  AssetView
//
//  Created by Ajay Choudhary on 07/06/23.
//

import UIKit

class LottieAssetViewModel: AssetViewModel {
    weak var viewActions: AssetViewActions?
    var delegate: AssetViewModelDelegate?
    var placeholderName: String?
    
    var asset: Asset {
        didSet {
            viewActions?.applyModel()
        }
    }
    
    init(
        asset: Asset,
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
