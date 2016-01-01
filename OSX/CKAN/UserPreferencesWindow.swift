//
//  UserPreferencesWindow.swift
//  CKAN
//
//  Created by Calvin Mlynarczyk on 2015-12-04.
//  Copyright © 2015 KSP-CKAN. All rights reserved.
//

import Foundation

class UserPreferencesWindow: RHPreferencesWindowController {
    var _windowTitle = "Hola"
    var _toolbar: NSToolbar = NSToolbar()
    var _viewControllers: [AnyObject] = []
    var _selectedIndex: UInt = 0
    var _selectedViewController: NSViewController = NSViewController()
    
    override var windowTitle: String! {
        get { return _windowTitle }
        set { _windowTitle = newValue }
    }
    
    override var toolbar: NSToolbar! {
        get { return _toolbar }
        set { _toolbar = newValue }
    }
    
    override var viewControllers: [AnyObject]! {
        get { return _viewControllers }
        set { _viewControllers = newValue }
    }
    
    override var selectedIndex: UInt {
        get { return _selectedIndex }
        set { _selectedIndex = newValue }
    }
    
    override var selectedViewController: NSViewController! {
        get { return _selectedViewController }
        set { _selectedViewController = newValue }
    }
    
    override init!(viewControllers controllers: [AnyObject]!) {
        super.init(viewControllers: controllers)
    }
    
    override init!(viewControllers controllers: [AnyObject]!, andTitle title: String!) {
        super.init(viewControllers: controllers, andTitle: title)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
