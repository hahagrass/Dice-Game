//
//  ViewController.swift
//  Dice Game
//
//  Created by Eddy Chen on 2019/9/26.
//  Copyright © 2019 Eddy Chen. All rights reserved.
//

//導入工具包的指令
import UIKit

//這個viewController是用來控制程式碼的部分,將程式碼都包大括號裡面
class ViewController: UIViewController {
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        //現在要加入一個判斷式來判斷用戶的動作是否確為UIEvent.EventSubtype.motionShake,若是的話就執行擲骰子的方法
        //如果if這個動作motion等於== UIEvent.EventSubtype.motionShake動作,執行大括號內的程式碼
        if motion == UIEvent.EventSubtype.motionShake{
           updateDiceImage()
        }
        
    }
    
    //關鍵字func 加上所取的名字updateDiceImage加上小括跟大括(){並將程式建在大括弧內 },如下所示
    func updateDiceImage(){
        
        randomDiceIndex1 = Int(arc4random_uniform(UInt32(diceArray.count)))
        randomDiceIndex2 = Int(arc4random_uniform(UInt32(diceArray.count)))
        
        dice1ImageView.image = UIImage(named: diceArray[randomDiceIndex1])
        dice2ImageView.image = UIImage(named: diceArray[randomDiceIndex2])
    }
    
    let diceArray = ["1","2","3","4","5","6"]  //將骰子圖片的名稱定義一個到diceArray
    //分別定義可以存放兩顆骰子變數的地方
    var randomDiceIndex1:Int = 0
    var randomDiceIndex2:Int = 0
    
    @IBOutlet weak var dice1ImageView: UIImageView!
    @IBOutlet weak var dice2ImageView: UIImageView!
    //按下介面上的button時會運行這邊的程式碼
    @IBAction func rollAction(_ sender: UIButton) {
        updateDiceImage()
    }
    
    //在程式第一次載入view時的畫面,只會出現一次
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDiceImage()
    }
    
}



