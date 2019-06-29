//
//  TokuiViewController.swift
//  Tokui
//
//  Created by Yuiga Wada on 2019/06/24.
//  Copyright © 2019 Yuiga Wada. All rights reserved.
//

import UIKit


public enum MessageLocation
{
    case above
    case below
    case right
    case left
    case auto
}

open class TokuiViewController: UIPageViewController  {
    
    public var magnification : CGFloat
    public var alpha : CGFloat
    public var font : UIFont
    
    
    private var pageControl: UIPageControl!
    private var pages: [UIViewController] = []
    private var firstPage : UIViewController? = nil
    private var endPage : UIViewController? = nil
    
    
    // MARK: - Life Cycle
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// - Parameters:
    ///   - displayDots: whether UIPageControl(Page Dots) is shown or not.
    public init(magnification : CGFloat = 1.2 , alpha: CGFloat = 0.5 , font : UIFont = UIFont.systemFont(ofSize: 18.0) ,displayDots : Bool = true)
    {
        let t = UIPageViewController.TransitionStyle.scroll
        let n = UIPageViewController.NavigationOrientation.horizontal
        
        self.magnification = magnification
        self.alpha = alpha
        self.font = font
        
        super.init(transitionStyle: t, navigationOrientation: n, options: nil)
        
        PreparePageControl()
        pageControl.isHidden = !displayDots
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
    }
    
    // MARK: - Public
    
    public func PreparePages()
    {
        if endPage == nil
        {
            endPage = EndPageViewController(alpha : alpha)
        }
        self.pages.append(endPage!)
        
        if firstPage != nil
        {
            self.pages.insert(firstPage!, at: 0)
        }
        
        
        pageControl.numberOfPages += 1
        
        self.setViewControllers([self.pages[0]], direction: .forward, animated: true, completion: nil)
    }
    
    

    /// - Parameters:
    ///   - target: the object you want to focus
    ///   - location: where message is displayed
    public func add(target: UIView , message: String , magnification : CGFloat = 1.2, font: UIFont? = nil ,textColor : UIColor = .white , location: MessageLocation = .auto)
    {
        self.modalPresentationStyle = .overCurrentContext
        
        let page = createPage()
        
        let spotlight = createSpotlight(target , magnification)
        page.view.layer.mask = spotlight
        
        let description = createDescription(target,
                                            message,
                                            (font == nil ? self.font : font!),
                                            textColor,
                                            location)
        
        page.view.addSubview(description)
        
        pageControl.numberOfPages += 1
    }
    
    public func setFirstPage(_ firstPage : UIView)
    {
        if self.firstPage == nil
        {
            self.firstPage = UIViewController()
        }
        
        self.firstPage!.view.addSubview(firstPage)
    }
    
    public func setFirstPage(_ firstPage : UIViewController)
    {
        self.firstPage = firstPage
    }
    
    
    public func setEndPage(_ endPage : UIView)
    {
        if self.endPage == nil
        {
            self.endPage = UIViewController()
        }
        
        self.endPage!.view.addSubview(endPage)
    }
    
    public func setEndPage(_ endPage : UIViewController)
    {
        self.endPage = endPage
    }
    

    
    
    // MARK: - Page Layout
    
    private func createPage()->UIViewController
    {
        let page = UIViewController()
        page.modalPresentationStyle = .overCurrentContext
        page.view.backgroundColor = UIColor(red:0,green:0,blue:0,alpha:alpha)
        self.pages.append(page)
        
        return page
    }
    
    // MARK: - Spotlight Layout
    
    private func createSpotlight(_ target : UIView , _ magnification : CGFloat)->CALayer
    {
        let height = target.frame.size.height
        let width = target.frame.size.width
        
        let point = CGPoint(x: target.frame.origin.x + width/2,
                            y:  target.frame.origin.y + height/2)
        let r = (width > height ?  width/2 : height/2)
        
        let spotlight = spotlightMask(x:point.x,
                                      y:point.y,
                                      radius: r * magnification)
        
        return spotlight
    }
    
