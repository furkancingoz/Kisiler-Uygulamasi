//
//  KisiDetay.swift
//  Kisiler Uygulamasi
//
//  Created by Furkan Cingöz on 11.10.2023.
//

import UIKit

class KisiDetay: UIViewController {
    @IBOutlet weak var updateName: UITextField!
    @IBOutlet weak var updateNumber: UITextField!
    var kisi:Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let k = kisi {
            updateName.text = k.kisiAd
            updateNumber.text = k.kisiTel
        }
    }
    
    @IBAction func updateButton(_ sender: Any) {
        if let ka = updateName.text , let kt = updateNumber.text, let k = kisi {
            guncelle(inputId: k.kisiId!, inputAd: ka, inputTel: kt)
        }
    }
    
    func guncelle(inputId:Int,inputAd:String,inputTel:String){
        print("Güncellenen: \(inputId) - \(inputAd) - \(inputTel)")
    }
}
