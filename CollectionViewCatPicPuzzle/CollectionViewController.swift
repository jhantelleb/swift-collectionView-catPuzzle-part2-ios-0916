//
//  PuzzleCollectionViewController.swift
//  CollectionViewCatPicPuzzle
//
//  Created by Joel Bell on 10/5/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var headerReusableView: HeaderReusableView!
    var footerReusableView: FooterReusableView!
    var sectionInsets: UIEdgeInsets!
    var spacing: CGFloat!
    var itemSize: CGSize!
    var referenceSize: CGSize!
    var numberOfRows: CGFloat!
    var numberOfColumns: CGFloat!
    var imageSlices: [UIImage] = []
    var shuffledImageSlices: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
         configureLayout()
        
        self.collectionView?.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        self.collectionView?.register(FooterReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer")
        
        collectionViewFlowLayout.minimumLineSpacing = spacing
        collectionViewFlowLayout.minimumInteritemSpacing = spacing
        collectionViewFlowLayout.sectionInset = sectionInsets
        collectionViewFlowLayout.headerReferenceSize = referenceSize
        collectionViewFlowLayout.footerReferenceSize = referenceSize
        collectionViewFlowLayout.itemSize = itemSize
        
        for counter in 1...12 {
            imageSlices.append(UIImage(named: String(counter))!)
        }
        shuffledImageSlices = imageSlices.shuffled()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: "puzzleCell", for: indexPath) as! CollectionViewCell
        
        cell.imageView.image = shuffledImageSlices[indexPath.item]
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            headerReusableView = (self.collectionView?.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)) as! HeaderReusableView
            return headerReusableView
        } else {
            footerReusableView = (self.collectionView?.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath)) as! FooterReusableView
            return footerReusableView
        }
    }
    
    func configureLayout() {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        numberOfRows = 4
        numberOfColumns = 3
        spacing = 2
        
        sectionInsets = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        referenceSize = CGSize(width: width, height: 60)
        
        let itemWidth = width / 3 - (sectionInsets.left + sectionInsets.right + spacing + spacing)/3
        
        let itemHeight = (height / 5) - (sectionInsets.top + sectionInsets.bottom + spacing + spacing + spacing) / 4
        
        itemSize = CGSize(width: itemWidth, height: itemHeight)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        self.collectionView?.performBatchUpdates({ 
//            self.shuffledImageSlices = self.imageSlices.shuffled()
//            
//            }, completion: { completed in
//               
//        })
        
        //I'll  get back to this
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "solvedSegue" {
        let destinationView = segue.destination as! SolvedViewController
            //   let indexPathItem = self.collectionView?.indexPathsForSelectedItems?[0]
        destinationView.time = footerReusableView.timerLabel.text
        destinationView.image = UIImage(named: "cats")
        }
    }
        
        func gameOver () -> Bool {
            return true
        }
}
