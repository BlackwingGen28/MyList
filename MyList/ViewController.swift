//
//  ViewController.swift
//  MyList
//
//  Created by Jordan.Morgan2 on 4/1/19.
//  Copyright © 2019 Jordan.Morgan2. All rights reserved.
//

import UIKit

//-----need to add UITableViewDataSource to ViewController Superclasses
class ViewController: UIViewController, UITableViewDataSource {
    
    var myMovies:[String] = ["Forrest Gumpp", "Star Trek", "Infinity War", "A Series of Misfortunate Events"]
    var myBooks:[String] = ["Eragon Series", "The Glaring", "Ruby Holler", "Percy Jackson and the Olympians Series"]
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    
    var holderNumber = 0
    var booksDisplayed = false
    var booksOrMovies = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
    }
    
    @IBAction func switchButtonPressed(_ sender: Any) {
        switch booksOrMovies {
        case 1:
            booksOrMovies += 1
            booksDisplayed = true
            myTableView.reloadData()
        case 2:
            booksOrMovies -= 1
            booksDisplayed = false
            myTableView.reloadData()
        default:
            break
        }
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        if textFieldOutlet.text != "" {
                switch booksDisplayed {
                case true:
                    myBooks.insert(textFieldOutlet.text ?? "default", at: 0)
                    myTableView.reloadData()
                case false:
                    myMovies.insert(textFieldOutlet.text ?? "default", at: 0)
                    myTableView.reloadData()
                }
        }
    }
    
    
    @IBAction func removeButtonPressed(_ sender: Any) {
        switch booksDisplayed {
        case true:
            if myBooks.isEmpty == false {
                myBooks.removeLast()
                myTableView.reloadData()
            }
            else {
                let alert = UIAlertController(title: "EMPTY LIST", message: "IMPOSSIBRU!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.destructive, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        case false:
            if myMovies.isEmpty == false {
                myMovies.removeLast()
                myTableView.reloadData()
            }
            else {
                let alert = UIAlertController(title: "EMPTY LIST", message: "IMPOSSIBRU!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.destructive, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if booksDisplayed == false {
            holderNumber = myMovies.count
        }
        if booksDisplayed == true {
            holderNumber = myBooks.count
        }
        return holderNumber
        //return myMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = myTableView.dequeueReusableCell(withIdentifier: "myList")
        switch booksDisplayed {
        case true:
            myCell?.textLabel?.text = myBooks[indexPath.row]
        case false:
            myCell?.textLabel?.text = myMovies[indexPath.row]
        }
        return myCell!
    }
}
