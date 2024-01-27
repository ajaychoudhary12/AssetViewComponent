//
//  AssetView.swift
//  AssetView
//
//  Created by Ajay Choudhary on 06/06/23.
//

import UIKit

protocol AssetViewModelDelegate {
    func assetLoadedWith(success: Bool)
}

protocol AssetViewModel {
    var viewActions: AssetViewActions? { get set }
    var asset: Asset { get set }
    var delegate: AssetViewModelDelegate? { get set }
    var placeholderName: String? { get set }
    
    func onAssetLoadingFailed()
    func onAssetLoadingSuccessful()
}

protocol AssetView: UIView {
    var viewModel: AssetViewModel { get }
}

protocol AssetViewActions: AssetView, AnyObject {
    func applyModel()
}
