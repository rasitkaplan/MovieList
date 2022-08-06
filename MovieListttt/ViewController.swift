//
//  ViewController.swift
//  MovieListttt
//
//  Created by Raşit Kaplan on 23.07.2022.
//

import UIKit
import Kingfisher
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    let url = URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=399206bd3253381d2470ee381bb850ed")
    var movie: Movie?
    var imageURL = "https://image.tmdb.org/t/p/w300"

    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        getMovies()
    }

    func getMovies() {
        let session = URLSession.shared
        guard let newURL = url else {return}
        let task = session.dataTask(with: newURL) { (data, response, error) in
                    if error != nil {
                        let alert = UIAlertController(title: "ERROR", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                        alert.addAction(okButton)
                        self.present(alert, animated: true, completion: nil)
                    }else {
                        if data != nil {
                            do {
                                let decoder = JSONDecoder()
                                let response = try decoder.decode(Movie.self, from: data!)
                                print(response)
                                self.movie = response
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                            } catch {
                                print(error)
                            }
                        }
                    }
                }
            task.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie?.results?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.nameLabel.text = movie?.results?[indexPath.row].name ?? ""
        cell.imageVieww.kf.setImage(with: URL(string: imageURL + (movie?.results?[indexPath.row].posterPath ?? "")))
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController(nibName: "DetailViewController", bundle: nil)
        vc.result = movie?.results?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
  }
