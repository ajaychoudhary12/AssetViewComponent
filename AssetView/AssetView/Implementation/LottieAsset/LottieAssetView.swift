//
//  LottieAssetView.swift
//  AssetView
//
//  Created by Ajay Choudhary on 07/06/23.
//

import UIKit
import Lottie

final class LottieAssetView: UIView, AssetViewActions {
    var viewModel: AssetViewModel
    
    private var lottieAnimationView: LottieAnimationView = LottieAnimationView(frame: .zero)
    
    required init(viewModel: AssetViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        configureAnimationView()
        addSubviews()
        layoutConstraints()
        
        applyModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAnimationView() {
        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.loopMode = .loop
    }
    
    private func addSubviews() {
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lottieAnimationView)
    }
    
    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            lottieAnimationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lottieAnimationView.topAnchor.constraint(equalTo: topAnchor),
            lottieAnimationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lottieAnimationView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func applyModel() {
        setLottieWithPlaceholder(viewModel.asset.url)
    }
    
    private func setLottieWithPlaceholder(_ url: String?) {
        if let animationUrlString = url,
           let animationUrl = URL(string: animationUrlString) {
            LottieAnimation.loadedFrom(url: animationUrl) { [weak self] animation in
                guard let self = self else { return }
                if animation == nil {
                    self.viewModel.onAssetLoadingFailed()
                    self.playDefaultAnimation()
                    return
                }
                
                self.lottieAnimationView.animation = animation
                self.playAnimation()
                self.viewModel.onAssetLoadingSuccessful()
            }
        } else {
            self.playDefaultAnimation()
        }
    }
    
    private func playAnimation() {
        lottieAnimationView.play()
    }
    
    func playDefaultAnimation() {
        let placeholderName: String = viewModel.placeholderName ?? "placeholder"
        
        lottieAnimationView.animation = LottieAnimation.named(placeholderName)
        lottieAnimationView.play()
    }
}
