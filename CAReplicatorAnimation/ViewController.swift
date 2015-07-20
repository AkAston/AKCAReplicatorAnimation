//
//  ViewController.swift
//  CAReplicatorAnimation
//
//  Created by Aston K Mac on 15/7/12.
//  Copyright (c) 2015年 Aston K Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        animation1()
//        animation2()
        animation3()
    }
    
    
    //music pop up and down
    func animation1(){
        
        //build replicatorLayer
        let r = CAReplicatorLayer();
        r.bounds = CGRectMake(0, 0, 60, 60);
        r.position = CGPointMake(view.center.x, 100);
        r.backgroundColor = UIColor.lightGrayColor().CGColor;
        view.layer.addSublayer(r)
        
        //build a red bar
        let bar = CALayer();
        bar.bounds = CGRectMake(0, 0, 8, 40)
        bar.position = CGPointMake(10, 75.0)
        bar.cornerRadius = 2.0
        bar.backgroundColor = UIColor.redColor().CGColor;
        
        r.addSublayer(bar);
        
        //move animation a bar
        let move = CABasicAnimation(keyPath: "position.y")
        move.toValue = bar.position.y - 35.0;
        move.duration = 0.5
        move.autoreverses = true
        move.repeatCount = Float.infinity
        bar.addAnimation(move, forKey: nil)
        
        //** use the power of replicator
        r.instanceCount = 3   //total 3 bars
        
        //next bar is 20 offset of center.x from the last bar
        r.instanceTransform = CATransform3DMakeTranslation(20.0, 0.0, 0.0);
        
        //each is delayed to the last one
        r.instanceDelay =  0.33;
        
        //clip the bars out side the layer
        r.masksToBounds = true
    }
    
    //circle animation
    func animation2(){
        
        let replicator = CAReplicatorLayer()
        replicator.bounds = CGRectMake(0, 0, 200, 200)
        replicator.position = CGPointMake(view.center.x, 300)
        replicator.backgroundColor = UIColor(white: 0.0, alpha: 0.75).CGColor
        view.layer.addSublayer(replicator)
        
        let dot  = CALayer()
        dot.bounds = CGRectMake(0, 0, 14.0, 14.0)
        dot.position = CGPointMake(100.0, 40.0)
        dot.backgroundColor = UIColor(white: 0.8, alpha: 1.0).CGColor
        dot.borderColor = UIColor(white: 1.0, alpha: 1.0).CGColor
        dot.borderWidth = 1.0
        dot.cornerRadius = 2.0
        
        replicator.addSublayer(dot)
        
        let nrDots:Int = 15
        replicator.instanceCount = nrDots
        let angle = CGFloat(2*M_PI)/CGFloat(nrDots)
        replicator.instanceTransform = CATransform3DMakeRotation(angle, 0, 0.0, 1.0)
        
        let duration:CFTimeInterval = 1.5
        let shrink = CABasicAnimation(keyPath: "transform.scale")
        shrink.fromValue = 1.0
        shrink.toValue = 0.1
        shrink.duration = duration
        shrink.repeatCount = Float.infinity
        dot.addAnimation(shrink, forKey: nil)
        
        replicator.instanceDelay = duration/Double(nrDots)
        dot.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
    }
    
    
    //follow the leader
    func animation3(){
        let r = CAReplicatorLayer()
        r.bounds = view.bounds
        r.backgroundColor = UIColor(white: 0.0, alpha: 0.75).CGColor
        r.position = view.center
        view.layer.addSublayer(r)
        
        let dot = CALayer()
        dot.bounds = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0)
        dot.backgroundColor = UIColor(white: 0.8, alpha: 1.0).CGColor
        dot.borderColor = UIColor(white: 1.0, alpha: 1.0).CGColor
        dot.borderWidth = 1.0
        dot.cornerRadius = 5.0
        dot.shouldRasterize = true
        dot.rasterizationScale = UIScreen.mainScreen().scale
        r.addSublayer(dot)
        
        let move = CAKeyframeAnimation(keyPath: "position")
        move.path = rw()
        move.repeatCount = Float.infinity
        move.duration = 4.0
        dot.addAnimation(move, forKey: nil)
        
        r.instanceCount = 20
        r.instanceDelay = 0.1
        
        r.instanceColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0).CGColor

        r.instanceGreenOffset = -0.03;
    }
    
    func rw() -> CGPath{
        var bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(31.5, 71.5))
        bezierPath.addLineToPoint(CGPointMake(31.5, 23.5))
        bezierPath.addCurveToPoint(CGPointMake(58.5, 38.5),
            controlPoint1: CGPointMake(31.5, 23.5),
            controlPoint2: CGPointMake(62.46, 18.69))
        bezierPath.addCurveToPoint(CGPointMake(53.5, 45.5),
            controlPoint1: CGPointMake(57.5, 43.5),
            controlPoint2: CGPointMake(53.5, 45.5))
        bezierPath.addLineToPoint(CGPointMake(43.5, 48.5))
        bezierPath.addLineToPoint(CGPointMake(53.5, 66.5))
        bezierPath.addLineToPoint(CGPointMake(62.5, 51.5))
        bezierPath.addLineToPoint(CGPointMake(70.5, 66.5))
        bezierPath.addLineToPoint(CGPointMake(86.5, 23.5))
        bezierPath.addLineToPoint(CGPointMake(86.5, 78.5))
        bezierPath.addLineToPoint(CGPointMake(31.5, 78.5))
        bezierPath.addLineToPoint(CGPointMake(31.5, 71.5))
        bezierPath.closePath()
        
        var t = CGAffineTransformMakeScale(3.0, 3.0)
        return CGPathCreateCopyByTransformingPath(bezierPath.CGPath, &t);
    }
    
//    func anima
    
    
}

