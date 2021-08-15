//
//  ViewController.swift
//  TransformationApp
//
//  Created by Galkov Nikita on 11.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var rectangle = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
    private var lastRotation: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        viewLoaded()
//        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotatedRectangle(_:)))
//        view.addGestureRecognizer(rotate)
        
    }
    
    private func viewLoaded() {
        view.backgroundColor = .white
        rectangle.backgroundColor = .blue
        view.addSubview(rectangle)
        rectangle.center = CGPoint(x: view.frame.size.width  / 2,
                                     y: view.frame.size.height / 2)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: view)
        let angle = atan2(rectangle.center.y-location.y, rectangle.center.x-location.x)
        rectangle.transform = CGAffineTransform(rotationAngle: angle)
    }
}


