//
//  ManageModsViewController.swift
//  CKAN
//
//  Created by Calvin Mlynarczyk on 2015-11-18.
//  Copyright © 2015 KSP-CKAN. All rights reserved.
//

import Foundation
import AppKit

class ManageModsViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    
    let mods = [
        CkanModule(
            identifier: "FAR",
            name: "Ferram Aerospace Research",
            description: "Better aero",
            downloadUrl: NSURL(string: "https://github.com/ferram4/Ferram-Aerospace-Research")!,
            version: "3.0.15.1",
            licenses: ["GPL-3.0"],
            size: 4000,
            installed: false,
            update: false,
            contents: ["file/thing.png", "stuff/mod.txt"],
            status: "Stable",
            maxKSPVersion: "1.5",
            authors: ["ferram4"],
            externalResources: ExternalResources(
                repository: NSURL(string: "https://github.com/ferram4/Ferram-Aerospace-Research")!,
                homepage: nil,
                bugTracker: nil,
                kerbalstuff: nil)),
        CkanModule(
            identifier: "ModuleManager",
            name: "Module Manager",
            description: "Allow for extensibility of Kerbal Space Program by overwriting parts files in-memory",
            downloadUrl: NSURL(string: "https://github.com/sarbian/ModuleManager")!,
            version: "2.6.13",
            licenses: ["CC-SA"],
            size: 680,
            installed: true,
            update: false,
            contents: ["file/thing.png", "bin/modulemanager.dll"],
            status: "Stable",
            maxKSPVersion: "1.5",
            authors: ["sarbian"],
            externalResources: ExternalResources(
                repository: NSURL(string: "https://github.com/sarbian/ModuleManager")!,
                homepage: NSURL(string: "https://github.com/sarbian/ModuleManager"),
                bugTracker: nil,
                kerbalstuff: nil))
    ]
    
    @objc func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return mods.count
    }
    
    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
        let val = mods[row]
        
        if let col = tableColumn?.headerCell.stringValue {
            switch col {
            case "Installed":
                return val.installed
            case "Update":
                return val.update
            case "Name":
                return val.name
            case "Author":
                return val.authors?.joinWithSeparator(", ")
            case "Installed Version":
                return val.version
            case "Latest Version":
                return val.version
            case "Max KSP Version":
                return val.maxKSPVersion
            case "Download (KB)":
                return "\(val.size)"
            case "Description":
                return val.description
            default:
                return nil
            }
        }
    
        return nil
    }
    
    func tableView(tableView: NSTableView, setObjectValue object: AnyObject?, forTableColumn tableColumn: NSTableColumn?, row: Int) {
        let val = mods[row]
        
        if let newVal = object as? Bool, let col = tableColumn?.headerCell.stringValue {
            switch col {
            case "Installed":
                val.installed = newVal
            case "Update":
                val.update = newVal
            default:
                return
            }
        }
    }
    
    @objc func tableViewSelectionDidChange(notification: NSNotification) {
        if let tableView = notification.object as? NSTableView {
            if tableView.selectedRow >= 0 {
                let modInfo = mods[tableView.selectedRow]
                
                if let modInfoViewController = childViewControllers.first as? ModInfoViewController {
                    modInfoViewController.setModInfo(modInfo)
                }
            }
        }
    }
    
    @IBAction func LaunchClicked(sender: NSButton) {
        LaunchKSP()
    }
    
    func LaunchKSP() {
        let args = [NSHomeDirectory() + "/Applications/Kerbal Space Program.app/Contents/MacOS/run.sh"]
        NSTask.launchedTaskWithLaunchPath("/bin/sh", arguments: args)
        
        // Can not use the following because the app launcher Squad ships for
        // OS X is broken
        //NSWorkspace.sharedWorkspace().launchApplication("Kerbal Space Program")
    }
    
    @IBAction func RefreshClicked(sender: NSButton) {
        
    }
    
    @IBAction func ApplyClicked(sender: NSButton) {
        if let parentTabs = parentViewController as? NSTabViewController {
            if let changesetTab = GetChangesetTab() as? ChangesetViewController {
                parentTabs.selectedTabViewItemIndex = parentTabs.childViewControllers.indexOf(changesetTab)!
            }
        }
    }
    
    func GetChangesetTab() -> NSViewController? {
        if let parentTabs = parentViewController as? NSTabViewController {
            return parentTabs.childViewControllers.filter({ viewController in
                viewController is ChangesetViewController
            }).first!
        }
        
        return nil
    }
    
    func GoToChangesetTab() {
        if let parentTabs = parentViewController as? NSTabViewController {
            if let changesetTab = GetChangesetTab() as? ChangesetViewController {
                parentTabs.selectedTabViewItemIndex = parentTabs.childViewControllers.indexOf(changesetTab)!
            }
        }
    }
}