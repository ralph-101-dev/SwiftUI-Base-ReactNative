//
//  ReactNativeRouterModule.m
//  SwiftUIProject
//
//  Created by ralph-L on 2023/09/01.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ReactNativeRouterModule, NSObject)

RCT_EXTERN_METHOD(push:(NSString *)path)
RCT_EXTERN_METHOD(goBack)
RCT_EXTERN_METHOD(popToRoot)

@end
