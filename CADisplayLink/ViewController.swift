//
//  ViewController.swift
//  CADisplayLink
//
//  Created by Nolan Fuchs on 1/22/19.
//  Copyright © 2019 Nolan Fuchs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let countingLabel: UILabel = {
        let label = UILabel()
        label.text = "Seconds"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(countingLabel)
        countingLabel.frame = view.frame
        
       // Create CA Dsiplay Link
        let displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.add(to: .main, forMode: .default)
    }
    
    var startValue: Double = 0
    let endValue: Double = 120000
    let animationDuration = 1.5
    
    let animationStartDate = Date()

    @objc func update() {
       let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
       
        if elapsedTime > animationDuration {
            self.countingLabel.text = "\(endValue)"
        } else {
        let percentage = elapsedTime / Double(animationDuration)
        let value = startValue + percentage * (endValue - startValue)
        self.countingLabel.text = "\(value)"
        }
    }

}

