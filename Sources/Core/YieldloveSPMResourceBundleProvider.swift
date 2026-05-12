//
//  YieldloveSPMResourceBundleProvider.swift
//  stroeerSDK
//
//  Created by Shafee Rehman on 12/05/2026.
//

import Foundation

@objc(YieldloveSPMResourceBundleProvider)
public final class YieldloveSPMResourceBundleProvider: NSObject {

    @objc public static func resourceBundle() -> Bundle {
        Bundle.module
    }
}
