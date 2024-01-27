//
//  AssetViewFactory.swift
//  AssetView
//
//  Created by Ajay Choudhary on 07/06/23.
//

import Foundation

class AssetViewFactory {
    static func getAssetView(asset: Asset?, placeholderName: String? = nil) -> AssetView? {
        guard let asset = asset else { return nil }
        guard let type = asset.mediaType else  { return nil }
        
        switch type {
        case .image:
            let viewModel = ImageAssetViewModel(asset: asset)
            let imageAssetView = ImageAssetView(viewModel: viewModel)
            viewModel.viewActions = imageAssetView
            return imageAssetView
        case .lottie:
            let viewModel = LottieAssetViewModel(asset: asset)
            let lottieAssetView = LottieAssetView(viewModel: viewModel)
            viewModel.viewActions = lottieAssetView
            return lottieAssetView
        case .video:
            print("We do not support video media just yet!")
            return nil
        }
    }
}
