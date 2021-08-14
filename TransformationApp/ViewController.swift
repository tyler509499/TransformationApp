//
//  ViewController.swift
//  TransformationApp
//
//  Created by Galkov Nikita on 11.08.2021.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    private lazy var rectangle = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
    private var isAnimationStarted: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        viewLoaded()
        
    }
    
    private func viewLoaded() {
        view.backgroundColor = .white
        rectangle.backgroundColor = .blue
        view.addSubview(rectangle)
        rectangle.transform = rectangle.transform.scaledBy(x: 0.5, y: 0.5)
    }
    
    private func rotateRectangle(duration: TimeInterval) {
        guard isAnimationStarted else { return }
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: { () -> Void in
            self.rectangle.transform = self.rectangle.transform.rotated(by: .pi / 360)
        })
            { (finished) -> Void in
            if finished {
                self.rotateRectangle(duration: duration)
            }
        }
    }
    private func moveRectangle(duration: TimeInterval, x: CGFloat, y: CGFloat) {
        UIView.animate(withDuration: duration) {
            self.rectangle.center.x = x
            self.rectangle.center.y = y
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: view)
        isAnimationStarted = true
        rotateRectangle(duration: 0.025)
        moveRectangle(duration: 0.3, x: location.x, y: location.y)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: view)
        self.rectangle.center.x = location.x
        self.rectangle.center.y = location.y
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        isAnimationStarted = false
        rectangle.layer.removeAllAnimations()
        
    }
}


