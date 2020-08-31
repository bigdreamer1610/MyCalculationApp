//
//  MainController.swift
//  MyCalculateApp
//
//  Created by THUY Nguyen Duong Thu on 8/19/20.
//  Copyright © 2020 THUY Nguyen Duong Thu. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    @IBOutlet var lbResult: UILabel!
    @IBOutlet var lbNum2: UILabel!
    @IBOutlet var lbOp: UILabel!
    @IBOutlet var lbNum1: UILabel!
    @IBOutlet var countDownThisLabel: UILabel!
    @IBOutlet var lbQuestion: UILabel!
    
    @IBOutlet var btnFalse: UIButton!
    @IBOutlet var btnTrue: UIButton!
    var timer:Timer!
    var timer2:Timer!
    var system: Array<Bool> = Array()
    var player: Array<Bool> = Array()

    @IBOutlet var countDownLabel: UILabel!
    var count = 15
    var count2 = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //randomCal()
        title = "Let's play"
        countDownLabel.text = String(count)
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        }
        randomCal()
        lbQuestion.text = "1"
    }
    
    //update Timer total
    @objc func update(){
        count-=1
        countDownLabel.text = String(count)
        if count < 1 || count2 < 1{
            //countDownThisLabel.text = "0"
            timer2.invalidate()
            timer.invalidate()
            goToResultScreen()
        }
    }
    
    func goToResultScreen(){
        //let scored: Int = calResult(_system: system, _player: player)
        var scored:Int = 0
        if let ques = lbQuestion.text,
            let intQues = Int(ques){
            scored = intQues
        }
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController
        vc?.name = String(scored-1)
        //present(vc!, animated: true)
        //use navigationcontroller => pick stack
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    //update Tiemr each question
    @objc func updateEach(){
        count2-=1
        countDownThisLabel.text = String(count2)
        if count2 < 1 || count < 1{
            //countDownThisLabel.text = "0"
            timer2.invalidate()
            timer.invalidate()
            //showAlert()
            goToResultScreen()
            
        }
    }
    /*
    func showAlert(){
        let alert = UIAlertController(title: "Result", message: "You scored \(calResult(_system: system, _player: player))/\(player.count) in \(15 - count)s, total: \(player.count)", preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
 */
    
    //make random calculation
    func randomCal(){
        //set label question
        if let quesNo = lbQuestion.text,
            let inQuesNo = Int(quesNo){
            lbQuestion.text = "\(inQuesNo+1)"
        }
        //set timer for each question
        count2=3
        countDownThisLabel.text = String(count2)
        if timer2 == nil {
            timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateEach), userInfo: nil, repeats: true)
        }
        //random num1
        let n1 = Int.random(in: 0..<10)
        lbNum1.text = String(n1)
        var n2=0;
        let operators = ["+","-","*","/"]
        if let op = operators.randomElement() {
            //if op != devide
            if op != "/" {
                //random num2
                n2 = Int.random(in: 0..<10)
            } else {
                n2 = Int.random(in: 1..<10)
            }
            lbOp.text = String(op)
            lbNum2.text = String(n2)
            //random op
            let randomResult = Bool.random()
            let result = doOperator(op: op, n1: n1, n2: n2)
            
            if randomResult {
                lbResult.text = "\(result)"
            } else {
                var falseResult = Int.random(in: result-10..<result+10)
                while falseResult == result{
                    falseResult = Int.random(in: result-10..<result+10)
                }
                lbResult.text = "\(falseResult)"
            }
            system.append(randomResult)
        }
    }
    
    //do the calculation
    func doOperator(op: String, n1: Int, n2: Int) -> Int{
            var result:Int = 0;
        switch op {
        case "+":
            result = n1+n2
        case "-":
            result = n1-n2
        case "/":
            result = n1/n2
        default:
            result = n1*n2
        }
        return result;
    }
    @IBAction func changeCalculation(_ sender: Any) {
        randomCal()
    }
    
    
    //choose option
    @IBAction func clickTrueOrFalse(_ sender: UIButton) {
        
        var a : Bool = false
        if sender == btnTrue{
            a = true
        }
        player.append(a)
        // player select true result
        if checkResult() {
            randomCal()
            //if player select false result
        } else {
            timer2.invalidate()
            timer.invalidate()
            goToResultScreen()
        }
        
        
        
    }
    func checkResult() -> Bool{
        if player[player.count-1] == system[player.count-1]{
            return true;
        }
        return false;
    }
    //cal final result
//    func calResult(_system: [Bool], _player: [Bool]) -> Int{
//        var kq = 0;
//        if(player.count>0){
//            for i in 0..._player.count-1 {
//                if _system[i] == _player[i]{
//                    kq=kq+1
//                }
//            }
//        }
//        return Int(kq)
//    }
    
    
    
}
