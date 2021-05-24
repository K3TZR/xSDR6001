//
//  ContentView.swift
//  xSDR6001
//
//  Created by Douglas Adams on 5/19/21.
//

import SwiftUI
import xClient6001

struct ContentView: View {
    @ObservedObject var radioManager: RadioManager

    @AppStorage("showBorder") var showBorder = false
    @AppStorage("allEnabled") var allEnabled = false
    @AppStorage("ShowButtons") var showButtons = false
    @AppStorage("ShowSide") var showSide = false
    //    @AppStorage("numberOfPanadapters") var numberOfPanadapters = 0

    @AppStorage("audioGain") var audioGain: Double = 30
    @AppStorage("audioMute") var audioMute = false
    @AppStorage("lineoutGain") var lineoutGain: Double = 70
    @AppStorage("lineoutMute") var lineoutMute = false
    @AppStorage("markersEnabled") var markersEnabled = false
    @AppStorage("macRxAudioEnabled") var macRxAudioEnabled = false
    @AppStorage("showSettingsView") var showSettingsView = false
    @AppStorage("tnfsEnabled") var tnfsEnabled = false

    var body: some View {
        MainView(radioManager: radioManager)

        .sheet(item: $radioManager.activeView) { viewType in
            switch viewType {

            case .genericAlert:             GenericAlertView().environmentObject(radioManager)
            case .radioPicker:              RadioPickerView().environmentObject(radioManager)
            case .smartlinkAuthentication:  smartlinkAuthenticationView().environmentObject(radioManager)
            case .smartlinkStatus:          SmartlinkStatusView().environmentObject(radioManager)
            }
        }

        .toolbar {
            ToolbarItemGroup(placement: .cancellationAction) {
                Image(systemName: "sidebar.left")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(showButtons ? .accentColor : .secondary)
                    .onTapGesture(perform: {
                        withAnimation {
                            showButtons.toggle()
                        }
                    })
                Spacer()
                HStack(spacing: 20) {
                    Button(radioManager.isConnected ? "Disconnect" : "Connect") {
                        if radioManager.isConnected {
                            radioManager.disconnect()
                        } else {
                            radioManager.connect()
                        }
                    }
                    .keyboardShortcut(radioManager.isConnected ? .cancelAction : .defaultAction)

                    HStack {
                        HStack {
                            Button("Pan") { print("Pan Pressed") }.foregroundColor(.secondary)
                            Button("Tnf") { tnfsEnabled.toggle() }.foregroundColor(tnfsEnabled ? .accentColor : .secondary)
                            Button("Marker") { markersEnabled.toggle() }.foregroundColor(markersEnabled ? .accentColor : .secondary)
                            Button("Mac Audio") { macRxAudioEnabled.toggle() }.foregroundColor(macRxAudioEnabled ? .accentColor : .secondary)
                        }

                        HStack(spacing: 5) {
                            Image(systemName: audioMute ? "speaker.slash.circle" : "speaker.wave.2.circle")
                                .foregroundColor(audioMute ? .red : .secondary)
                                .font(.system(size: 24, weight: .regular))
                                .onTapGesture(perform: {
                                    audioMute.toggle()
                                })
                            Slider(value: $audioGain, in: 0...100, step: 1)
                                .frame(width: 100)
                                .disabled(audioMute)
                        }

                        HStack(spacing: 5) {
                            Image(systemName: lineoutMute ? "speaker.slash.circle" : "speaker.wave.2.circle")
                                .foregroundColor(lineoutMute ? .red : .secondary)
                                .font(.system(size: 24, weight: .regular))
                                .onTapGesture(perform: {
                                    lineoutMute.toggle()
                                })
                            Slider(value: $lineoutGain, in: 0...100, step: 1)
                                .frame(width: 100)
                                .disabled(lineoutMute)
                        }

                        Button("Settings") { showSettingsView.toggle() ; NSApp.sendAction(Selector(("showPreferencesWindow:")), to: nil, from: nil) }.foregroundColor(.secondary)
                    }.disabled(!radioManager.isConnected)

                    Button("Default") { radioManager.defaultChoose() }
                }

                Image(systemName: "sidebar.right")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(showSide ? .accentColor : .secondary)
                    .onTapGesture(perform: {
                        withAnimation {
                            showSide.toggle()
                        }
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView(radioManager: RadioManager(delegate: XSDR6001() as RadioManagerDelegate))
    }
}
