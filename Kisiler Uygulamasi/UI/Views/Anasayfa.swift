//
//  ViewController.swift
//  Kisiler Uygulamasi
//
//  Created by Furkan Cingöz on 11.10.2023.
//

import UIKit

class Anasayfa: UIViewController{
    
    @IBOutlet weak var kisilerTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var kisilerListesi = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: YETKİLENDİRME
        searchBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        //MARK: KİŞİLERİ TANIMLAMA
        let k1 = Kisiler(kisiId: 1, kisiAd: "Ahmet", kisiTel: "1111")
        let k2 = Kisiler(kisiId: 3, kisiAd: "Aysel", kisiTel: "2222")
        let k3 = Kisiler(kisiId: 3, kisiAd: "Bora", kisiTel: "3333")
        let k4 = Kisiler(kisiId: 4, kisiAd: "Furkan", kisiTel: "4444")
        let k5 = Kisiler(kisiId: 5, kisiAd: "Teemo", kisiTel: "5555")
        
        //MARK: KİŞİLERİ ARRAY'E EKLEME
        kisilerListesi.append(k1)
        kisilerListesi.append(k2)
        kisilerListesi.append(k3)
        kisilerListesi.append(k4)
        kisilerListesi.append(k5)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
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

//Tableview ayarları
extension Anasayfa : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return kisilerListesi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisiler = kisilerListesi[indexPath.row]

        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucre
        hucre.labelKisiAd.text = kisiler.kisiAd
        hucre.labelKisiTel.text = kisiler.kisiTel
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]
       performSegue(withIdentifier: "toDetayVC", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil") {contextualAction,view,bool in
            let kisi = self.kisilerListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme işlemi", message: "\(kisi.kisiAd!) silinicektir onaylıyor musunuz", preferredStyle: .alert)
            let iptalAction  = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            let okAction  = UIAlertAction(title: "Onaylıyorum", style: .destructive) { action in
                print("sildi")
                
            }
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
