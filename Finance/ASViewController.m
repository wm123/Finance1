//
//  ASViewController.m
//  Finance
//
//  Created by WangM on 12-11-11.
//  Copyright (c) 2012年 WangM. All rights reserved.
//

#import "ASViewController.h"

@interface ASViewController ()

@end

@implementation ASViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //m_nChange = 15;
	// Do any additional setup after loading the view, typically from a nib.
    
//    drawK = [[ASCandlestickCharts alloc]initWithFrame:CGRectMake(0,0, 320, 480)];
//    [drawK initialize];
//    drawK.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:drawK];
    
    m_imageBackgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 150, 320, 200)];
    [m_imageBackgroundView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:m_imageBackgroundView];
    
    ASStockInfo * stockInfo1 = [[ASStockInfo alloc] initWithHighestPrice:10.43 andLowestPrice:10.08 andBeginPrice:10.32 andEndPrice:10.10];
    ASStockInfo * stockInfo2 = [[ASStockInfo alloc] initWithHighestPrice:11.11 andLowestPrice:10.73 andBeginPrice:11.11 andEndPrice:10.75];
    ASStockInfo * stockInfo3 = [[ASStockInfo alloc] initWithHighestPrice:11.00 andLowestPrice:10.56 andBeginPrice:10.74 andEndPrice:10.93];
    ASStockInfo * stockInfo4 = [[ASStockInfo alloc] initWithHighestPrice:10.14 andLowestPrice:9.50 andBeginPrice:9.50 andEndPrice:10.14];
    ASStockInfo * stockInfo5 = [[ASStockInfo alloc] initWithHighestPrice:9.45 andLowestPrice:9.16 andBeginPrice:9.34 andEndPrice:9.35];
    
    m_arrStockInfos = [[NSArray alloc] initWithObjects:stockInfo1,stockInfo2,stockInfo3,stockInfo4,stockInfo5, nil];
    
    //[self.view addSubview:imageBackgroundView];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(115, 10, 90, 40);
    [button addTarget:self action:@selector(createButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * label = [[UILabel alloc] init];
    label.frame = CGRectMake(27, 4, 50, 30);
    label.backgroundColor = [UIColor clearColor];
    label.text = @"生成";
    
    [button addSubview:label];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)createButtonClicked:(id)sender
{
    /*第一次调试*/
//    CGRect rect = CGRectMake(0, 0, 320, 480);
//    //[drawK UserDrawRect];
//    [drawK MyDrawRect:rect];
//    
//    CGRect rect1 = CGRectMake(100, 100, 320, 480);
//    //[drawK UserDrawRect];
//    [drawK MyDrawRect:rect1];
    
    /*两个类写好之后的调试*/
//    CGPoint aHighestPoint = CGPointMake(10 + m_nChange, 0);
//    CGPoint aLowestPoint = CGPointMake(10 + m_nChange, self.view.frame.size.height);
//    CGPoint aRectCenterPoint = CGPointMake(10 + m_nChange, 30);
//    m_nChange += 15;
//    
//    ASDrawKLine *drawKLine = [[ASDrawKLine alloc] initWithHigestPoint:aHighestPoint andLowestPoint: aLowestPoint andRectCenterPoint:aRectCenterPoint andRectWidth:3 andRectHeight:10 andImageDrawKLineBackground:m_imageBackgroundView andColorKLine:[UIColor greenColor]];
//    //drawKLine.frame = CGRectMake(0, 0, 320, 480);
//    
//    [drawKLine DrawKLine];
    ASConvertPriceToLocation * convert = [[ASConvertPriceToLocation alloc] init:m_arrStockInfos andXLocation:m_imageBackgroundView];
    
    NSMutableArray * arrDrawKLineLocations =  [convert convertToLocation];
    
    for (int i = 0; i != arrDrawKLineLocations.count; i++) {
        [[arrDrawKLineLocations objectAtIndex:i] DrawKLine];
    }
//    ASDrawKLine * drawKLine = [[ASDrawKLine alloc] initWithHigestPoint:CGPointMake(10, 160.338) andLowestPoint:CGPointMake(10, 160.697)  andRectCenterPoint:CGPointMake(10, 160.451)  andRectWidth:10 andRectHeight:0.22 andImageDrawKLineBackground:m_imageBackgroundView andColorKLine:[UIColor redColor]];
//    
//    [drawKLine DrawKLine];
    
}


@end
