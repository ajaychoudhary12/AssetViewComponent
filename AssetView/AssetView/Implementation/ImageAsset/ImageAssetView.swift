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
    
    func layoutViews() {
        addSubview(imageView)
    }
    
    func layoutConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func applyModel() {
//        setImage(viewModel.asset.url, placeholder: viewModel.placeholder)
    }
    
    // MARK: - UI Elements
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
}
