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
    
    var lottieAnimationView: AnimationView? {
        didSet {
            if lottieAnimationView != nil {
                configureAnimationView()
                addAnimationViewAsSubview()
                layoutConstraints()
            }
        }
    }
    
    required init(viewModel: AssetViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        applyModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAnimationView() {
        guard let lottieAnimationView = lottieAnimationView else { return }
        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.loopMode = .loop
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addAnimationViewAsSubview() {
        if let lottieAnimationView = lottieAnimationView {
            if lottieAnimationView.superview == nil { addSubview(lottieAnimationView) }
        }
    }
    
    private func layoutConstraints() {
        guard let lottieAnimationView = lottieAnimationView else { return }
        NSLayoutConstraint.activate([
            lottieAnimationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lottieAnimationView.topAnchor.constraint(equalTo: topAnchor),
            lottieAnimationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lottieAnimationView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func applyModel() {
        setLottie(viewModel.asset.url)
    }
    
    private func setLottie(_ url: String?) {
        lottieAnimationView?.removeFromSuperview()
        lottieAnimationView = nil
        
        if let animationUrlString = url,
           let animationUrl = URL(string: animationUrlString) {
            lottieAnimationView = AnimationView(url: animationUrl) { [weak self] error in
                if error != nil {
                    self?.viewModel.assetLoadingFailed()
                    self?.handleError()
                    return
                }
                
                self?.lottieAnimationView?.play()
                self?.viewModel.assetLoadingSucceded()
            }
        } else {
            handleError()
        }
    }
    
    private func handleError() {
        playDefaultAnimation()
    }
    
    func playDefaultAnimation() {
        lottieAnimationView = AnimationView(name: "default_lottie")
        lottieAnimationView?.play()
    }
}
