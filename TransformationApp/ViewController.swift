//
//  ViewController.swift
//  TransformationApp
//
//  Created by Galkov Nikita on 11.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var rectangle = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
    
    var startPoint = CGPoint()
    var currentPoint = CGPoint()
    var startAngle = CGFloat()
    var currentAngle = CGFloat()
    var currentRotation = CGFloat()
    var totalRotation = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLoaded()
    }
    
    private func viewLoaded() {
        view.backgroundColor = .white
        rectangle.backgroundColor = .blue
        view.addSubview(rectangle)
        rectangle.center = CGPoint(x: view.frame.size.width  / 2,
                                     y: view.frame.size.height / 2)
    }
    
    func angle(_ point:CGPoint) -> CGFloat{
        let angle = atan2(point.y - (self.view?.center.y)!, point.x - (self.view?.center.x)!)
        return angle
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        startPoint = touch.previousLocation(in: self.view)
        currentPoint = touch.location(in: self.view)
        
        startAngle = angle(startPoint)
        currentAngle = angle(currentPoint)
        
        currentRotation = currentAngle - startAngle
        totalRotation += currentRotation
        
        self.rectangle.transform = CGAffineTransform(rotationAngle: totalRotation)
    }
}


