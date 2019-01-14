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
        
        //  UserDefaultsのインスタンスを生成
        let settings = UserDefaults.standard
        // UserDefaultsに初期値を登録
        settings.register(defaults: [settingKey:10])
    }


    @IBOutlet weak var countDownLabel: UILabel!
 
    @IBAction func settingButtonAction(_ sender: Any) {
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        // timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが、実行中だったらスタートしない
            if nowTimer.isValid == true {
                // 何も処理しない
                return
            }
        }
        
        // タイマーをスタート
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(self.timerInterrupt(_:)),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    
    @IBAction func stopButtonAction(_ sender: Any) {
    }
    
    // 画面の更新をする(戻り値:remainCount:残り時間)
    func displayUpdate() -> Int {
        
        // UserDefaultsのインスタンスを生成
        let settings = UserDefaults.standard
        // 取得した秒数をtimerValueに渡す
        let timerValue = settings.integer(forKey: settingKey)
        // 残り時間(remainCount)を生成
        let remainCount = timerValue - count
        // remainCount(残りの時間)をラベルに表示
        countDownLabel.text = "残り\(remainCount)秒"
        // 残り時間を戻り値に設定
        return remainCount
    }
    
    // 経過時間の処理
    @objc func timerInterrupt(_ timer:Timer) {
        // count(経過時間)に+1していく
        count += 1
        // remainCount(残り時間)が0以下のとき、タイマーを止める
        if displayUpdate() <= 0 {
            // 初期化処理
            count = 0
            // タイマー停止
            timer.invalidate()
        }
    }
}

