//
//  ModInfoViewController.swift
//  CKAN
//
//  Created by Calvin Mlynarczyk on 2015-11-18.
//  Copyright © 2015 KSP-CKAN. All rights reserved.
//

import Foundation
import AppKit

class ModInfoViewController: NSTabViewController {
    func setModInfo(mod: CkanModule) {
        childViewControllers.forEach({ viewController in
            if let id = viewController.title {
                switch id {
                case "Metadata":
                    setMetadataView(mod, viewController: viewController)
                case "Content":
                    setContentsView(mod, viewController: viewController)
                case "Relationships":
                    setRelationshipsView(mod, viewController: viewController)
                default:
                    return
                }
            }
        })
    }
    
    func setMetadataView(mod: CkanModule, viewController: NSViewController) {
        let view = viewController.view
        
        if let titleLabel = view.viewWithTag(0) as? NSTextField {
            titleLabel.stringValue = mod.name
        }
        
        if let descriptionLabel = view.viewWithTag(1) as? NSTextField {
            descriptionLabel.stringValue = mod.description
        }
        
        if let detailsLabel = view.viewWithTag(2) as? NSTextField {
            var detailsString = "Version: \(mod.version)\n"
            
            if mod.licenses.count > 0 {
                detailsString += "License: \(mod.licenses.joinWithSeparator(", "))\n"
            }
            
            if let authors = mod.authors {
                if authors.count > 0 {
                    detailsString += "Author: \(authors.joinWithSeparator(", "))\n"
                }
            }
            
            if let homePage = mod.externalResources?.homepage {
                detailsString += "Home Page: \(homePage)\n"
            }
            
            if let repo = mod.externalResources?.repository {
                detailsString += "GitHub: \(repo)\n"
            }
            
            if let bugTracker = mod.externalResources?.bugTracker {
                detailsString += "Bug Tracker: \(bugTracker)\n"
            }
            
            if let kerbalStuff = mod.externalResources?.kerbalstuff {
                detailsString += "KerbalStuff: \(kerbalStuff)\n"
            }
            
            detailsString += "Release Status: \(mod.status)\nMaxVersion: \(mod.maxKSPVersion)\nIdentifier: \(mod.identifier)"
            
            detailsLabel.stringValue = detailsString
            detailsLabel.sizeToFit()
        }
    }
    
    func setContentsView(mod: CkanModule, viewController: NSViewController) {
        //let outlineView = viewController.view.viewWithTag(1)
        
        mod.contents.forEach({ fileName in
            
        })
    }
    
    func setRelationshipsView(mod: CkanModule, viewController: NSViewController) {
        //let outlineView = viewController.view.viewWithTag(1)
        
        mod.contents.forEach({ dependency in
            viewController.view.viewWithTag(1)
        })
    }
}

class ModRelationshipsViewController: NSObject, NSOutlineViewDataSource {
    var relationshipData: [String] = []
    
    func outlineView(outlineView: NSOutlineView, child index: Int, ofItem item: AnyObject?) -> AnyObject {
        return relationshipData[index]
    }
    
    func outlineView(outlineView: NSOutlineView, numberOfChildrenOfItem item: AnyObject?) -> Int {
        return relationshipData.count
    }
    
    func outlineView(outlineView: NSOutlineView, isItemExpandable item: AnyObject) -> Bool {
        return relationshipData.count > 0
    }
    
    func outlineView(outlineView: NSOutlineView, objectValueForTableColumn tableColumn: NSTableColumn?, byItem item: AnyObject?) -> AnyObject? {
        return relationshipData[0]
    }
}