    private func spotlightMask(x: CGFloat,y: CGFloat,radius: CGFloat) -> CAShapeLayer {
        
        let path = CGMutablePath()
        let point = CGPoint(x: x, y: y)
        path.addArc(center: point,
                    radius: radius,
                    startAngle: 0.0,
                    endAngle: 2.0 * .pi,
                    clockwise: false)
        path.addRect(CGRect(origin: .zero, size: self.view.frame.size))
        
        
        let maskLayer = CAShapeLayer()
        maskLayer.backgroundColor = UIColor(red:0,green:0,blue:0,alpha:alpha).cgColor
        maskLayer.path = path
        maskLayer.fillRule = .evenOdd
        
        return maskLayer
    }
    
    // MARK: - Description Label Layout
    
    public func createDescription(_ target: UIView , _ message: String , _ font: UIFont ,_ textColor :UIColor , _ location: MessageLocation) ->UILabel
    {
        var point : CGPoint = CGPoint(x: 0,y: 0)
        var pointsPattern : [CGPoint] = []
        
        let xMargin : CGFloat = 10
        let yMargin : CGFloat = 10
        let height = target.frame.size.height
        let width = target.frame.size.width
        let radius = (width > height ?  width/2 : height/2) * magnification
        
        let label = UILabel()
        label.textColor = .white
        label.font = font
        label.textColor = textColor
        label.textAlignment = .center
        label.numberOfLines = countNewLine(message) + 1
        
        label.text = message
        label.sizeToFit()
        
        
        let point4below = CGPoint(x: target.frame.origin.x + width/2  - label.frame.width/2,
                                  y: target.frame.origin.y + height/2 + radius + yMargin)
        let point4above = CGPoint(x: target.frame.origin.x + width/2  - label.frame.width/2,
                                  y: target.frame.origin.y + height/2 - radius - label.frame.height - yMargin)
        let point4right = CGPoint(x: target.frame.origin.x + width/2 + radius + xMargin,
                                  y: target.frame.origin.y + height/2 )
        let point4left =  CGPoint(x: target.frame.origin.x + width/2 - radius - label.frame.width - xMargin,
                                  y: target.frame.origin.y + height/2 )
        
        pointsPattern.append(point4below)
        pointsPattern.append(point4above)
        pointsPattern.append(point4right)
        pointsPattern.append(point4left)
        
        
        if location == .auto
        {
            //below→above→right→left
            point = point4below
            for p in pointsPattern
            {
                let X = p.x + label.frame.width/2
                let Y = p.y + label.frame.height
                if  X <= self.view.frame.width && Y <= self.view.frame.height
                {
                    point = p
                    break
                }
            }
        }
        else
        {
            switch location
            {
            case .below:
                point = point4below
            case .above:
                point = point4above
            case .right:
                point = point4right
            case .left:
                point = point4left
            default: break
            }
        }
        
        label.frame = CGRect(x:point.x, y:point.y, width:label.frame.width, height:label.frame.height)
        return label
    }
    
    // MARK: - PageControl
    private func PreparePageControl()
    {
        pageControl = UIPageControl(frame: CGRect(x:0, y:self.view.frame.height - 100, width:self.view.frame.width, height:50))
        pageControl.backgroundColor = .clear
        
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        self.view.addSubview(pageControl)
    }
    
    
    
    
    // MARK: - Utility
    private func countNewLine(_ message: String) ->Int
    {
        let pattern = NSRegularExpression.escapedPattern(for: "\n")
        let regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        return regex.numberOfMatches(in: message, range: NSRange(0..<message.utf16.count))
    }
    
}





  // MARK: - DataSource

extension TokuiViewController : UIPageViewControllerDataSource
{
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        pageControl.currentPage = index
        if (index - 1) < 0 {
            return pages[pages.count - 1]
        }
        if pages.count <= (index - 1) {
            return pages[pages.count - 1]
        }
        return pages[index - 1]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        pageControl.currentPage = index
        if index+1 == pages.count {
            return pages[0]
        }
        if pages.count <= (index+1) {
            return pages[0]
        }
        return pages[index+1]
    }
}

