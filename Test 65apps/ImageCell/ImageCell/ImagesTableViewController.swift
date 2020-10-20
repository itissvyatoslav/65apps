//
//  ImagesTableViewController.swift
//  ImageCell
//
//  Created by Svyatoslav Vladimirovich on 15.10.2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import UIKit

class ImagesTableViewController: UIViewController{
    
    //MARK:- OUTLETS
    @IBOutlet weak var imagesTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTable()
    }
    
    private func setTable(){
        imagesTable.dataSource = self
        imagesTable.delegate = self
        let imageCell = UINib(nibName: "ImageCell",
                                  bundle: nil)
        self.imagesTable.register(imageCell,
                                forCellReuseIdentifier: "ImageCell")
    }
    
    func downloadImage(withURL url: URL, forCell cell: ImageCell) {
        DispatchQueue.global(qos: .userInitiated).async {
            let imageData = NSData.init(contentsOf: url)
            DispatchQueue.main.async {
                cell.cellImageView.image = UIImage(data: imageData! as Data)
            }
        }
    }
}

//MARK:- TableView Delegat and DataSource

extension ImagesTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
        if let url = URL(string: "http://placehold.it/375x150?text=\(indexPath.row + 1)") {
            downloadImage(withURL: url, forCell: cell)
        }
        return cell
    }
}
