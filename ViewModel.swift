//
//  ViewModel.swift
//  xSDR6001
//
//  Created by Douglas Adams on 5/24/21.
//

import Foundation
import xLib6001

final public class ViewModel {
    // ----------------------------------------------------------------------------
    // MARK: - Public types

    public struct LegendValue: Identifiable {
        public var id: CGFloat         // relative position 0...1
        public var value: CGFloat      // actual value
    }

    // ----------------------------------------------------------------------------
    // MARK: - Class methods

    class func freqValues(pan: Panadapter, step: Int) -> [LegendValue] {
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

    class func dbmValues(pan: Panadapter, step: Int) -> [LegendValue] {
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

}
