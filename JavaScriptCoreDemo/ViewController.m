//
//  ViewController.m
//  JavaScriptCoreDemo
//
//  Created by Mr_Jia on 2017/8/11.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "OCJSManager.h"
@interface ViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@property (strong, nonatomic) JSContext *context;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"JavaScriptCoreDemo" withExtension:@"html"];
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    self.webView.delegate = self;

    [self.view addSubview:self.webView];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    OCJSManager *manager = [[OCJSManager alloc]initWithWebView:self.webView];
    
    self.context[@"jscore"] = manager;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
