//
//  ViewController.swift
//  SplitCalc
//
//  Created by 黒澤清和 on 2016/02/12.
//  Copyright © 2016年 黒澤清和. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate, UIPickerViewDelegate {

    @IBOutlet weak var totalMoney: UITextField!
    @IBOutlet weak var people: UITextField!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var shortage: UILabel!
    @IBOutlet weak var pickerVIew: UIPickerView!
    var unitArray = ["1円","10円","100円","1000円"]
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
        var kirisage = 0
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
        switch pickerVIew.selectedRowInComponent(0) {
        case 0:
            x1 / 1
        case 1:
            x1 / 10
            kirisage = x1 % 10
        case 2:
            x1 / 100
            kirisage = x1 % 100
        case 3:
            x1 / 1000
            kirisage = x1 % 1000
        default:
            break
        }
        
        let tmpAns = x1 / x2
        let amari = x1 % x2
        switch pickerVIew.selectedRowInComponent(0) {
        case 0:
            tmpAns*1
            amari*1
        case 1:
            tmpAns*10
            amari*10 + kirisage
        case 2:
            tmpAns*100
            amari*100 + kirisage
        case 3:
            tmpAns*1000
            amari*1000 + kirisage
        default:
            break
        }
        answer.text = String(tmpAns)
        shortage.text = String(amari)
    }
    
    @IBAction func tapScreen(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return unitArray.count;
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return unitArray[row]
    }
}

