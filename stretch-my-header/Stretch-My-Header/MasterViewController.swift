//
//  MasterViewController.swift
//  Stretch-My-Header
//
//  Created by Willow Belle on 2015-11-25.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    // MARK: Constants
    static let CellHeight: CGFloat = 90

    // MARK: Properties
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!

    // MARK: Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        setup()
    }

    private func setup() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM dd"
        dateLabel.text = dateFormatter.stringFromDate(NSDate())
    }

    private func configureTableView() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = MasterViewController.CellHeight
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    // MARK: - UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Sample.stories.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! SMHTableViewCell
        
        let item = Sample.stories[indexPath.row]
        cell.configure(item)

        return cell
    }
}

