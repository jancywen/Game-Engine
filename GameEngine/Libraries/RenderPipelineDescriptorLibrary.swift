//
//  RenderPipelineDescriptorLibrary.swift
//  GameEngine
//
//  Created by wangwenjie on 2020/6/29.
//  Copyright © 2020 wangwenjie. All rights reserved.
//

import MetalKit

enum RenderPipelineDescriptorTypes {
    case basic
}

class RenderPipelineDescriptorLibrary {
    private static var renderPipelineDescriptors: [RenderPipelineDescriptorTypes: RenderPipelineDescriptor] = [:]
    
    public static func initialize() {
        createDefaultRenderPipelineDescriptors()
    }
    
    private static func createDefaultRenderPipelineDescriptors() {
        renderPipelineDescriptors.updateValue(Basic_RenderPipelineDescriptor(), forKey: .basic)
    }
    
    public static func Descriptor(_ renderPipelineDescriptorType: RenderPipelineDescriptorTypes) -> MTLRenderPipelineDescriptor {
        return renderPipelineDescriptors[renderPipelineDescriptorType]!.renderPipelineDescriptor
    }
}

protocol RenderPipelineDescriptor {
    var name: String {get}
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor {get}
}

public struct Basic_RenderPipelineDescriptor: RenderPipelineDescriptor {
    var name: String = "Basic Render Pipeline Descriptor"
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor {
        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = Preferences.MainPixelFormat
        renderPipelineDescriptor.vertexFunction = ShaderLibrary.Vertex(.basic)
        renderPipelineDescriptor.fragmentFunction = ShaderLibrary.Fragment(.basic)
        renderPipelineDescriptor.vertexDescriptor = VertexDescriptorLibrary.Descriptor(.basic)
        
        return renderPipelineDescriptor
    }
}
