//
//  LottieAssetViewModel.swift
//  AssetView
//
//  Created by Ajay Choudhary on 07/06/23.
//

import UIKit

class LottieAssetViewModel: AssetViewModel {
    weak var viewActions: AssetViewActions?
    var placeholder: UIImage?
    var delegate: AssetViewModelDelegate?
    
    var asset: LPAsset {
        didSet {
            viewActions?.applyModel()
        }
    }
    
    init(
        viewActions: AssetViewActions? = nil,
        placeholder: UIImage? = nil,
        asset: LPAsset
    ) {
        self.viewActions = viewActions
        self.asset = asset
        self.placeholder = placeholder
    }
    
    func assetLoadingFailed() {
        delegate?.assetLoadedWith(success: false)
    }
    
    func assetLoadingSucceded() {
        delegate?.assetLoadedWith(success: true)
    }
}
