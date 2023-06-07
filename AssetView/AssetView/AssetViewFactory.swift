//
//  AssetViewFactory.swift
//  AssetView
//
//  Created by Ajay Choudhary on 07/06/23.
//

import Foundation

class AssetViewFactory {
    static func getAssetView(for viewModel: inout AssetViewModel) -> AssetView? {
        guard let type = viewModel.asset.mediaType else  { return nil }
        
        switch type {
        case .image:
            let imageAssetView = ImageAssetView(viewModel: viewModel)
            viewModel.viewActions = imageAssetView
            return imageAssetView
        case .lottie:
            return nil
        case .video:
            return nil
        }
    }
}
