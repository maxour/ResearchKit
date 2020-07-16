//
//  CustomizedTableViewController.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/15.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import UIKit

class CustomizedTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var bodyTableView: UITableView!
    

    private let items = [TableViewCell.Item(title: "Short title",
                                            date: nil,
                                            description: nil,
                                            imageUrl: nil),
                         TableViewCell.Item(title: "Short title",
                                            date: "April 7th, 2019",
                                            description: nil,
                                            imageUrl: nil),
                         TableViewCell.Item(title: "Short title",
                                            date: "April 7th, 2019",
                                            description: "The layout of arranged views",
                                            imageUrl: nil),
                         TableViewCell.Item(title: "Short title",
                                            date: "April 7th, 2019",
                                            description: "The layout of arranged views",
                                            imageUrl: nil),
                         TableViewCell.Item(title: "Short title",
                                            date: nil,
                                            description: nil,
                                            imageUrl: URL(string: "https://via.placeholder.com/320x180.png?text=Sample+Image")),
                         TableViewCell.Item(title: "Short title",
                                            date: "April 7th, 2019",
                                            description: nil,
                                            imageUrl: URL(string: "https://via.placeholder.com/320x180.png?text=Sample+Image")),
                         TableViewCell.Item(title: "Short title",
                                            date: "April 7th, 2019",
                                            description: "The layout of arranged views",
                                            imageUrl: URL(string: "https://via.placeholder.com/320x180.png?text=Sample+Image")),
                         TableViewCell.Item(title: "Short title",
                                            date: "April 7th, 2019",
                                            description: "The layout of arranged views",
                                            imageUrl: URL(string: "https://via.placeholder.com/320x180.png?text=Sample+Image")),
                         
                         TableViewCell.Item(title: "Long title: A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose.",
                                            date: nil,
                                            description: nil,
                                            imageUrl: nil),
                         TableViewCell.Item(title: "Long title: A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose.",
                                            date: "April 7th, 2019",
                                            description: nil,
                                            imageUrl: nil),
                         TableViewCell.Item(title: "Long title: A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose.",
                                            date: "April 7th, 2019",
                                            description: "The appearance of labels is configurable, and they can display attributed strings, allowing you to customize the appearance of substrings within a label. You can add labels to your interface programmatically or by using Interface Builder.",
                                            imageUrl: nil),
                         TableViewCell.Item(title: "Long title: A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose.",
                                            date: "April 7th, 2019",
                                            description: "The appearance of labels is configurable, and they can display attributed strings, allowing you to customize the appearance of substrings within a label. You can add labels to your interface programmatically or by using Interface Builder.",
                                            imageUrl: nil),
                         TableViewCell.Item(title: "Long title: A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose.",
                                            date: nil,
                                            description: nil,
                                            imageUrl: URL(string: "https://via.placeholder.com/320x180.png?text=Sample+Image")),
                         TableViewCell.Item(title: "Long title: A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose.",
                                            date: "April 7th, 2019",
                                            description: nil,
                                            imageUrl: URL(string: "https://via.placeholder.com/320x180.png?text=Sample+Image")),
                         TableViewCell.Item(title: "Long title: A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose.",
                                            date: "April 7th, 2019",
                                            description: "The appearance of labels is configurable, and they can display attributed strings, allowing you to customize the appearance of substrings within a label. You can add labels to your interface programmatically or by using Interface Builder.",
                                            imageUrl: URL(string: "https://via.placeholder.com/320x180.png?text=Sample+Image")),
                         TableViewCell.Item(title: "Long title: A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose.",
                                            date: "April 7th, 2019",
                                            description: "The appearance of labels is configurable, and they can display attributed strings, allowing you to customize the appearance of substrings within a label. You can add labels to your interface programmatically or by using Interface Builder.",
                                            imageUrl: URL(string: "https://via.placeholder.com/320x180.png?text=Sample+Image"))]

    override func viewDidLoad() {
        super.viewDidLoad()
        bodyTableView.estimatedRowHeight = 44
        bodyTableView.rowHeight = UITableView.automaticDimension
        bodyTableView.separatorStyle = .none
        bodyTableView.register(VerticalTableViewCell.self, forCellReuseIdentifier: "vertical")
        bodyTableView.register(HorizontalTableViewCell.self, forCellReuseIdentifier: "horizontal")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "vertical", for: indexPath) as! VerticalTableViewCell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "horizontal", for: indexPath) as! HorizontalTableViewCell
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath) as! TableViewCell
        }
        cell.configure(with: items[indexPath.row])
        return cell
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
