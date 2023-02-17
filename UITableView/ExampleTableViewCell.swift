//
//  ExampleTableViewCell.swift
//  UITableView
//
//  Created by Phincon on 15/02/23.
//

import UIKit

class ExampleTableViewCell: UITableViewCell {
    static let identifier = "ExampleTableView"
    
    
    var label: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    var subtitleLabel: UILabel = {
        let lbs = UILabel()
        return lbs
    }()
    
    var image: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    var stripLabel: UILabel = {
        let slb = UILabel()
        return slb
    }()
    
    var button: UIButton = {
        let btn = UIButton(type: .system)
        return btn
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupComponents(){
        self.addSubview(label)
        self.addSubview(subtitleLabel)
        self.addSubview(image)
        self.addSubview(stripLabel)
        self.addSubview(button)
        
        setupLabel()
//        setupImage()
        setupButton()
        
    }
    
    func setupLabel() {
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        self.label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        
        self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.subtitleLabel.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 8).isActive = true
        self.subtitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        self.subtitleLabel.text = "Dummy text"
        
        self.stripLabel.translatesAutoresizingMaskIntoConstraints = false
        self.stripLabel.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 8).isActive = true
        self.stripLabel.leftAnchor.constraint(equalTo: subtitleLabel.rightAnchor, constant: 8).isActive = true
        self.stripLabel.text = "- Hola"
    }
    
    
    func setupImage() {
        self.image.translatesAutoresizingMaskIntoConstraints = false
        self.image.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        self.image.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        self.image.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.image.heightAnchor.constraint(equalToConstant: 70).isActive = true
        self.image.layer.cornerRadius = 35
        self.image.layer.masksToBounds = true
    }
    
    func setupButton() {
        self.button.frame = CGRect(x: 280, y: 20, width: 70, height: 30)
        self.button.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        self.button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40).isActive = true
        self.button.setTitle("Ola", for: .normal)
        self.button.setTitle("Pressed + Hold", for: .highlighted)
        self.button.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00)
        self.button.layer.cornerRadius = 10
        self.button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(_sender:UIButton!){
        print("Oi")
    }

}
