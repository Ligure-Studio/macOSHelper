//
//  Func.swift
//  macOSHelper
//
//  Created by Jerry XU on 2023/3/5.
//

import Cocoa

public func showOpenPanel() -> String {//打开文件函数,返回值为路径
    let openPanel = NSOpenPanel()
    openPanel.allowedFileTypes = ["app"]
    openPanel.allowsMultipleSelection = false
    openPanel.canChooseDirectories = false
    openPanel.canChooseFiles = true
    if (openPanel.runModal() ==  NSApplication.ModalResponse.OK) {
        let result = openPanel.url // Pathname of the file

        if (result != nil) {
            return result!.path
        }
    }
    else {
        return "failed"
    }
    return "failed"
}

public func runScript(_ command: String) -> String {
    let task = Process()
    let pipe = Pipe()
    
    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-e", command]
    task.launchPath = "/usr/bin/osascript"
    task.standardInput = nil
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)!
    
    return output
}

class RoundedColoredButton: NSButton {
    @IBInspectable var bgColor: NSColor = .darkGray
    @IBInspectable var foreColor: NSColor = .white
    @IBInspectable var highlightColor: NSColor = .black
    @IBInspectable var cornerRadius: CGFloat = 8
    
    override func draw(_ dirtyRect: NSRect) {
        configure()
        super.draw(dirtyRect)
    }
    
    func configure() {
        // Set the proper background color depending on
        // whether the button is highlighted or not.
        if !isHighlighted {
            self.layer?.backgroundColor = bgColor.cgColor
        } else {
            self.layer?.backgroundColor = highlightColor.cgColor
        }
        
        // Create an attributed string using the
        // provided title color, and use that attributed
        // string as title.
        let attributedString = NSAttributedString(string: title,
                                                  attributes: [NSAttributedString.Key.foregroundColor: foreColor])
        self.attributedTitle = attributedString
        
        // Set the corner radius.
        self.layer?.cornerRadius = cornerRadius
    }
}

public func copyStringToPasteboard(string: String) {
    let pboard = NSPasteboard.general           // 1
    pboard.declareTypes([.string], owner: nil)  // 2
    pboard.setString(string, forType: .string)  // 3
}

public func dialog(_ firstButtonName: String, _ secondButtonName: String, _ question: String, _ text: String) -> Bool {
    let myPopup: NSAlert = NSAlert()
    myPopup.messageText = question
    myPopup.informativeText = text
    myPopup.alertStyle = NSAlert.Style.warning
    myPopup.addButton(withTitle: firstButtonName)
    myPopup.addButton(withTitle: secondButtonName)
    return myPopup.runModal() == NSApplication.ModalResponse.alertFirstButtonReturn
}

public func alert(_ title: String, _ text: String)
{
    let a = NSAlert()
    a.messageText = title
    a.informativeText = text
    a.runModal()
}
