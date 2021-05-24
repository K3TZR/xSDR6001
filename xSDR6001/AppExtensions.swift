//
//  AppExtensions.swift
//  xSDR6001
//
//  Created by Douglas Adams on 5/21/21.
//

import SwiftUI

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}

/// Struct to hold a Semantic Version number
///     with provision for a Build Number
///
public struct Version {
    var major: Int = 1
    var minor: Int = 0
    var patch: Int = 0
    var build: Int = 1

    public init(_ versionString: String = "1.0.0") {

        let components = versionString.components(separatedBy: ".")
        switch components.count {
        case 3:
            major = Int(components[0]) ?? 1
            minor = Int(components[1]) ?? 0
            patch = Int(components[2]) ?? 0
            build = 1
        case 4:
            major = Int(components[0]) ?? 1
            minor = Int(components[1]) ?? 0
            patch = Int(components[2]) ?? 0
            build = Int(components[3]) ?? 1
        default:
            major = 1
            minor = 0
            patch = 0
            build = 1
        }
    }

    public init() {
        // only useful for Apps & Frameworks (which have a Bundle), not Packages
        let versions = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String ?? "?"
        let build   = Bundle.main.infoDictionary![kCFBundleVersionKey as String] as? String ?? "?"
        self.init(versions + ".\(build)")
    }

    public var longString: String { "\(major).\(minor).\(patch) (\(build))" }
    public var string: String { "\(major).\(minor).\(patch)" }

    public var isV3: Bool { major >= 3 }
    public var isV2NewApi: Bool { major == 2 && minor >= 5 }
    public var isGreaterThanV22: Bool { major >= 2 && minor >= 2 }
    public var isV2: Bool { major == 2 && minor < 5 }
    public var isV1: Bool { major == 1 }

    public var isNewApi: Bool { isV3 || isV2NewApi }
    public var isOldApi: Bool { isV1 || isV2 }

    static func == (lhs: Version, rhs: Version) -> Bool { lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patch == rhs.patch }

    static func < (lhs: Version, rhs: Version) -> Bool {

        switch (lhs, rhs) {

        case (let lhs, let rhs) where lhs == rhs: return false
        case (let lhs, let rhs) where lhs.major < rhs.major: return true
        case (let lhs, let rhs) where lhs.major == rhs.major && lhs.minor < rhs.minor: return true
        case (let lhs, let rhs) where lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patch < rhs.patch: return true
        default: return false
        }
    }
}
