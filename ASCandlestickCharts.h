//
//  ASCandlestickCharts.h
//  Finance
//
//  Created by WangM on 12-11-11.
//  Copyright (c) 2012年 WangM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASCandlestickCharts : UIView
{
    UIImageView *drawImage;
}

-(void)initialize;
-(id)init;
//-(void)drawRect:(CGPoint)aCenter andContext:(CGContextRef) aContext;
-(void)MyDrawRect:(CGRect)rect;
//-(void)drawRect:(CGRect)rect;
//-(void)UserDrawRect;
@end
