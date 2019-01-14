//
//  ViewController.swift
//  MyTimer
//
//  Created by 漢那優太 on 2019/01/14.
//  Copyright © 2019 Yuta Kanna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // タイマーの変数を作成
    var timer : Timer?
    // カウント(経過時間)の変数を作成
    var count = 0
    // 設定値を扱うキーを設定
    let settingKey = "timer_value"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBOutlet weak var countDownLabel: UILabel!
 
    @IBAction func settingButtonAction(_ sender: Any) {
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
    }
    
    
    @IBAction func stopButtonAction(_ sender: Any) {
    }
}

