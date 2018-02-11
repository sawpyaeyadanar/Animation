//
//  ViewController.swift
//  Animation
//
//  Created by Saw Pyae Yadanar on 5/1/18.
//  Copyright © 2018 Saw Pyae Yadanar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttontext: UIButton!
    @IBOutlet weak var image: UIImageView!
    var counter = 1
    var isAnimate  = false
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func animatefunc() {
        image.image = UIImage(named: "\(counter).gif")
        print(counter)
        counter +=  1
        if counter == 5 {
            counter = 0
        }
    }
    
    @IBAction func FadeIn(_ sender: UIButton) {
        image.alpha = 0
        UIView.animate(withDuration: 1) {
            self.image.alpha = 1
        }
    }
    
    @IBAction func SlideIn(_ sender: UIButton) {
        image.center = CGPoint(x: image.center.x  - 500 , y: image.center.y)
        UIView.animate(withDuration: 2) {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        }
    }
    @IBAction func Glow(_ sender: UIButton) {
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration: 2) {
            self.image.frame = CGRect(x: 50 , y: 200, width: 300, height: 300)
        }
    }
    
    @IBAction func nextfunc(_ sender: UIButton) {
        if isAnimate {
            timer.invalidate()
            isAnimate = false
             buttontext.setTitle("Start Animation", for: [])
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animatefunc), userInfo: nil, repeats: true)
            buttontext.setTitle("Stop Animation", for: [])
            isAnimate = true
        }
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

