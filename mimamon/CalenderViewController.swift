//
//  CalenderViewController.swift
//  mimamon
//
//  Created by 河辺雅史 on 2016/05/28.
//  Copyright © 2016年 fun. All rights reserved.
//

import UIKit

//CALayerクラスのインポート
import QuartzCore

class CalenderViewController: UIViewController {
    
    //メンバ変数の設定（配列格納用）
    var count: Int!
    var mArray: NSMutableArray!
    
    //メンバ変数の設定（カレンダー用）
    var now: NSDate!
    var year: Int!
    var month: Int!
    var day: Int!
    var maxDay: Int!
    var dayOfWeek: Int!
    var dicCount = 0
    
    //メンバ変数の設定（カレンダー関数から取得したものを渡す）
    var comps: NSDateComponents!
    
    //メンバ変数の設定（カレンダーの背景色）
    var calendarBackGroundColor: UIColor!
    
    //プロパティを指定
//    @IBOutlet var calendarBar: UILabel!
//    @IBOutlet var prevMonthButton: UIButton!
//    @IBOutlet var nextMonthButton: UIButton!
    
    @IBOutlet weak var calendarBar: UILabel!
    @IBOutlet weak var prevMonthButton: UIButton!
    @IBOutlet weak var nextMonthButton: UIButton!
    
    @IBOutlet weak var dateText: UILabel!
    
    //カレンダーの位置決め用メンバ変数
    var calendarLabelIntervalX: Int!
    var calendarLabelX: Int!
    var calendarLabelY: Int!
    var calendarLabelWidth: Int!
    var calendarLabelHeight: Int!
    var calendarLableFontSize: Int!
    
    var buttonRadius: Float!
    
    var calendarIntervalX: Int!
    var calendarX: Int!
    var calendarIntervalY: Int!
    var calendarY: Int!
    var calendarSize: Int!
    var calendarFontSize: Int!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //現在起動中のデバイスを取得（スクリーンの幅・高さ）
        let screenWidth  = DeviseSize.screenWidth()
        let screenHeight = DeviseSize.screenHeight()
        
        //iPhone4s
        if (screenWidth == 320 && screenHeight == 480) {
            
            calendarLabelIntervalX = 5;
            calendarLabelX         = 45;
            calendarLabelY         = 93;
            calendarLabelWidth     = 40;
            calendarLabelHeight    = 25;
            calendarLableFontSize  = 14;
            
            buttonRadius           = 20.0;
            
            calendarIntervalX      = 5;
            calendarX              = 45;
            calendarIntervalY      = 120;
            calendarY              = 45;
            calendarSize           = 40;
            calendarFontSize       = 17;
            
            //iPhone5またはiPhone5s
        } else if (screenWidth == 320 && screenHeight == 568) {
            
            calendarLabelIntervalX = 5;
            calendarLabelX         = 45;
            calendarLabelY         = 93;
            calendarLabelWidth     = 40;
            calendarLabelHeight    = 25;
            calendarLableFontSize  = 14;
            
            buttonRadius           = 20.0;
            
            calendarIntervalX      = 5;
            calendarX              = 45;
            calendarIntervalY      = 120;
            calendarY              = 45;
            calendarSize           = 40;
            calendarFontSize       = 17;
            
            //iPhone6
        } else if (screenWidth == 375 && screenHeight == 667) {
            
            calendarLabelIntervalX = 35;
            calendarLabelX         = 45;
            calendarLabelY         = 125;
            calendarLabelWidth     = 45;
            calendarLabelHeight    = 25;
            calendarLableFontSize  = 16;
            
            buttonRadius           = 0.0;
            
            calendarIntervalX      = 35;
            calendarX              = 45;
            calendarIntervalY      = 155;
            calendarY              = 45;
            calendarSize           = 45;
            calendarFontSize       = 19;
            
            self.prevMonthButton.frame = CGRectMake(15, 438, CGFloat(calendarSize), CGFloat(calendarSize));
            self.nextMonthButton.frame = CGRectMake(314, 438, CGFloat(calendarSize), CGFloat(calendarSize));
            
            //iPhone6 plus
        } else if (screenWidth == 414 && screenHeight == 736) {
            
            calendarLabelIntervalX = 15;
            calendarLabelX         = 55;
            calendarLabelY         = 95;
            calendarLabelWidth     = 55;
            calendarLabelHeight    = 25;
            calendarLableFontSize  = 18;
            
            buttonRadius           = 25;
            
            calendarIntervalX      = 18;
            calendarX              = 55;
            calendarIntervalY      = 125;
            calendarY              = 55;
            calendarSize           = 50;
            calendarFontSize       = 21;
            
            self.prevMonthButton.frame = CGRectMake(18, 468, CGFloat(calendarSize), CGFloat(calendarSize));
            self.nextMonthButton.frame = CGRectMake(348, 468, CGFloat(calendarSize), CGFloat(calendarSize));
        }
        
