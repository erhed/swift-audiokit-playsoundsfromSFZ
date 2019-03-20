//
//  SoundEngine.swift
//  AudioKitSamplerEngine1
//
//  Created by Erik on 2019-03-20.
//  Copyright © 2019 Erik. All rights reserved.
//

import Foundation
import AudioKit

open class SoundEngine {
    
    var sampler: AKSampler!
    var mixer: AKMixer!
    
    init() {
        
        sampler = AKSampler()

        sampler.loadSFZ(path: Bundle.main.resourcePath! + "/sounds/", fileName: "epiano.sfz")
        
        sampler.buildKeyMap()
        
        mixer = AKMixer(sampler)
        
        AudioKit.output = mixer
        
        do {
            try AudioKit.start()
        }
        catch {
            print(error)
        }
    }
    
    func playSound() {
        sampler.masterVolume = 1.0
        sampler.play(noteNumber: 58, velocity: 100)
    }
}
