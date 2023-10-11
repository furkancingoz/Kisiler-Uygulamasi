//
//  KisiKayit.swift
//  Kisiler Uygulamasi
//
//  Created by Furkan Cingöz on 11.10.2023.
//

import UIKit

class KisiKayit: UIViewController {
    @IBOutlet weak var telefonNumarasi: UITextField!
    @IBOutlet weak var kisiAdi: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func kaydetButton(_ sender: Any) {
        if let ka = kisiAdi.text , let kt = telefonNumarasi.text {
            save(inputAd: ka, inputTel: kt)
        }
    }
    

    func save(inputAd:String,inputTel:String){
        print("Kaydedilen: \(inputAd) - \(inputTel)")
    }

}
