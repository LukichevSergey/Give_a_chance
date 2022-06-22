//
//  FileManager+CrearDirectory.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//

import Foundation

extension FileManager {
    func clearTmpDirectory() {
        do {
            let tmpDirURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            let tmpDirectory = try contentsOfDirectory(atPath: tmpDirURL!.path)
            try tmpDirectory.forEach { file in
                let fileUrl = tmpDirURL!.appendingPathComponent(file)
                try removeItem(atPath: fileUrl.path)
            }
        } catch { }
    }
}
