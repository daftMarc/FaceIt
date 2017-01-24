//
//  ViewController.swift
//  FaceIt
//
//  Created by Marc FAMILARI on 1/23/17.
//  Copyright © 2017 Marc FAMILARI. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {

    var expression = FacialExpression(eyes: .Open, eyeBrows: .Normal, mouth: .Smile) {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var FaceView: FaceView!
    
    private var mouthCurvatures = [FacialExpression.Mouth.Frown:-1.0,.Grin:0.5,.Smile:1.0,.Smirk:-0.5,.Neutral:0.0]
    private var eyeBrowTilts = [FacialExpression.EyeBrows.Furrowed:-0.5,.Normal:0.0,.Relaxed:0.5]
    
    private func updateUI() {
        switch expression.eyes {
        case .Open: FaceView.eyesOpen = true
        case .Closed, .Squinting: FaceView.eyesOpen = false
        }
        FaceView.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
        FaceView.eyeBrowTilt = eyeBrowTilts[expression.eyeBrows] ?? 0.0
    }
}

