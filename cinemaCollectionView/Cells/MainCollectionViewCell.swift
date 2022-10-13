//
//  MainCollectionViewCell.swift
//  cinemaCollectionView
//
//  Created by Dmytro Gavrylov on 19.09.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    var movie: Movies? {
        didSet {
            dateLabel.text = movie?.duration
            nameLabel.text = movie?.name
            ratingLabel.text = movie?.raiting
            if let image = movie?.imgPath {
                imageView.downloaded(from: URL (string: (movie?.imgPath)!)!)
                imageView.image = UIImage(named: image)
            }
        }
    }
}
