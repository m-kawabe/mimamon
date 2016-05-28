//
//  DeviceSize.swift
//  mimamon
//
//  Created by 河辺雅史 on 2016/05/28.
//  Copyright © 2016年 fun. All rights reserved.
//

import UIKit

struct DeviseSize {
    
    //CGRectを取得
    static func bounds()->CGRect{
        return UIScreen.mainScreen().bounds;
    }
    
    //画面の横サイズを取得
    static func screenWidth()->Int{
        return Int( UIScreen.mainScreen().bounds.size.width);
    }
    
    //画面の縦サイズを取得
    static func screenHeight()->Int{
        return Int(UIScreen.mainScreen().bounds.size.height);
    }
}