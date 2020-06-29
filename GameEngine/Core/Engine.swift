//
//  Engine.swift
//  GameEngine
//
//  Created by wangwenjie on 2020/6/29.
//  Copyright © 2020 wangwenjie. All rights reserved.
//

import MetalKit

class Engine {
    
    public static var Device: MTLDevice!
    
    public static var CommandQueue: MTLCommandQueue!
    
    public static func Ignite(device: MTLDevice) {
        self.Device = device
        self.CommandQueue = device.makeCommandQueue()
        
        ShaderLibrary.initialize()
        
        VertexDescriptorLibrary.initialize()
        
        RenderPipelineDescriptorLibrary.initialize()
        
        RenderPipelineStateLibrary.initialize()
    }
}
