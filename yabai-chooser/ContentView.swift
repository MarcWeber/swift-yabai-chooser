//
//  ContentView.swift
//  yabai-chooser
//
//  Created by Marc Weber on 27.07.24.
//

import SwiftUI

struct Switcher: View {
    
    public var title = ""
    public var options: Array<String> = []
    
    @State private var matched: Array<String> = []
    
    // initializer with parameter
    init(title: String, options: Array<String>) {
        self.title = title
        self.options = options
        self.word = ""
        self._matched = State(initialValue: self.matched_values())
    }
    
    private func matched_values() -> Array<String>{
        return self.options.filter({x in x.contains(self.word) || self.word == "" })
    }
    
    private func action(x: String) {
        print(x)
        exit(0)
    }
    @State private var word = ""
    @FocusState private var isFocused: Bool
    var body: some View {
        VStack {
            Text(self.title)
            TextField("Input", text: $word)
                .focused($isFocused)
                .frame(width: 260, height: 50)
                .onKeyPress(phases: .up) { press in
                    if (press.key == KeyEquivalent.tab){
                        word = options[0]
                        return .handled
                    }
                    if (press.key == KeyEquivalent.return){
                        action(x: self.word)
                    }
//                    if ("0123456789".contains(press.characters) && press.modifiers.contains(EventModifiers.command)){
//                        let y = Int(press.characters)!
//                        print(y)
//                        if (y < self.matched.count){
//                            action(x: self.matched[y])
//                        }
//                    }
//                    if ("0123456789".contains(press.characters)){
//                        print("0-9")
//                    }
//                    
//                    if (press.modifiers.contains(EventModifiers.command)){
//                        print("command")
//                    }
                    self.matched = self.matched_values()
                    return .handled
                }
            
                .padding()
            let items = Array(matched.enumerated())
         
            HStack {
                ForEach(items.prefix(10) , id: \.element) {  (i, word) in
                    let n = i == 9 ? 0 : i+1
                    Button( "⌘" + String(n) + " " + word,
                           action: {
                        action(x: word)
                    }).keyboardShortcut(KeyEquivalent(_: String(n).first!), modifiers: [.command])
                }
            }
            Text(matched.dropFirst(10).joined(separator: ", "))
            Text("Type characters to start filtering type command-1 command-2 to select the nth or hit return to type new")
        }
        .padding()
    }
}

#Preview {
    Switcher(title: "ABC", options: [])
}
