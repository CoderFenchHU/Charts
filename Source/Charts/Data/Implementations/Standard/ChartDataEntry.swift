//
//  ChartDataEntry.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation

open class ChartDataEntry: ChartDataEntryBase, NSCopying
{
    /// the x value
    @objc open var x = 0.0
    
    //TODO: 新增属性  标记位  visible 为false不绘制 实现不连续的折线图
    @objc open var visible = true
    
    public required init()
    {
        super.init()
    }
    
    ///  为一个不连续的折线图 初始化
    ///  - Parameters:
    ///   - x: x 值
    ///   - y: y 值
    ///   - visible: 当前值是否有效  false 不绘制这个点
    @objc public init(x: Double, y: Double, visible: Bool = false){
        super.init(y: y)
        self.x = x
        self.visible = visible
    }
    
    /// An Entry represents one single entry in the chart.
    ///
    /// - Parameters:
    ///   - x: the x value
    ///   - y: the y value (the actual value of the entry)
    @objc public init(x: Double, y: Double)
    {
        super.init(y: y)
        self.x = x
    }
    
    /// An Entry represents one single entry in the chart.
    ///
    /// - Parameters:
    ///   - x: the x value
    ///   - y: the y value (the actual value of the entry)
    ///   - data: Space for additional data this Entry represents.
    
    @objc public convenience init(x: Double, y: Double, data: Any?)
    {
        self.init(x: x, y: y)
        self.data = data
    }
    
    /// An Entry represents one single entry in the chart.
    ///
    /// - Parameters:
    ///   - x: the x value
    ///   - y: the y value (the actual value of the entry)
    ///   - icon: icon image
    
    @objc public convenience init(x: Double, y: Double, icon: NSUIImage?)
    {
        self.init(x: x, y: y)
        self.icon = icon
    }
    
    /// An Entry represents one single entry in the chart.
    ///
    /// - Parameters:
    ///   - x: the x value
    ///   - y: the y value (the actual value of the entry)
    ///   - icon: icon image
    ///   - data: Space for additional data this Entry represents.
    
    @objc public convenience init(x: Double, y: Double, icon: NSUIImage?, data: Any?)
    {
        self.init(x: x, y: y)
        self.icon = icon
        self.data = data
    }
        
    // MARK: NSObject
    
    open override var description: String
    {
        return "ChartDataEntry, x: \(x), y \(y)"
    }
    
    // MARK: NSCopying
    
    open func copy(with zone: NSZone? = nil) -> Any
    {
        let copy = type(of: self).init()
        
        copy.x = x
        copy.y = y
        copy.data = data
        
        return copy
    }
}

// MARK: Equatable
extension ChartDataEntry/*: Equatable*/ {
    open override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? ChartDataEntry else { return false }

        if self === object
        {
            return true
        }

        return y == object.y
            && x == object.x
    }
}
