//
//  KMStackView.swift
//  KMStackView
//
//  Created by 袁金龙 on 2019/4/28.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class KMStackView: UIScrollView {

    
    private var _rows: [UIView] = []
    
    private var _roww: CGFloat = 0
    private var _rowx: CGFloat = 0
    private var _contentInset: UIEdgeInsets = .zero
    
    override public var contentInset: UIEdgeInsets {
        get {
            return _contentInset
        }
        set {
            _contentInset = newValue
            if !_rows.isEmpty {
                layoutSubviews()
            }
        }
    }
    
    
    public var rowSpacing: CGFloat = 0 {
        didSet {
            if !_rows.isEmpty {
                layoutSubviews()
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
}

extension KMStackView {
    private func setupSubviews() -> Void {
        
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        contentInset = .zero
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        _rowx = _contentInset.left
        _roww = frame.width - _contentInset.left - _contentInset.right
        
        var previousRow: UIView? = nil
        for row in _rows {
            defer {
                previousRow = row
            }
            
            if let pRow = previousRow {
                row.frame = CGRect(x: _rowx, y: pRow.frame.maxY + rowSpacing, width: _roww, height: row.intrinsicContentSize.height)
            } else {
                row.frame = CGRect(x: _rowx, y: _contentInset.top, width: _roww, height: row.intrinsicContentSize.height)
            }
        }
        
        if let pRow = previousRow {
            contentSize = CGSize(width: frame.width, height: pRow.frame.maxY + _contentInset.bottom)
        } else {
            contentSize = .zero
        }
        previousRow = nil
    }
}

public extension KMStackView {
    
    func addRow(_ row: UIView) -> Void {
        
        _rows.append(row)
        addSubview(row)
        layoutSubviews()
    }
    
    func addRows(_ rows: [UIView]) -> Void {
        guard !rows.isEmpty else { return }
        
        rows.forEach {
            _rows.append($0)
            addSubview($0)
        }
        layoutSubviews()
    }
    
    func removeRow(_ row: UIView) -> Void {
        
        _rows.removeAll { r -> Bool in
            if r === row {
                row.removeFromSuperview()
                return true
            } else {
                return false
            }
        }
        layoutSubviews()
    }
    
    func removeRows(_ rows: [UIView]) -> Void {
        guard !rows.isEmpty else { return }
        
        for row in rows { removeRow(row) }
        layoutSubviews()
    }
    
    func removeAllRows() -> Void {
        _rows.removeAll { row -> Bool in
            row.removeFromSuperview()
            return true
        }
        layoutSubviews()
    }
}
