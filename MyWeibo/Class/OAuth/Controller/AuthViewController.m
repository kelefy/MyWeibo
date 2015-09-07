//
//  AuthViewController.m
//  MyWeibo
//
//  Created by cracker on 15/9/2.
//  Copyright (c) 2015年 cracker. All rights reserved.
//

#import "AuthViewController.h"
#import "AccessTokenModel.h"
#import "AccountTool.h"

@interface AuthViewController()<UIWebViewDelegate>

@end

@implementation AuthViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",@"257987400",@"http://www.wxchina.com"]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = self.view.bounds;
    webView.delegate = self;
    [self.view addSubview:webView];
    [webView loadRequest:request];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    
//    NSString *url = @"https://api.weibo.com/oauth2/authorize?client_id=257987400&redirect_uri=http://www.wxchina.com";
//    NSURL *uri = [NSURL URLWithString:url];
//    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:uri];
//    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
//    [self.view addSubview:webView];
//    [webView loadRequest:request];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //NSLog(@"%@",request.URL.absoluteString);
    NSRange range = [request.URL.absoluteString rangeOfString:@"code="];
    NSString *code;
    if(range.length>0)
    {
        code = [request.URL.absoluteString substringFromIndex:range.location+range.length];
        NSLog(@"%@",code);
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/access_token"]];
        request.HTTPMethod = @"POST";
        NSString *paramers = [NSString stringWithFormat: @"client_id=257987400&client_secret=943fa8155fa7ba77b61f57fde8d7167a&grant_type=authorization_code&code=%@&redirect_uri=http://www.wxchina.com",code];
        [request setHTTPBody:[paramers dataUsingEncoding:NSUTF8StringEncoding]];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSData *revData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:revData options:NSJSONReadingMutableLeaves error:nil];
            AccessTokenModel *account = [AccessTokenModel accessTokenModelWithDict:dic];
            [AccountTool writeAccountToFile:account];
            
        });
        
    }
    return YES;
}

@end
