//
//  ViewController.swift
//  KMStackView
//
//  Created by beCooler on 04/28/2019.
//  Copyright (c) 2019 beCooler. All rights reserved.
//

import UIKit
import KMStackView

class ViewController: UIViewController {

    
    var stackView = KMStackView()
    
    
    var testViews: [UIView] = []
    
    private lazy var lab1: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.white
        lab.numberOfLines = 0
        lab.text = "越人歌\n今夕何夕兮，搴舟中流。\n今日何日兮，得与王子同舟。\n蒙羞被好兮，不訾诟耻。\n心几烦而不绝兮，得知王子。\n山有木兮木有枝，心悦君兮君不知。"
        lab.backgroundColor = UIColor.blue
        return lab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        stackView.contentInset = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        stackView.rowSpacing = 6
        
        testViews.append(lab1)
        stackView.addRow(lab1)
        
        view.insertSubview(stackView, at: 0)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        stackView.frame = view.bounds
    }
    
    
    
    @IBAction func addOneRow(_ sender: Any) {
        
        let v = TestView()
        testViews.append(v)
        stackView.addRow(v)
    }
    
    
    
    @IBAction func addSomeRows(_ sender: Any) {
        
        for _ in 0..<4 {
            addOneRow(UIButton())
        }
    }
    
    
    
    @IBAction func removeOneRow(_ sender: Any) {
        
        let lastrow = testViews.removeLast()
        stackView.removeRow(lastrow)
    }
    
    
    @IBAction func removeSomeRows(_ sender: Any) {
        
        guard !testViews.isEmpty else { return }
        
        var rows: [UIView] = []
        
        if testViews.count == 1 {
            let v1 = testViews.removeLast()
            rows.append(v1)
        } else if testViews.count >= 2 {
            let v1 = testViews.removeLast()
            rows.append(v1)
            let v2 = testViews.removeLast()
            rows.append(v2)
        }
        stackView.removeRows(rows)
    }
    
}

