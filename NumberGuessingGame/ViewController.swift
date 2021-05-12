//
//  ViewController.swift
//  NumberGuessingGame
//
//  Created by 吳世馨 on 2021/5/2.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var chanceLabel: UILabel!
    @IBOutlet weak var inputNumber: UITextField!
    @IBOutlet weak var hintLabel: UILabel!
    
    var chance = 3 //機會次數
    
    func addTapGesture(){
           let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
           view.addGestureRecognizer(tap)
       }
   @objc private func hideKeyboard(){
           self.view.endEditing(true)
       }

    override func viewDidLoad() {
        
        addTapGesture()
        super.viewDidLoad()
        minLabel.text = String(1)
        maxLabel.text = String(200)
        chance = 5
        inputNumber.text = nil
        chanceLabel.text = "還剩\(chance)次機會"
        hintLabel.text = "猜猜我的體重看吧！"
    }

    func guess() {
        if let input = Int(inputNumber.text!) { //1.輸入的必須是數字，才會做後續的動作。
            if chance > 0 { //2.剩餘的機會必須大於0，如果機會剩0次，必須重來。
                if input >= Int(minLabel.text!)! && input <= Int(maxLabel.text!)! { //3.判斷輸入的數字是否有在指定範圍，否則無法繼續。
                    chance -= 1 //chance = chance - 1
                    if input == 129 { //4.答案正確時所顯示的字串
                        hintLabel.text = "答對了！"
                    } else {
                        if chance == 0{ //5.機會用完後請點鼻子重來
                            hintLabel.text = "機會都用完了！請點鼻子重新開始"
                        } else {
                            if input > 129 { //6.機會還未用完時的提醒字串
                                maxLabel.text = "\(input)"
                                hintLabel.text = "\(input) 我有那麼胖嗎！"
                            }else if input < 129 {
                                minLabel.text = "\(input)"
                                hintLabel.text = "\(input) 你真的認為我那麼瘦嗎？"
                            }
                            inputNumber.text = nil}
                    }
                } else {
                    hintLabel.text = "請輸入範圍內的數字！"
                }
            } else {
                hintLabel.text = "機會都用完了！其實答案是129"
            }
            chanceLabel.text = "還剩\(chance)次機會"
        }
    }
    
    
    @IBAction func goButton(_ sender: Any) {
        guess()
    }
    @IBAction func restartButton(_ sender: Any) {
        viewDidLoad()
    }
    @IBAction func dismissKeyboard(_ sender: Any) {
    }
}

