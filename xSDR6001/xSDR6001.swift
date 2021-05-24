//
//  xSDR6001.swift
//  xSDR6001
//
//  Created by Douglas Adams on 5/23/21.
//

import SwiftUI
import xClient6001
import xLib6001

final public class XSDR6001: ObservableObject {

    @AppStorage("clientId") public var clientId: String?
    @AppStorage("defaultGuiConnection") public var defaultGuiConnection: String?
    @AppStorage("defaultNonGuiConnection") public var defaultNonGuiConnection: String?
    @AppStorage("guiIsEnabled") public var guiIsEnabled: Bool = true
    @AppStorage("smartlinkCallsign") public var smartlinkCallsign: String?
    @AppStorage("smartlinkEmail") public var smartlinkEmail: String?
    @AppStorage("smartlinkIsEnabled") public var smartlinkIsEnabled: Bool = false
    @AppStorage("smartlinkName") public var smartlinkName: String?
    @AppStorage("stationName") public var stationName: String?

}

extension XSDR6001: RadioManagerDelegate {

    public func didConnect() {
        print("----->>>>> didConnect")
    }

    public func didFailToConnect() {
        print("----->>>>> didFailToConnect")
    }

    public func willConnect() {
        print("----->>>>> willConnect")
    }

    public func willDisconnect() {
        print("----->>>>> willDisconnect")
    }


}
