//
//  GradientProgressView.swift
//  GradientProgressView
//
//  Created by Ankita Thakur on 11/08/24.
//

import Foundation
import UIKit

@IBDesignable
class GradientProgressView: UIProgressView {

    // Define the colors for the gradient
    @IBInspectable var startColor: UIColor = UIColor.red {
        didSet {
            updateGradient()
        }
    }
    @IBInspectable var endColor: UIColor = UIColor.yellow {
        didSet {
            updateGradient()
        }
    }

    // Define the direction for the gradient
    @IBInspectable var isHorizontal: Bool = true {
        didSet {
            updateGradient()
        }
    }

    // Create gradient layer
    private let gradientLayer = CAGradientLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        // Set initial properties
        updateGradient()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradientFrame()
    }

    private func updateGradient() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        if isHorizontal {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        } else {
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        }
        gradientLayer.cornerRadius = 5
       clipsToBounds = true
        updateGradientFrame()
        if let gradientImage = gradientImage(from: gradientLayer) {
            self.progressImage = gradientImage
        }
    }

    private func updateGradientFrame() {
        gradientLayer.frame = bounds
    }

    private func gradientImage(from layer: CAGradientLayer) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.bounds.size, layer.isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

