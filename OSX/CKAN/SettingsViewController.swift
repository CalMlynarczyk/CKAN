//
//  Settings.swift
//  CKAN
//
//  Created by Calvin Mlynarczyk on 2016-01-03.
//  Copyright © 2016 KSP-CKAN. All rights reserved.
//

import Foundation

class SettingsViewController: NSObject, RHPreferencesViewControllerProtocol {
    @objc let identifier = "settings"
    @objc let toolbarItemImage = NSImage(imageLiteral: "settings")
    @objc let toolbarItemLabel = "Settings"
    
    @objc var toolbarItem: NSToolbarItem //optional, overrides the above 3 properties. allows for custom tabbar items.
    
    //methods called when switching between tabs
    @objc func viewWillAppear() {
        
    }
    @objc func viewDidAppear() {
        
    }
    
    @objc func viewWillDisappear() {
        
    }
    
    @objc func viewDidDisappear() {
        
    }
    
    @objc func initialKeyView() -> NSView {
        return NSView()
    }
    
    override init() {
        toolbarItem = NSToolbarItem()
        
        super.init()
    }
}
