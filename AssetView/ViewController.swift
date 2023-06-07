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
        viewModels = getViewModels()
        for viewModel in viewModels {
            if var viewModel = viewModel, let assetView = AssetViewFactory.getAssetView(for: &viewModel) {
                assetStackView.addArrangedSubview(assetView)
                assetStackView.setCustomSpacing(20.0, after: assetView)
            }
        }
    }
    
    func getViewModels() -> [AssetViewModel?] {
        // These assets can be fetched from a network service
        // The ViewModels should ideally be created from this viewController's viewModel once it fetches the assets.
        return LPAsset.assets.map { asset in
            switch asset.mediaType {
            case .image:
                let viewModel = ImageAssetViewModel(asset: asset)
                return viewModel
            case .lottie:
                let viewModel = LottieAssetViewModel(asset: asset)
                return viewModel
            case .video:
                return nil
            case .none:
                return nil
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

