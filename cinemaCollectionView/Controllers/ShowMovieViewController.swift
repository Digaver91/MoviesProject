//
//  ShowMovieViewController.swift
//  cinemaCollectionView
//
//  Created by Dmytro Gavrylov on 20.09.2022.
//

import UIKit

class ShowMovieViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var movie: Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData(movie: movie!)
        
    }
    private func loadData(movie: Movies) {
        self.imageView.downloaded(from: URL(string: movie.imgPath!)!)
        self.nameLabel.text = movie.name
        
    }
}
