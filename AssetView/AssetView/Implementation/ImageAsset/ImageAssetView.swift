//
//  ImageAssetView.swift
//  AssetView
//
//  Created by Ajay Choudhary on 06/06/23.
//

import UIKit
import Kingfisher

class ImageAssetView: UIView, AssetView {
    var viewModel: AssetViewModel
    
    init(viewModel: AssetViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyModel() {
        
    }
}
