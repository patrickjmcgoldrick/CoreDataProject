//
//  SportViewCell.swift
//  CoreDataProject
//
//  Created by dirtbag on 12/4/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import UIKit

class SportViewCell: UITableViewCell {

    // MARK: UI Objects
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    var mainImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return theImageView
    }()
    
    // MARK: Constructors
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        assertionFailure("This init not implemented.")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(mainImageView)
        self.addSubview(titleLabel)
        self.addSubview(detailLabel)
        
        // MARK: - Constraints
        // ImageView Constraints
        _ = NSLayoutConstraint(item: mainImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 8).isActive = true

        _ = NSLayoutConstraint(item: mainImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 8).isActive = true
        _ = NSLayoutConstraint(item: mainImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -8).isActive = true
        _ = NSLayoutConstraint(item: mainImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100).isActive = true
 
        // Title constraints
        _ = NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: .top, multiplier: 1, constant: 8).isActive = true
        _ = NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -8).isActive = true
        _ = NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: mainImageView, attribute: .trailing, multiplier: 1, constant: 16).isActive = true

        // Detail constraints
        _ = NSLayoutConstraint(item: detailLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
        _ = NSLayoutConstraint(item: detailLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -8).isActive = true
        _ = NSLayoutConstraint(item: detailLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -8).isActive = true

        _ = NSLayoutConstraint(item: detailLabel, attribute: .leading, relatedBy: .equal, toItem: mainImageView, attribute: .trailing, multiplier: 1, constant: 16).isActive = true
    }
}
