//
//  ViewController.swift
//  mimamon
//
//  Created by 河辺雅史 on 2016/05/28.
//  Copyright © 2016年 fun. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let URL = NSURL(string: "http://160.16.205.237/mimamon/logs/weekHistory/1/")
        let req = NSURLRequest(URL: URL!)
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration, delegate:nil, delegateQueue:NSOperationQueue.mainQueue())
        
        let task = session.dataTaskWithRequest(req, completionHandler: {
            (data, response, error) -> Void in
            do {
                
                let array = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! NSArray
                //print(array)
                var t:CGFloat = 0.0
                var s_m:CGFloat = 0.0
                var e_m:CGFloat = 0.0
                for i in 0 ..< array.count {
                    print(array[i]["start_time"]!!["day"] as! String)
                    // (s_m * 0.178, t, (e_m - s_m) * 0.178, t)
                    if( array[i]["start_time"]!!["day"] as! String == "2016-05-29"){
                        t = 144
                    }else if( array[i]["start_time"]!!["day"] as! String == "2016-05-28"){
                        t = 207
                    }else if( array[i]["start_time"]!!["day"] as! String == "2016-05-27"){
                        t = 270
                    }else if( array[i]["start_time"]!!["day"] as! String == "2016-05-26"){
                        t = 333
                    }else if( array[i]["start_time"]!!["day"] as! String == "2016-05-25"){
                        t = 396
                    }else if( array[i]["start_time"]!!["day"] as! String == "2016-05-24"){
                        t = 459
                    }else if( array[i]["start_time"]!!["day"] as! String == "2016-05-23"){
                        t = 522
                    }
                    
                    s_m = array[i]["start_time"]!!["min"] as! CGFloat
                    e_m = array[i]["end_time"]!!["min"] as! CGFloat
                    print("-----")
                    print(s_m)
                    print(e_m)
                    if(i == 0){
                        let myLabel0: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel0.backgroundColor = UIColor.brownColor()
                        myLabel0.text = ""
                        self.view.addSubview(myLabel0)
                    }else if(i == 1){
                        let myLabel1: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel1.backgroundColor = UIColor.brownColor()
                        myLabel1.text = ""
                        self.view.addSubview(myLabel1)
                    }else if(i == 2){
                        let myLabel2: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel2.backgroundColor = UIColor.brownColor()
                        myLabel2.text = ""
                        self.view.addSubview(myLabel2)
                    }else if(i == 3){
                        let myLabel3: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel3.backgroundColor = UIColor.brownColor()
                        myLabel3.text = ""
                        self.view.addSubview(myLabel3)
                    }else if(i == 4){
                        let myLabel4: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel4.backgroundColor = UIColor.brownColor()
                        myLabel4.text = ""
                        self.view.addSubview(myLabel4)
                    }else if(i == 5){
                        let myLabel5: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel5.backgroundColor = UIColor.brownColor()
                        myLabel5.text = ""
                        self.view.addSubview(myLabel5)
                    }else if(i == 6){
                        let myLabel6: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel6.backgroundColor = UIColor.brownColor()
                        myLabel6.text = ""
                        self.view.addSubview(myLabel6)
                    }else if(i == 7){
                        let myLabel7: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel7.backgroundColor = UIColor.brownColor()
                        myLabel7.text = ""
                        self.view.addSubview(myLabel7)
                    }else if(i == 8){
                        let myLabel8: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel8.backgroundColor = UIColor.brownColor()
                        myLabel8.text = ""
                        self.view.addSubview(myLabel8)
                    }else if(i == 9){
                        let myLabel9: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel9.backgroundColor = UIColor.brownColor()
                        myLabel9.text = ""
                        self.view.addSubview(myLabel9)
                    }else if(i == 10){
                        let myLabel10: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel10.backgroundColor = UIColor.brownColor()
                        myLabel10.text = ""
                        self.view.addSubview(myLabel10)
                    }else if(i == 11){
                        let myLabel11: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel11.backgroundColor = UIColor.brownColor()
                        myLabel11.text = ""
                        self.view.addSubview(myLabel11)
                    }else if(i == 12){
                        let myLabel12: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel12.backgroundColor = UIColor.brownColor()
                        myLabel12.text = ""
                        self.view.addSubview(myLabel12)
                    }else if(i == 13){
                        let myLabel13: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel13.backgroundColor = UIColor.brownColor()
                        myLabel13.text = ""
                        self.view.addSubview(myLabel13)
                    }else if(i == 14){
                        let myLabel14: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel14.backgroundColor = UIColor.brownColor()
                        myLabel14.text = ""
                        self.view.addSubview(myLabel14)
                    }else if(i == 15){
                        let myLabel15: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel15.backgroundColor = UIColor.brownColor()
                        myLabel15.text = ""
                        self.view.addSubview(myLabel15)
                    }else if(i == 16){
                        let myLabel16: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel16.backgroundColor = UIColor.brownColor()
                        myLabel16.text = ""
                        self.view.addSubview(myLabel16)
                    }else if(i == 17){
                        let myLabel17: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel17.backgroundColor = UIColor.brownColor()
                        myLabel17.text = ""
                        self.view.addSubview(myLabel17)
                    }else if(i == 18){
                        let myLabel18: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel18.backgroundColor = UIColor.brownColor()
                        myLabel18.text = ""
                        self.view.addSubview(myLabel18)
                    }else if(i == 19){
                        let myLabel19: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 90, t, (e_m - s_m) * 0.178, 50.0))
                        myLabel19.backgroundColor = UIColor.brownColor()
                        myLabel19.text = ""
                        self.view.addSubview(myLabel19)
                    }
                }
                
            } catch {
            //エラー処理
        }
        
    })
    task.resume()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
}

