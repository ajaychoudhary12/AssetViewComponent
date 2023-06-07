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
    
    required init(viewModel: AssetViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        layoutViews()
        layoutConstraints()
        applyModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutViews() {
        addSubview(imageView)
    }
    
    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func applyModel() {
        setImage(viewModel.asset.url, placeholder: UIImage(systemName: "heart.fill"))
    }
    
    private func setImage(_ imageUrlString: String?, placeholder: UIImage? = nil) {
        if let imageUrlString = imageUrlString,
           let imageUrl = URL(string: imageUrlString) {
            
            self.imageView.kf.setImage(with: imageUrl) { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success(let imageResult):
                    self.imageView.image = imageResult.image
                    self.viewModel.assetLoadingSucceded()
                case .failure:
                    self.imageView.kf.setImage(with: imageUrl, placeholder: placeholder)
                    self.viewModel.assetLoadingFailed()
                }
            }
        } else {
            self.imageView.image = placeholder
            self.viewModel.assetLoadingFailed()
        }
    }
    
    // MARK: - UI Elements
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
}
