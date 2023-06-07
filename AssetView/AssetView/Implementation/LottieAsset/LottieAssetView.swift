//
//  LottieAssetView.swift
//  AssetView
//
//  Created by Ajay Choudhary on 07/06/23.
//

import UIKit
import Lottie

class LottieAssetView: UIView, AssetView {
    var viewModel: AssetViewModel
    
    required init(viewModel: AssetViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyModel() {
        
    }
}
