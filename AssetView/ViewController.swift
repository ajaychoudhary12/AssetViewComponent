//
//  ViewController.swift
//  AssetView
//
//  Created by Ajay Choudhary on 06/06/23.
//

import UIKit

class ViewController: UIViewController {

    var viewModels: [AssetViewModel?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSubViews()
        layoutConstraints()
        setupAssets()
    }
    
    func layoutSubViews() {
        view.addSubview(assetStackView)
    }
    
    func layoutConstraints() {
        NSLayoutConstraint.activate([
            assetStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            assetStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            assetStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            assetStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupAssets() {
        for asset in LPAsset.assets {
            if let assetView = AssetViewFactory.getAssetView(asset: asset) {
                assetStackView.addArrangedSubview(assetView)
                assetStackView.setCustomSpacing(20.0, after: assetView)
            }
        }
    }
    
    // MARK: - UI Elements
    
    let assetStackView: UIStackView = {
        let stackView = UIStackView.init(frame: .zero)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
}

