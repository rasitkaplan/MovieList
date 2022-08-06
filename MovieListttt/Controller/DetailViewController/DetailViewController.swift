//
//  DetailViewController.swift
//  MovieListttt
//
//  Created by Raşit Kaplan on 23.07.2022.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    var result: Result?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var firstAirDateLabel: UILabel!
    @IBOutlet weak var originCountryLabel: UILabel!
    @IBOutlet weak var originalLanguageLabel: UILabel!
    @IBOutlet weak var originalNameLabel: UILabel!
    @IBOutlet weak var backDropPathImageView: UIImageView!
    @IBOutlet weak var posterPathImageView: UIImageView!

    var imageURL = "https://image.tmdb.org/t/p/w300"

    override func viewDidLoad() {
        super.viewDidLoad()
        overviewLabel.text = "Overview :  \(result?.overview ?? "")"
        nameLabel.text = "Name : \(result?.name ?? "")"
        firstAirDateLabel.text = "Construction Date: \(result?.firstAirDate ?? "")"
        originalLanguageLabel.text = "Language: \(result?.originalLanguage ?? "")"
        originalNameLabel.text = "OrijinalName : \(result?.originalName ?? "")"
        posterPathImageView.kf.setImage(with: URL(string: imageURL + (result?.posterPath ?? "")))
        backDropPathImageView.kf.setImage(with: URL(string: imageURL + (result?.backdropPath ?? "")))

    }
}
