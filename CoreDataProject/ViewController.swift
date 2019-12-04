//
//  ViewController.swift
//  CoreDataProject
//
//  Created by dirtbag on 12/3/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // create UI objects
    var createButton: UIButton = {
        var button = UIButton()
        button.setTitle("Create", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var readButton: UIButton = {
        var button = UIButton()
        button.setTitle("Read", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let updateButton: UIButton = {
        var button = UIButton()
        button.setTitle("Update", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let deleteButton: UIButton = {
        var button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let tableView = UITableView()
    
    // Datasource
    var sportsData = [Sport]()
    
    // initialize UI Views
    override func viewDidLoad() {
        super.viewDidLoad()
        // init Tableview
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 100)
        tableView.dataSource = self
        
        view.backgroundColor = .systemTeal
        view.addSubview(tableView)
        view.addSubview(createButton)
        view.addSubview(readButton)
        view.addSubview(updateButton)
        view.addSubview(deleteButton)

        
        setupConstraints()
        
        // register Button actions
        createButton.addTarget(self, action: #selector(actionCreate), for: .touchUpInside)
        readButton.addTarget(self, action: #selector(actionRead), for: .touchUpInside)
        updateButton.addTarget(self, action: #selector(actionUpdate), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(actionDelete), for: .touchUpInside)

    }
    
    private func setupConstraints() {
        let constraints = [
            // table constraints
            NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: -200.0),

            // button constraints
            NSLayoutConstraint(item: updateButton, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 60.0),
            NSLayoutConstraint(item: updateButton, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: -60.0),
            
            NSLayoutConstraint(item: createButton, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 60.0),
            NSLayoutConstraint(item: createButton, attribute: .bottom, relatedBy: .equal, toItem: updateButton, attribute: .bottom, multiplier: 1.0, constant: -60.0),

            NSLayoutConstraint(item: deleteButton, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: -60.0),
            NSLayoutConstraint(item: deleteButton, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: -60.0),

            NSLayoutConstraint(item: readButton, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: -60.0),
            NSLayoutConstraint(item: readButton, attribute: .bottom, relatedBy: .equal, toItem: deleteButton, attribute: .bottom, multiplier: 1.0, constant: -60.0)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc
    private func actionCreate() {

        let sport0 = SportModel()
        sport0.name = "Beach Volleyball"
        sport0.desc = "Beach volleyball is a team sport played by two teams of two players on a sand court divided by a net."
        sport0.imageURL = nil
        sport0.imageName = "volleyball"

        let sport1 = SportModel()
        sport1.name = "Surfing"
        sport1.desc = "Surfing is a surface water sport in which the wave rider, referred to as a surfer, rides on the forward or face of a moving wave, which usually carries the surfer towards the shore."
        sport1.imageURL = nil
        sport1.imageName = "surfing"
        
        let sport2 = SportModel()
        sport2.name = "Waterpolo"
        sport2.desc = "Water polo is a competitive team sport consiting of four quarters in which the two teams attempt to score goals by throwing the ball into the opposing team's goal."
        sport2.imageURL = nil
        sport2.imageName = "waterpolo"
        
        let sport3 = SportModel()
        sport3.name = "Water Skiiing"
        sport3.desc = "Water skiing is a surface water sport in which an individual is pulled behind a boat or a cable ski installation over a body of water, skimming the surface on two skis or one ski."
        sport3.imageURL = nil
        sport3.imageName = "waterskiing"

        CoreDataSaveOps.shared.saveSport(sportObject: sport0)
        CoreDataSaveOps.shared.saveSport(sportObject: sport1)
        CoreDataSaveOps.shared.saveSport(sportObject: sport2)
        CoreDataSaveOps.shared.saveSport(sportObject: sport3)
    }
 
    @objc
    private func actionRead() {
        let sports = CoreDataFetchOps.shared.getAllSports()
        for sport in sports {
            print("\(sport.name!): \(sport.desc!)")
            print("\t\(sport.imageURL)")
        }
        print(sports.count)
        sportsData = sports
        tableView.reloadData()
    }
    
    @objc
    private func actionUpdate() {
        CoreDataUpdateOps.shared.updateImageURL(name: "Waterpolo", url: "https://www.ocregister.com/wp-content/uploads/2019/11/OCR-L-HSPOLO-RDP-1114-01-LO-1.jpg?w=512")
    }
    
    @objc
    private func actionDelete() {
        CoreDataDeleteOps.shared.deleteAllSports()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sportsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        let sport = sportsData[indexPath.row]
        cell.textLabel?.text = sport.name
        cell.detailTextLabel?.lineBreakMode = .byWordWrapping
        cell.detailTextLabel?.text = sport.desc
        if let imageName = sport.imageName, let imageView = cell.imageView {
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            let image = UIImage(named: imageName)
            if let image = image {
                imageView.image = cropToBounds(image: image, width: 100.0, height: 100.0)
            }
            if let urlString = sport.imageURL {
                // load remote image in background
                ImageLoader.shared.loadImageInto(imageView: imageView, urlString: urlString)
            }
        }
        return cell
    }
    
    // from: https://stackoverflow.com/questions/32041420/cropping-image-with-swift-and-put-it-on-center-position
    func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {

        let cgimage = image.cgImage!
        let contextImage: UIImage = UIImage(cgImage: cgimage)
        let contextSize: CGSize = contextImage.size
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(width)
        var cgheight: CGFloat = CGFloat(height)

        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }

        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)

        // Create bitmap image from context using the rect
        let imageRef: CGImage = cgimage.cropping(to: rect)!

        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)

        return image
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
