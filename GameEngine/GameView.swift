//
//  GameView.swift
//  GameEngine
//
//  Created by wangwenjie on 2020/5/16.
//  Copyright © 2020 wangwenjie. All rights reserved.
//

import MetalKit

class GameView: MTKView {
    
    var commandQueue: MTLCommandQueue!
    
    
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        self.device = MTLCreateSystemDefaultDevice()
        
        self.clearColor = MTLClearColorMake(0.43, 0.73, 0.35, 1)
        
        self.colorPixelFormat = .bgra8Unorm
        
        self.commandQueue = device?.makeCommandQueue()
        
    }
    
    
    override func draw(_ dirtyRect: NSRect) {
        
        guard let drawable = self.currentDrawable, let renderPassDescriptor = self.currentRenderPassDescriptor else {
            return
        }
        
        let commandBuffer = commandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
    }
}
