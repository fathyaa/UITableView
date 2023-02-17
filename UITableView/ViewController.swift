//
//  ViewController.swift
//  UITableView
//
//  Created by Phincon on 14/02/23.
//

import UIKit

class ViewController: UIViewController  {
    var tableView : UITableView!
    var Sampo : [String] = ["Pantene", "Rejoice", "Sunsilk", "Lifebuot"]
    var Makanan : [String] = ["Indomie", "Mie Sedaap", "Kecap Bango", "Khong Guan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        Sampo.append("Kelir")
        Sampo.append("Emelon")
        Makanan.append("Ciki Taro")
    }
    
    func registerTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.register(ExampleTableViewCell.self, forCellReuseIdentifier: ExampleTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        print("this function is to register tableevieeew")
    }
    
    func sampoCount() -> Int {
        print("Sampo ada \(Sampo.count)")
        return Sampo.count
    }
    
    func makananCount() -> Int {
        print("Makanan ada \(Makanan.count)")
        return Makanan.count
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        return sampoCount()
            }
        return makananCount()
    }
            
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExampleTableViewCell.identifier, for: indexPath) as? ExampleTableViewCell else {return UITableViewCell() }
        
        cell.setupComponents()
        
        if indexPath.section == 0 {
            cell.image.image = UIImage(named: Sampo[indexPath.row])
            cell.label.text = Sampo[indexPath.row]
            
        } else {
            cell.image.image = UIImage(named: Makanan[indexPath.row])
            cell.label.text = Makanan[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Sampo"
        } else {
            return "Makanan"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print("Mau beli \(Sampo[indexPath.row])")
        } else {
            print("Mau beli \(Makanan[indexPath.row])")
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "Unilaper, est 1995"
        } else {
            return "Minora, est 1908"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    }
