//
//  ASViewController.h
//  Finance
//
//  Created by WangM on 12-11-11.
//  Copyright (c) 2012年 WangM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASCandlestickCharts.h"
#import "ASDrawKLine.h"
#import "ASStockInfo.h"
#import "ASConvertPriceToLocation.h"

@interface ASViewController : UIViewController
{
    //ASCandlestickCharts * drawK;
    UIImageView * m_imageBackgroundView;//画板
    NSArray * m_arrStockInfos;
    //int m_nChange;
}

@end
