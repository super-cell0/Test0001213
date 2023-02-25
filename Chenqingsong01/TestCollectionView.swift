//
//  TestCollectionView.swift
//  Chenqingsong01
//
//  Created by mac on 2023/2/8.
//

import UIKit

class WaterfallLayout: UICollectionViewLayout {
    
    // Number of columns in the waterfall layout
    let numberOfColumns = 3
    
    // Store the height of each column
    private var columns = [CGFloat](repeating: 0, count: 3)
    
    // Spacing between cells
    private let cellSpacing: CGFloat = 4
    
    // Store the attributes for each cell
    private var cache = [UICollectionViewLayoutAttributes]()
    
    // Content size of the collection view
    private var contentHeight: CGFloat = 0
    
    // Return the size of the collection view
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView!.bounds.width, height: contentHeight)
    }
    
    // Prepare the layout
    override func prepare() {
        super.prepare()
        
        cache.removeAll()
        columns = [CGFloat](repeating: 0, count: numberOfColumns)
        contentHeight = 0
        
        let columnWidth = (collectionView!.bounds.width - (cellSpacing * CGFloat(numberOfColumns - 1))) / CGFloat(numberOfColumns)
        
        var xOffsets = [CGFloat]()
        for column in 0..<numberOfColumns {
            xOffsets.append(CGFloat(column) * (columnWidth + cellSpacing))
        }
        
        var yOffsets = [CGFloat](repeating: 0, count: numberOfColumns)
        
        var column = 0
        for item in 0..<collectionView!.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            let height = 100 + CGFloat(arc4random_uniform(90))
            let frame = CGRect(x: xOffsets[column], y: yOffsets[column], width: columnWidth, height: height)
            let insetFrame = frame.insetBy(dx: cellSpacing, dy: cellSpacing)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            yOffsets[column] = yOffsets[column] + height
            
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }
    
    // Return the attributes for each cell
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
       
        }
        return visibleLayoutAttributes
    }
    
    // Return the attributes for a specific cell
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}

