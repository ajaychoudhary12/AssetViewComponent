//
//  ImageAssetViewModel.swift
//  AssetView
//
//  Created by Ajay Choudhary on 06/06/23.
//

import UIKit

class ImageAssetViewModel: AssetViewModel {
    weak var viewActions: AssetViewActions?
    var placeholder: UIImage?
    
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
}
