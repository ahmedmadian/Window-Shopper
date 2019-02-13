//
//  ViewController.swift
//  Window Shopper
//
//  Created by Madian on 2/12/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import UIKit

class MainVC: UIViewController {


    
    
    // MARK: ----------------- Outlets -----------------------
    @IBOutlet weak var WageTextField: UITextField!
    @IBOutlet weak var ItemPriceTextField: UITextField!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var HoursLabel: UILabel!
    
    
    //MARK: ----------------- Actions -----------------------
    
    @objc func calculateButton_touchUpInside(){
        let hours = getHours(fromWageTextField: WageTextField, andPriceTextField: ItemPriceTextField)
        UpdateView(withHours: hours)
    }
    
    @IBAction func clearButton_touchUpInside(_ sender: UIButton) {
       clearView()
    }
    
    
    //MARK: ----------------- System CallBacks -----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpCalculateButton()
        ResultLabel.isHidden = true
        HoursLabel.isHidden = true
        
    }
    //MARK: ----------------- Methods -----------------------
    func setUpCalculateButton() {
        //create KeyboardButton
        let  calculateButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calculateButton.backgroundColor = #colorLiteral(red: 1, green: 0.4639565164, blue: 0.09786576566, alpha: 1)
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        calculateButton.addTarget(self, action: #selector(MainVC.calculateButton_touchUpInside), for: .touchUpInside)
        
        WageTextField.inputAccessoryView = calculateButton
        ItemPriceTextField.inputAccessoryView = calculateButton
    }
    
    func clearView() {
        WageTextField.text = ""
        ItemPriceTextField.text = ""
        ResultLabel.isHidden = true
        HoursLabel.isHidden = true
    }
   
    func getHours(fromWageTextField wageTextField: UITextField, andPriceTextField PriceTextField: UITextField) -> Int {
        if let wageText = wageTextField.text, let PriceText = PriceTextField.text{
            if let wage = Double(wageText), let price = Double(PriceText) {
                let res  = Wage.getHours(forWage: wage, andPrice: price)
                return res
            }
        }
        return Int()
    }
    
    func UpdateView(withHours hours: Int){
        view.endEditing(true)
        ResultLabel.isHidden = false
        HoursLabel.isHidden = false
        ResultLabel.text = "\(hours)"
    }
    
    


}

