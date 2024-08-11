//
//  ViewController.swift
//  GradientProgressView
//
//  Created by Ankita Thakur on 11/08/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var  progressView : GradientProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let progress = 0.4
        progressView.setProgress(Float(progress), animated: true)
        // Do any additional setup after loading the view.
    }


}

