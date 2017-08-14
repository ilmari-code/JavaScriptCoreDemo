//
//  OCJSManager.m
//  JavaScriptCoreDemo
//
//  Created by Mr_Jia on 2017/8/11.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

#import "OCJSManager.h"
@protocol MangagerExport <JSExport>

JSExportAs(callBack, - (void)printSomethings:(NSString *)string callBack:(NSString *)callback);

@end
@interface OCJSManager()<MangagerExport>
@property (nonatomic, strong) UIWebView *webView;
@end
@implementation OCJSManager

- (instancetype)initWithWebView:(UIWebView *)webView {
    self = [super init];
    if (self) {
        _webView = webView;
    }
    return self;
}

- (void)printSomethings:(NSString *)string callBack:(NSString *)callback{
    NSLog(@"%@",string);
    
    NSString *callbackJS = [NSString stringWithFormat:@"%@('我是callback')", callback];
    [self.webView stringByEvaluatingJavaScriptFromString:callbackJS];

}

@end
