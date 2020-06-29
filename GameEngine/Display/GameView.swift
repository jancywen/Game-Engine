//
//  GameView.swift
//  GameEngine
//
//  Created by wangwenjie on 2020/5/16.
//  Copyright © 2020 wangwenjie. All rights reserved.
//

import MetalKit
import simd

class GameView: MTKView {
        
    var vertices:[Vertex]!
    
    var vertexBuffer: MTLBuffer!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        self.device = MTLCreateSystemDefaultDevice()
        
        Engine.Ignite(device: device!)
        
        self.clearColor = Preferences.clearColor
        
        self.colorPixelFormat = Preferences.MainPixelFormat
                
        createVertex()
        
        createBuffers()
    }
    
    func createVertex() {
        vertices = [
            Vertex(position: float3(0,1,0), color: float4(1,0,0,1)),
            Vertex(position: float3(-1,-1,0), color: float4(0,1,0,1)),
            Vertex(position: float3(1,-1,0), color: float4(0,0,1,1))
        ]
    }
    func createBuffers() {
        vertexBuffer = Engine.Device.makeBuffer(bytes: vertices, length: Vertex.stride(vertices.count), options: [])
    }
    
    override func draw(_ dirtyRect: NSRect) {
        
        guard let drawable = self.currentDrawable, let renderPassDescriptor = self.currentRenderPassDescriptor else {
            return
        }
        
        let commandBuffer = Engine.CommandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        renderCommandEncoder?.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.basic))
        
        renderCommandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
