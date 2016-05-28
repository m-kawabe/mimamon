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
    @IBOutlet weak var nagai_studyImageView: UIImageView!
    @IBOutlet weak var kudo_studyImageView: UIImageView!
    @IBOutlet weak var hyodo_studyImageView: UIImageView!
    @IBOutlet weak var kawabe_studyImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getJson()
        // Do any additional setup after loading the view, typically from a nib.
//        let image:UIImage = UIImage(named:"pen.png")!
//        yano_studyImageView = UIImageView(image:image)
        self.yano_studyImageView.image = nil;
        self.nagai_studyImageView.image = nil;
        self.kudo_studyImageView.image = nil;
        self.hyodo_studyImageView.image = nil;
        self.kawabe_studyImageView.image = nil;
    }
    
    func getJson() {
        
        let URL = NSURL(string: "http://160.16.205.237/mimamon/logs/real")
        let req = NSURLRequest(URL: URL!)
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration, delegate:nil, delegateQueue:NSOperationQueue.mainQueue())
        
        let task = session.dataTaskWithRequest(req, completionHandler: {
            (data, response, error) -> Void in
            do {
                
                let array = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! NSArray
                
                let image:UIImage = UIImage(named:"pen.png")!
                
                for i in 0 ..< array.count {
                    if(array[i]["user"] as! Int == 1){
                        self.yano_studyImageView.image = image
                    }
                    
                    if(array[i]["user"] as! Int == 2){
                        self.nagai_studyImageView.image = image
                    }
                    
                    if(array[i]["user"] as! Int == 3){
                        self.kudo_studyImageView.image = image
                    }
                    
                    if(array[i]["user"] as! Int == 4){
                        self.hyodo_studyImageView.image = image
                    }
                    
                    if(array[i]["user"] as! Int == 5){
                        self.kawabe_studyImageView.image = image
                    }
                    print(array[i]["user"] as! Int)
                }
            } catch {
                //エラー処理
            }
            
        })
        task.resume()
        
        
        let delay = 3 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.getJson()
            print("3秒後に実行される")
        })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
}

