//
//  RenderPipelineStateLibrary.swift
//  GameEngine
//
//  Created by wangwenjie on 2020/6/29.
//  Copyright © 2020 wangwenjie. All rights reserved.
//

import MetalKit

enum RenderPipelineStateTypes {
    case basic
}

class RenderPipelineStateLibrary {
    private static var renderPipelineStates: [RenderPipelineStateTypes: RenderPipelineState] = [:]
    
    public static func initialize() {
        createDefaultRenderPipelineState()
    }
    
    private static func createDefaultRenderPipelineState() {
        renderPipelineStates.updateValue(Basic_RenderPipelineState(), forKey: .basic)
    }
    public static func PipelineState(_ renderPipelineStateType: RenderPipelineStateTypes) ->MTLRenderPipelineState {
        return renderPipelineStates[renderPipelineStateType]!.renderPipelineState
    }
}


protocol RenderPipelineState {
    var name: String {get}
    var renderPipelineState: MTLRenderPipelineState {get}
}

struct Basic_RenderPipelineState: RenderPipelineState {
    var name: String = "Basic Render Pipeline State"
    var renderPipelineState: MTLRenderPipelineState {
        var renderPipelineState: MTLRenderPipelineState!
        do {
            renderPipelineState = try Engine.Device.makeRenderPipelineState(descriptor: RenderPipelineDescriptorLibrary.Descriptor(.basic))
        }catch let error as NSError {
            print("ERROR::CREATE::RENDER_PIPELINE_STATE::__\(name)__::\(error)")
        }
        return renderPipelineState
    }
}
