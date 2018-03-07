//
//  TableCell.swift
//  CollectionInsideTable
//
//  Created by Ashwani Sharma on 07/03/18.
//  Copyright © 2018 Ashwani Sharma. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    func setCollectionViewDataSourceDelegate(_ indexPath: IndexPath) {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        DispatchQueue.main.async(execute: {
            self.collectionView.reloadData()
        });
    }
    
    // MARK: UICollectionView Delegate And Datasource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let nwCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        return nwCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.collectionView.frame.size.width, height: 200) // need to set dynamic values
        return size
    }
    
}
