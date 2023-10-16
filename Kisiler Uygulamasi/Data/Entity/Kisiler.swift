//
//  Kisiler.swift
//  Kisiler Uygulamasi
//
//  Created by Furkan Cingöz on 11.10.2023.
//

import Foundation

//Data modelini oluşturma
class Kisiler {
    var kisiId:Int?
    var kisiAd:String?
    var kisiTel:String?
    
    init(kisiId: Int? , kisiAd: String?, kisiTel: String?) {
        self.kisiId = kisiId
        self.kisiAd = kisiAd
        self.kisiTel = kisiTel
    }
    
    init(){
        
    }
}
