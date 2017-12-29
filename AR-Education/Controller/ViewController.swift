//
//  ViewController.swift
//  AR-Education
//
//  Created by It's Now or Never. on 12/28/17.
//  Copyright © 2017 Dhruv Rajesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
   let subjectInfo = SubjectsInformation()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // setting up the delegate and data source methods
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView?.backgroundColor = .clear
        //collectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        collectionView?.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }


    // Setting up the basics
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subjectInfo.subjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! PhotoCell
        cell.imageView.image = UIImage(named: subjectInfo.subjectImages[indexPath.row])
        cell.captionLabel.text = subjectInfo.subjects[indexPath.row]
        cell.commentLabel.text = subjectInfo.commentInfo[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 7.0
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.cornerRadius = 6
        performSegue(withIdentifier: "detailedView", sender: self)
    }
    

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0
        cell?.layer.borderColor = UIColor.clear.cgColor
        cell?.layer.cornerRadius = 0

    }


}

