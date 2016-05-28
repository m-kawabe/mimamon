//
//  ViewController.swift
//  mimamon
//
//  Created by 河辺雅史 on 2016/05/28.
//  Copyright © 2016年 fun. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var yano_studyImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let image:UIImage = UIImage(named:"pen.png")!
//        yano_studyImageView = UIImageView(image:image)
        yano_studyImageView.image = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
}

