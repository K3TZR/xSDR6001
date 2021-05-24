//
//  xSDR6001.swift
//  xSDR6001
//
//  Created by Douglas Adams on 5/23/21.
//

import SwiftUI
import xClient6001
import xLib6001

final public class XSDR6001: ObservableObject, RadioManagerDelegate {



    public struct LegendValue: Identifiable {
        public var id: CGFloat         // relative position 0...1
        public var value: CGFloat      // actual value
    }




    public var clientId: String?

    public var defaultGuiConnection: String?

    public var defaultNonGuiConnection: String?

    public var guiIsEnabled: Bool = true

    public var smartlinkCallsign: String?

    public var smartlinkEmail: String?

    public var smartlinkIsEnabled: Bool = true

    public var smartlinkName: String?

    public var stationName: String?

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


    // ----------------------------------------------------------------------------
    // MARK: - Internal Methods

    func dbmValues(pan: Panadapter, step: Int) -> [LegendValue] {
        var values = [LegendValue]()

        var value = pan.maxDbm

        values.append( LegendValue(id: 0, value: value) )
        repeat {
            let next = value - CGFloat(step)
            value = next < pan.minDbm ? pan.minDbm : next
            let position = (pan.maxDbm - value) / (pan.maxDbm - pan.minDbm)
            values.append( LegendValue(id: position, value: value) )
        } while value != pan.minDbm
        return values
    }

    func freqValues(pan: Panadapter, step: Int) -> [LegendValue] {
        var values = [LegendValue]()

        let maxFreq = CGFloat(pan.center + (pan.bandwidth/2))
        let minFreq = CGFloat(pan.center - (pan.bandwidth/2))
        var value = minFreq

        values.append( LegendValue(id: 0, value: value) )
        repeat {
            let next = value + CGFloat(step)
            value = next > maxFreq ? maxFreq : next
            let position = (value - minFreq) / (maxFreq - minFreq)
            values.append( LegendValue(id: position, value: value) )
        } while value != maxFreq
        return values
    }


}
