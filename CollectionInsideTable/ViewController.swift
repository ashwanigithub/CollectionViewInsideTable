//
//  ViewController.swift
//  CollectionInsideTable
//
//  Created by Ashwani Sharma on 07/03/18.
//  Copyright © 2018 Ashwani Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var tableview: UITableView!
    var sectionHeader = SectionTableHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.estimatedRowHeight = 44.0
        self.tableview.rowHeight = UITableViewAutomaticDimension
        self.tableview.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        let nib = UINib(nibName: "SectionTableHeaderView", bundle: nil)
        self.tableview.register(nib, forHeaderFooterViewReuseIdentifier: "SectionTableHeaderView")

    }
    //MARK:- TableView Delegates and Datasource
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionTableHeaderView") as! SectionTableHeaderView
        return sectionHeader
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 210;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
            let identifier: String = "TableCell"
            var customCell : TableCell!
            if customCell == nil {
                customCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TableCell
                customCell.setCollectionViewDataSourceDelegate(indexPath)
            }
            return customCell
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

