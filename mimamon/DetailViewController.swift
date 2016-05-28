//
//  ViewController.swift
//  mimamon
//
//  Created by 河辺雅史 on 2016/05/28.
//  Copyright © 2016年 fun. All rights reserved.
//

import UIKit
import SpriteKit

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myLabel: UILabel = UILabel(frame: CGRectMake(122.0, 144.0, 32.0, 50.0))
        myLabel.backgroundColor = UIColor.cyanColor()
        myLabel.text = ""
        self.view.addSubview(myLabel)
        
        let myLabel2: UILabel = UILabel(frame: CGRectMake(218.0, 144.0, 10.7, 50.0))
        myLabel2.backgroundColor = UIColor.cyanColor()
        myLabel2.text = ""
        self.view.addSubview(myLabel2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
}

