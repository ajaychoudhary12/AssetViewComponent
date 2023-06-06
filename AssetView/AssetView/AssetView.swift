//
//  AssetView.swift
//  AssetView
//
//  Created by Ajay Choudhary on 06/06/23.
//

import UIKit

protocol AssetViewModel {
    var viewActions: AssetViewActions? { get set }
    var asset: LPAsset { get set }
}

protocol AssetView: AssetViewActions, UIView {
    var viewModel: AssetViewModel { get }
}

protocol AssetViewActions: AnyObject {
    func applyModel()
}
