//
//  ViewController.swift
//  Magic Square
//
//  Created by Вячеслав Бирюков on 01.03.19.
//  Copyright © 2019 Вячеслав Бирюков. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var Cell1: NSTextField!
    @IBOutlet weak var Cell2: NSTextField!
    @IBOutlet weak var Cell3: NSTextField!
    @IBOutlet weak var Cell4: NSTextField!
    @IBOutlet weak var Cell5: NSTextField!
    @IBOutlet weak var Cell6: NSTextField!
    @IBOutlet weak var Cell7: NSTextField!
    @IBOutlet weak var Cell8: NSTextField!
    @IBOutlet weak var Cell9: NSTextField!

    var cellGrid: Array<Array<NSTextField>> = []
    var squareSize: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cellGrid = [
            [Cell1, Cell2, Cell3],
            [Cell4, Cell5, Cell6],
            [Cell7, Cell8, Cell9]
        ]

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func getMagicNumber() -> Int {
        return (self.squareSize * (self.squareSize ^ 2 + 1)) / 2
    }
    
    func cleanCellGrid() {
        for r in 0...2 {
            for c in 0...2 {
                self.cellGrid[r][c].stringValue = ""
            }
        }
    }
    
    @IBAction func FillTheCubeButton(_ sender: NSButtonCell) {
        var row = 0
        var col = 1
        
        self.cleanCellGrid()
        
        for i in 1..<10 {
            let currentRow = row
            let currentCol = col
            
            self.cellGrid[row][col].stringValue = String(i)
            
            row -= 1
            col += 1

            
            if (col >= self.squareSize) { col = 0 }
            if (row < 0) { row = self.squareSize - 1}
            else if (row >= self.squareSize) { row = 0 }
            
            if (!self.cellGrid[row][col].stringValue.isEmpty) {
                col = currentCol
                row = currentRow + 1 < self.squareSize ? currentRow + 1 : self.squareSize - 1
            }
        }
    }
}

