//
//  ASConvertPriceToLocation.h
//  Finance
//
//  Created by WangM on 12-11-14.
//  Copyright (c) 2012年 WangM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASStockInfo.h"
#import "ASDrawKLine.h"

@interface ASConvertPriceToLocation : NSObject
{
    NSArray * m_arrStockInfos;
    UIImageView *  m_imageView;
}

//-(CGPoint)convertHighestToLocation:(ASStockInfo *) aStockInfo andI:(int) i;
//-(CGPoint)convertLowestToLocation:(ASStockInfo *) aStockInfo andI:(int) i;
-(double)convertBeginOrEnd:(ASStockInfo *) aStockInfo;
-(double)convertRectHeightToLocation:(ASStockInfo *) aStockInfo;

-(id)init:(NSArray *)aStockInfo andXLocation:(UIImageView *) aImageView;
-(NSMutableArray *)convertToLocation;

@end
