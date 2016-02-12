//
//  ViewController.swift
//  SplitCalc
//
//  Created by 黒澤清和 on 2016/02/12.
//  Copyright © 2016年 黒澤清和. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var totalMoney: UITextField!
    @IBOutlet weak var people: UITextField!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var shortage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        totalMoney.delegate = self
        totalMoney.keyboardType = UIKeyboardType.NumberPad
        people.delegate = self
        people.keyboardType = UIKeyboardType.NumberPad
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calcButton(sender: AnyObject) {
        var x1 = 0
        var x2 = 0
        if(totalMoney.text! != ""){
            x1 = Int(totalMoney.text!)!
        }else{
            x1 = 0
        }
        if(people.text! != ""){
           x2 = Int(people.text!)!
        }else{
            x2 = 1
        }
        let tmpAns = x1 / x2
        let amari = x1 % x2
        answer.text = String(tmpAns)
        shortage.text = String(amari)
    }
    @IBAction func tapScreen(sender: AnyObject) {
    }
}

