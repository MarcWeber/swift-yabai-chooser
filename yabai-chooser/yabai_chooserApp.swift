//
//  yabai_chooserApp.swift
//  yabai-chooser
//
//  Created by Marc Weber on 27.07.24.
//

import SwiftUI

@main
struct yabai_chooserApp: App {
    
    public var TITLE: String = CommandLine.arguments[1]
    public var OPTIONS: Array<String> = Array(CommandLine.arguments[2...])
    
    init(){
    }

    var body: some Scene {
        WindowGroup {
            Switcher(title: TITLE, options: OPTIONS
            ).frame(minWidth: 300, maxWidth: 600, minHeight:  300, maxHeight: 300)
        }.windowResizability(.contentSize)
    }
}