        //ボタンを角丸にする
//        prevMonthButton.layer.cornerRadius = CGFloat(buttonRadius)
//        nextMonthButton.layer.cornerRadius = CGFloat(buttonRadius)
        
        //現在の日付を取得する
        now = NSDate()
        
        //inUnit:で指定した単位（月）の中で、rangeOfUnit:で指定した単位（日）が取り得る範囲
        let calendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let range: NSRange = calendar.rangeOfUnit(NSCalendarUnit.Day, inUnit:NSCalendarUnit.Month, forDate:now)
        
        //最初にメンバ変数に格納するための現在日付の情報を取得する
        comps = calendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Weekday],fromDate:now)
        
        //年月日と最後の日付と曜日を取得(NSIntegerをintへのキャスト不要)
        let orgYear: NSInteger      = comps.year
        let orgMonth: NSInteger     = comps.month
        let orgDay: NSInteger       = comps.day
        let orgDayOfWeek: NSInteger = comps.weekday
        let max: NSInteger          = range.length
        
        year      = orgYear
        month     = orgMonth
        day       = orgDay
        dayOfWeek = orgDayOfWeek
        maxDay    = max
        
        //空の配列を作成する（カレンダーデータの格納用）
        mArray = NSMutableArray()
        
        //曜日ラベル初期定義
        let monthName:[String] = ["日","月","火","水","木","金","土"]
        
        //曜日ラベルを動的に配置
        setupCalendarLabel(monthName)
        
        //初期表示時のカレンダーをセットアップする
        setupCurrentCalendar()
        
        let URL = NSURL(string: "http://160.16.205.237/mimamon/logs/dayHistory/1/2016-05-29")
        let req = NSURLRequest(URL: URL!)
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration, delegate:nil, delegateQueue:NSOperationQueue.mainQueue())
        
        let task = session.dataTaskWithRequest(req, completionHandler: {
            (data, response, error) -> Void in
            do {
                
                
                var s_m:CGFloat = 0.0
                var e_m:CGFloat = 0.0
                
                let dict = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! NSDictionary
                self.dicCount += dict["1"]!.count
                for i in 0 ..< dict["1"]!.count {
                    s_m = dict["1"]![i]["start_time"] as! CGFloat
                    e_m = dict["1"]![i]["end_time"] as! CGFloat
                    
                    if(i == 0){
                        let myLabel0: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 101, 489, (e_m - s_m) * 0.178, 50.0))
                        myLabel0.backgroundColor = UIColor.brownColor()
                        myLabel0.text = ""
                        self.view.addSubview(myLabel0)
                        
                    }else if(i == 1){
                        let myLabel1: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 101, 489, (e_m - s_m) * 0.178, 50.0))
                        myLabel1.backgroundColor = UIColor.brownColor()
                        myLabel1.text = ""
                        self.view.addSubview(myLabel1)
                    }else if(i == 2){
                        let myLabel2: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 101, 489, (e_m - s_m) * 0.178, 50.0))
                        myLabel2.backgroundColor = UIColor.brownColor()
                        myLabel2.text = ""
                        self.view.addSubview(myLabel2)
                    }else if(i == 3){
                        let myLabel3: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 101, 489, (e_m - s_m) * 0.178, 50.0))
                        myLabel3.backgroundColor = UIColor.brownColor()
                        myLabel3.text = ""
                        self.view.addSubview(myLabel3)
                    }else if(i == 4){
                        let myLabel4: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 101, 489, (e_m - s_m) * 0.178, 50.0))
                        myLabel4.backgroundColor = UIColor.brownColor()
                        myLabel4.text = ""
                        self.view.addSubview(myLabel4)
                    }else if(i == 5){
                        let myLabel5: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 101, 489, (e_m - s_m) * 0.178, 50.0))
                        myLabel5.backgroundColor = UIColor.brownColor()
                        myLabel5.text = ""
                        self.view.addSubview(myLabel5)
                    }
                }
            } catch {
                //エラー処理
            }
            
        })
        task.resume()
        


        
    }
    
    //曜日ラベルの動的配置関数
    func setupCalendarLabel(array: NSArray) {
        
        let calendarLabelCount = 7
        
        for i in 0...6 {
            
            //ラベルを作成
            let calendarBaseLabel: UILabel = UILabel()
            
            //X座標の値をCGFloat型へ変換して設定
            calendarBaseLabel.frame = CGRectMake(
                CGFloat(calendarLabelIntervalX + calendarLabelX * (i % calendarLabelCount)),
                CGFloat(calendarLabelY),
                CGFloat(calendarLabelWidth),
                CGFloat(calendarLabelHeight)
            )
            
            //日曜日の場合は赤色を指定
            if (i == 0) {
                
                //RGBカラーの設定は小数値をCGFloat型にしてあげる
                calendarBaseLabel.textColor = UIColor(
                    red: CGFloat(0.831), green: CGFloat(0.349), blue: CGFloat(0.224), alpha: CGFloat(1.0)
                )
                
                //土曜日の場合は青色を指定
            } else if(i == 6) {
                
                //RGBカラーの設定は小数値をCGFloat型にしてあげる
                calendarBaseLabel.textColor = UIColor(
                    red: CGFloat(0.400), green: CGFloat(0.471), blue: CGFloat(0.980), alpha: CGFloat(1.0)
                )
                
                //平日の場合は灰色を指定
            } else {
                
                //既に用意されている配色パターンの場合
                calendarBaseLabel.textColor = UIColor.lightGrayColor()
                
            }
            
            //曜日ラベルの配置
            calendarBaseLabel.text = String(array[i] as! NSString)
            calendarBaseLabel.textAlignment = NSTextAlignment.Center
            calendarBaseLabel.font = UIFont(name: "System", size: CGFloat(calendarLableFontSize))
            self.view.addSubview(calendarBaseLabel)
        }
    }
    
    //カレンダーを生成する関数
    func generateCalendar() {
        
        //タグナンバーとトータルカウントの定義
        var tagNumber = 1
        let total     = 42
        
        //祝祭日のメソッドを定義した祝祭日判定フラグ
        let holidayObject = CalculateCalendarLogic()
        var holidayFlag: Bool = false
        
        //7×6=42個のボタン要素を作る
        for i in 0...41{
            
            //配置場所の定義
            let positionX   = calendarIntervalX + calendarX * (i % 7)
            let positionY   = calendarIntervalY + calendarY * (i / 7)
            let buttonSizeX = calendarSize;
            let buttonSizeY = calendarSize;
            
            //ボタンをつくる
            let button: UIButton = UIButton()
            button.frame = CGRectMake(
                CGFloat(positionX),
                CGFloat(positionY),
                CGFloat(buttonSizeX),
                CGFloat(buttonSizeY)
            );
            
            //ボタンの初期設定をする
            if (i < dayOfWeek - 1) {
                
                //日付の入らない部分はボタンを押せなくする
                button.setTitle("", forState: .Normal)
                button.enabled = false
                holidayFlag = false
                
            } else if (i == dayOfWeek - 1 || i < dayOfWeek + maxDay - 1) {
                
                //日付の入る部分はボタンのタグを設定する（日にち）
                button.setTitle(String(tagNumber), forState: .Normal)
                
                //祝祭日の判定を行う
                holidayFlag = holidayObject.judgeJapaneseHoliday(year, month: month, day: tagNumber)
                
                button.tag = tagNumber
                tagNumber += 1
                
            } else if (i == dayOfWeek + maxDay - 1 || i < total) {
                
                //日付の入らない部分はボタンを押せなくする
                button.setTitle("", forState: .Normal)
                button.enabled = false
                holidayFlag = false
            }
            
            //ボタンの配色の設定
            //日曜日または祝祭日(振替休日) => 赤色, 土曜日 => 青色, 平日 => グレー色
            //@remark:このサンプルでは正円のボタンを作っていますが、背景画像の設定等も可能です。
            if (i % 7 == 0 || holidayFlag == true) {
                calendarBackGroundColor = UIColor(
                    red: CGFloat(0.831), green: CGFloat(0.349), blue: CGFloat(0.224), alpha: CGFloat(1.0)
                )
            } else if (i % 7 == 6) {
                calendarBackGroundColor = UIColor(
                    red: CGFloat(0.400), green: CGFloat(0.471), blue: CGFloat(0.980), alpha: CGFloat(1.0)
                )
            } else {
              //  calendarBackGroundColor = UIColor.lightGrayColor()
            }
            
            //ボタンのデザインを決定する
         //   button.backgroundColor = calendarBackGroundColor
            button.layer.borderColor = UIColor.lightGrayColor().CGColor
            button.layer.borderWidth = 1.0
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            button.titleLabel!.font = UIFont(name: "System", size: CGFloat(calendarFontSize))
            button.layer.cornerRadius = CGFloat(buttonRadius)
            
            //配置したボタンに押した際のアクションを設定する
            button.addTarget(self, action: #selector(CalenderViewController.buttonTapped(_:)), forControlEvents: .TouchUpInside)
            
            //ボタンを配置する
            self.view.addSubview(button)
            mArray.addObject(button)
        }
        
    }
    
    //タイトル表記を設定する関数
    func setupCalendarTitleLabel() {
        calendarBar.text = String("\(year)年\(month)月")
    }
    
    //現在（初期表示時）の年月に該当するデータを取得する関数
    func setupCurrentCalendarData() {
        
        /*************
         * (重要ポイント)
         * 現在月の1日のdayOfWeek(曜日の値)を使ってカレンダーの始まる位置を決めるので、
         * yyyy年mm月1日のデータを作成する。
         * 後述の関数 setupPrevCalendarData, setupNextCalendarData も同様です。
         *************/
        let currentCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let currentComps: NSDateComponents = NSDateComponents()
        
        currentComps.year  = year
        currentComps.month = month
        currentComps.day   = 1
        
        let currentDate: NSDate = currentCalendar.dateFromComponents(currentComps)!
        recreateCalendarParameter(currentCalendar, currentDate: currentDate)
    }
    
    //前の年月に該当するデータを取得する関数
    func setupPrevCalendarData() {
        
        //現在の月に対して-1をする
        if (month == 0) {
            year = year - 1;
            month = 12;
        } else {
            month = month - 1;
        }
        
        //setupCurrentCalendarData()と同様の処理を行う
        let prevCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let prevComps: NSDateComponents = NSDateComponents()
        
        prevComps.year  = year
        prevComps.month = month
        prevComps.day   = 1
        
        let prevDate: NSDate = prevCalendar.dateFromComponents(prevComps)!
        recreateCalendarParameter(prevCalendar, currentDate: prevDate)
    }
    
    //次の年月に該当するデータを取得する関数
    func setupNextCalendarData() {
        
        //現在の月に対して+1をする
        if (month == 12) {
            year = year + 1;
            month = 1;
        } else {
            month = month + 1;
        }
        
        //setupCurrentCalendarData()と同様の処理を行う
        let nextCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let nextComps: NSDateComponents = NSDateComponents()
        
        nextComps.year  = year
        nextComps.month = month
        nextComps.day   = 1
        
        let nextDate: NSDate = nextCalendar.dateFromComponents(nextComps)!
        recreateCalendarParameter(nextCalendar, currentDate: nextDate)
    }
    
    //カレンダーのパラメータを再作成する関数
    func recreateCalendarParameter(currentCalendar: NSCalendar, currentDate: NSDate) {
        
        //引数で渡されたものをもとに日付の情報を取得する
        let currentRange: NSRange = currentCalendar.rangeOfUnit(NSCalendarUnit.Day, inUnit:NSCalendarUnit.Month, forDate:currentDate)
        
        comps = currentCalendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Weekday],fromDate:currentDate)
        
        //年月日と最後の日付と曜日を取得(NSIntegerをintへのキャスト不要)
        let currentYear: NSInteger      = comps.year
        let currentMonth: NSInteger     = comps.month
        let currentDay: NSInteger       = comps.day
        let currentDayOfWeek: NSInteger = comps.weekday
        let currentMax: NSInteger       = currentRange.length
        
        year      = currentYear
        month     = currentMonth
        day       = currentDay
        dayOfWeek = currentDayOfWeek
        maxDay    = currentMax
    }
    
    //表示されているボタンオブジェクトを一旦削除する関数
    func removeCalendarButtonObject() {
        
        //ビューからボタンオブジェクトを削除する
        for i in 0..<mArray.count {
            mArray[i].removeFromSuperview()
        }
        
        //配列に格納したボタンオブジェクトも削除する
        mArray.removeAllObjects()
    }
    
    //現在のカレンダーをセットアップする関数
    func setupCurrentCalendar() {
        
        setupCurrentCalendarData()
        generateCalendar()
        setupCalendarTitleLabel()
    }
    
    //カレンダーボタンをタップした時のアクション
    func buttonTapped(button: UIButton) {
        
        //@todo:画面遷移等の処理を書くことができます。
        
        dateText.text = "\(month)月\(button.tag)日"
        //コンソール表示
        print("\(year)年\(month)月\(button.tag)日が選択されました！")
        
        let subviews = self.view.subviews
        var count = 0
        for subview in subviews{
            for(var j = 77; j < 77 + dicCount; j++){
                if(count == j){
                    subview.removeFromSuperview()
                }
            }


            count++
        }
        var URL3 = "http://160.16.205.237/mimamon/logs/dayHistory/1/2016-05-" +  "\(button.tag)"
        let URL = NSURL(string: URL3)
        let req = NSURLRequest(URL: URL!)
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration, delegate:nil, delegateQueue:NSOperationQueue.mainQueue())
        
        let task = session.dataTaskWithRequest(req, completionHandler: {
            (data, response, error) -> Void in
            do {
                
                
                var s_m:CGFloat = 0.0
                var e_m:CGFloat = 0.0
                
                let dict = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! NSDictionary
                for i in 0 ..< dict["1"]!.count {
                    s_m = dict["1"]![i]["start_time"] as! CGFloat
                    e_m = dict["1"]![i]["end_time"] as! CGFloat
                    
                    if(i == 0){
                        let myLabel0: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 101, 489, (e_m - s_m) * 0.178, 50.0))
                        myLabel0.backgroundColor = UIColor.brownColor()
                        myLabel0.text = ""
                        self.view.addSubview(myLabel0)
                        
                    }else if(i == 1){
                        let myLabel1: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 101, 489, (e_m - s_m) * 0.178, 50.0))
                        myLabel1.backgroundColor = UIColor.brownColor()
                        myLabel1.text = ""
                        self.view.addSubview(myLabel1)
                    }else if(i == 2){
                        let myLabel2: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 101, 489, (e_m - s_m) * 0.178, 50.0))
                        myLabel2.backgroundColor = UIColor.brownColor()
                        myLabel2.text = ""
                        self.view.addSubview(myLabel2)
                    }else if(i == 3){
                        let myLabel3: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 101, 489, (e_m - s_m) * 0.178, 50.0))
                        myLabel3.backgroundColor = UIColor.brownColor()
                        myLabel3.text = ""
                        self.view.addSubview(myLabel3)
                    }else if(i == 4){
                        let myLabel4: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 101, 489, (e_m - s_m) * 0.178, 50.0))
                        myLabel4.backgroundColor = UIColor.brownColor()
                        myLabel4.text = ""
                        self.view.addSubview(myLabel4)
                    }else if(i == 5){
                        let myLabel5: UILabel = UILabel(frame: CGRectMake(s_m * 0.178 + 101, 489, (e_m - s_m) * 0.178, 50.0))
                        myLabel5.backgroundColor = UIColor.brownColor()
                        myLabel5.text = ""
                        self.view.addSubview(myLabel5)
                    }
                }
            } catch {
                //エラー処理
            }
            
        })
        task.resume()

        
        
    }
    
    //前の月のボタンを押した際のアクション
    @IBAction func getPrevMonthData(sender: UIButton) {
        prevCalendarSettings()
    }
    
    //次の月のボタンを押した際のアクション
    @IBAction func getNextMonthData(sender: UIButton) {
        nextCalendarSettings()
    }
    
    //左スワイプで前月を表示
    @IBAction func swipePrevCalendar(sender: UISwipeGestureRecognizer) {
        prevCalendarSettings()
    }
    
    //右スワイプで次月を表示
    @IBAction func swipeNextCalendar(sender: UISwipeGestureRecognizer) {
        nextCalendarSettings()
    }
    
    //前月を表示するメソッド
    func prevCalendarSettings() {
        removeCalendarButtonObject()
        setupPrevCalendarData()
        generateCalendar()
        setupCalendarTitleLabel()
    }
    
    //次月を表示するメソッド
    func nextCalendarSettings() {
        removeCalendarButtonObject()
        setupNextCalendarData()
        generateCalendar()
        setupCalendarTitleLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func BackButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }    
}
