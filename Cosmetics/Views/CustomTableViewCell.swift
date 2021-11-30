//
//  CastomTableViewCell.swift
//  Cosmetics
//
//  Created by Alisa Ts on 30.11.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var imageMakeUpView: UIImageView!
    @IBOutlet var brandLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    func configure(with makeUp: MakeUpElement) {
        
        guard let brand = makeUp.brand?.capitalized else { return }
        brandLabel.text = brand
        nameLabel.text = makeUp.name
        priceLabel.text = "Цена: \(makeUp.price ?? "0") $"
        
        DispatchQueue.global().async {
            let strigURL = makeUp.imageLink
            guard let url = URL(string: strigURL) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.imageMakeUpView.image = UIImage(data: imageData)
            }
        }
    }

}
