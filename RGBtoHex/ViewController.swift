//
//  ViewController.swift
//  RGBtoHex
//
//  Created by Mert Gaygusuz on 2.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtRed: UITextField!
    @IBOutlet weak var txtGreen: UITextField!
    @IBOutlet weak var txtBlue: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var lblSelectedColor: UILabel!
    var secilenIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        secilenIndex = sender.selectedSegmentIndex
        lblResult.text?.removeAll()
        txtRed.text?.removeAll()
        txtGreen.text?.removeAll()
        txtBlue.text?.removeAll()
        lblSelectedColor.backgroundColor = UIColor.white
        
        
        
        if secilenIndex == 0{
            btnConvert.setTitle("RGB - HEX Çevir", for: UIControl.State.normal)
        }
        else{
            btnConvert.setTitle("HEX - RGB Çevir", for: UIControl.State.normal)
        }
        
    }
    

    @IBAction func btnConvertClicked(_ sender: UIButton) {
        
        if secilenIndex==0{
            convertRGBtoHEX()
        }
        else{
            convertHEXtoRGB()
        }
        
        
    }
    
    func convertRGBtoHEX(){
        guard let redValue = UInt8(txtRed.text!) else {return}
        guard let greenValue = UInt8(txtGreen.text!) else {return}
        guard let blueValue = UInt8(txtBlue.text!) else {return}
                    //buraya ulaştıysa kullanıcı tüm değerleri girmiş demektir
                    let redHex = String(format: "%2X", redValue)
                    let greenHex = String(format: "%2X", greenValue)
                    let blueHex = String(format: "%2X", blueValue)
                    
                    lblResult.text = "HEX Color: #\(redHex)\(greenHex)\(blueHex)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
         
    }
    
    func convertHEXtoRGB(){
        
        guard let redValue = UInt8(txtRed.text!, radix: 16) else {return}
        guard let greenValue = UInt8(txtGreen.text!, radix: 16) else {return}
        guard let blueValue = UInt8(txtBlue.text!, radix: 16) else {return}
                    //buraya ulaştıysa kullanıcı tüm değerleri girmiş demektir
                    
                    lblResult.text = ("RED: \(redValue) GREEN: \(greenValue) BLUE: \(blueValue)")
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
      
        
    }
    
}

