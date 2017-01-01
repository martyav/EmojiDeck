//
//  StackTableViewController.swift
//  EmojiDeck
//
//  Created by Marty Avedon on 12/22/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class StackTableViewController: UITableViewController {
    
    let cellReuseIdentifier = "cardCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Current Cards"
        
        tableView.register(CardTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        self.tableView.separatorStyle = .none
        
        let sorted = EmojiCard.discardPile.sorted(by: { $0.num.rawValue < $1.num.rawValue })
        for item in sorted {
            print(item.num.cornerLabel(),item.suit.symbol())
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmojiCard.discardPile.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! CardTableViewCell
        let thisCard = EmojiCard.discardPile[indexPath.row]
        
        cell.backgroundColor = thisCard.topNumberLabel.textColor
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell.numberAndSuitLabel.text = "\(thisCard.num.rawValue) \(thisCard.suit.symbol())"
        cell.numberAndSuitLabel.textColor = .white
        cell.numberAndSuitLabel.font = thisCard.topNumberLabel.font
        cell.numberAndSuitLabel.textAlignment = .justified
        
        return cell
    }
}
