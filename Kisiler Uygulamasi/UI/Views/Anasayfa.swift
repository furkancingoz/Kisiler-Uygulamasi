//
//  ViewController.swift
//  Kisiler Uygulamasi
//
//  Created by Furkan Cingöz on 11.10.2023.
//

import UIKit

class Anasayfa: UIViewController{
    
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    @IBAction func detayButton(_ sender: Any) {
        let kisi = Kisiler(kisiId: 1, kisiAd: "test", kisiTel: "1111")
        performSegue(withIdentifier: "toDetayVC", sender: kisi)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetayVC" {
            if let kisi = sender as? Kisiler {
                let gidilecekVC = segue.destination as! KisiDetay
                gidilecekVC.kisi = kisi
            }
        }
    }
}

extension Anasayfa : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("kişi ara :\(searchText)")
    }
}
