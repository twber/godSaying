//
//  ViewController.swift
//  godSaying
//
//  Created by Bernice TSAI on 2020/8/31.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var wordTwo: UILabel!
    @IBOutlet weak var wordOne: UILabel!
    @IBOutlet weak var godImage: UIImageView!
    @IBOutlet weak var reAskButton: UIButton!
    @IBOutlet weak var q2Slider: UISlider!
    @IBOutlet weak var q1Slider: UISlider!
    @IBOutlet weak var loanTextField: UITextField!
    @IBOutlet weak var instructLabel: UILabel!
    @IBOutlet weak var giftSegmentedControl: UISegmentedControl!
    @IBOutlet weak var isStudent: UISwitch!
    @IBOutlet weak var giftImage: UIImageView!
    @IBOutlet weak var isReturned: UISwitch!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var followUpImage: UIImageView!
    @IBOutlet weak var notKFCImage: UIImageView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder();
    return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        giftSegmentedControl.selectedSegmentIndex = 0
        giftImage.image = UIImage(named: "friedchicken")
        notKFCImage.isHidden = true
        //instructLabel.isHidden = true
        //useless
        reAskButton.isHidden = true
        q1Slider.isHidden = true
        q2Slider.isHidden = true
        
        // Do any additional setup after loading the view.
    }

    @IBAction func changeGift(_ sender: UISegmentedControl) {
        let index = giftSegmentedControl.selectedSegmentIndex
        switch index {
        case 0: // KFC
            giftImage.image = UIImage(named: "friedchicken")
            notKFCImage.isHidden = true
        case 1:// Napoli
            giftImage.image = UIImage(named: "friedchicken1")
            notKFCImage.isHidden = true
        case 2: // McDonald
            giftImage.image = UIImage(named: "friedchicken2")
            notKFCImage.image = UIImage(named: "notKFC")
            notKFCImage.isHidden = false

        default:
            return
        }
    }
    @IBAction func askGod(_ sender: UIButton) {
        godImage.isHidden = true
        wordTwo.isHidden = true
        wordOne.isHidden = true
        let loanAmount:Int  = Int(loanTextField.text!)!
        if loanAmount != nil, loanAmount != 0{
            if loanAmount <= 2000 && isStudent.isOn == true && isReturned.isOn == true {
                resultImage.image = UIImage (named: "yes")
                followUpImage.image = UIImage(named: "qrcode")
                instructLabel.text = "立即掃碼申請，一天撥款，安心免息"
                //instructLabel.isHidden = false
            }else {
                resultImage.image = UIImage( named: "no")
                followUpImage.image = UIImage(named: "email")
                instructLabel.text = "條件不符，請掃碼來信廟公討論"
            }
            }else {
                resultImage.image = UIImage (named: "donotask")
                followUpImage.image = UIImage(named: "notalk")
                instructLabel.text = "甭鬧阿"
        }
    
    }

    /*@IBAction func reAsk(_ sender: UIButton) {
        loanTextField.text = ""
        //isStudent.isOn = false
        //isReturned.isOn = false
        q1Slider.value = 0
        q2Slider.value = 0
        resultImage.isHidden = true
        followUpImage.isHidden = true
        instructLabel.isHidden = true
    }*/
}


