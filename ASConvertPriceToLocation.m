//
//  ASConvertPriceToLocation.m
//  Finance
//
//  Created by WangM on 12-11-14.
//  Copyright (c) 2012年 WangM. All rights reserved.
//

#import "ASConvertPriceToLocation.h"

@implementation ASConvertPriceToLocation

-(id)init:(NSArray *)aStockInfo andXLocation:(UIImageView *) aImageView;
{
    self = [super init];
    if (self != nil) {
        m_arrStockInfos = aStockInfo;
        m_imageView = aImageView;
    }
    return self;
}

//-(CGPoint)convertHighestToLocation:(ASStockInfo *) aStockInfo andI:(int) i
//{
//    CGPoint aPoint = CGPointMake(0.0f, 0.0f);
//    double highest = [aStockInfo GetHighestPrice];
//    aPoint.x = (m_dbImageWidth/m_arrStockInfos.count)*i;
//    aPoint.y = 150.0 + highest;
//    
//    return aPoint;
//}

//-(CGPoint)convertLowestToLocation:(ASStockInfo *) aStockInfo andI:(int) i
//{
//    CGPoint aPoint = CGPointMake(0.0f, 0.0f);
//    double Lowest = [aStockInfo GetLowestPrice];
//    aPoint.x = (m_dbImageWidth/m_arrStockInfos.count)*i;
//    aPoint.y = 150.0 + Lowest;
//    
//    return aPoint;
//}

-(double)convertRectCenterYToLocation:(ASStockInfo *) aStockInfo
{

    double begin = [aStockInfo GetBeginePrice];
    double end = [aStockInfo GetEndPrice];

    double rectCenterY = (end-begin)/2;
    if (end < begin) {
        rectCenterY = (begin - end)/2;
    }
    
    return rectCenterY;
}

-(double)convertRectHeightToLocation:(ASStockInfo *) aStockInfo 
{
    double begin = [aStockInfo GetBeginePrice];
    double end = [aStockInfo GetEndPrice];
    
    double rectHeight = end - begin;
    
    if (end < begin) {
        rectHeight = begin - end;
    }
    
    return rectHeight;
}

-(NSMutableArray *)convertToLocation
{
    NSMutableArray * arrStockInfoLocation = [[NSMutableArray alloc] initWithCapacity:0];
    
    /*找出最高最低*/
    NSMutableArray * arrHighest = [[NSMutableArray alloc] initWithCapacity:0];
    NSMutableArray * arrLowest = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i != m_arrStockInfos.count; i++) {
        NSNumber * highest = [NSNumber numberWithDouble:[[m_arrStockInfos objectAtIndex:i] GetHighestPrice]];
        NSNumber * lowest = [NSNumber numberWithDouble:[[m_arrStockInfos objectAtIndex:i] GetLowestPrice]];
        [arrHighest addObject:highest];
        [arrLowest addObject:lowest];
    }
    
    double dbHighestMax = [[arrHighest objectAtIndex:0] doubleValue];
    double dbLowestMin = [[arrLowest objectAtIndex:0] doubleValue];
    
    for (int i = 0; i != arrHighest.count; i++) {
        double compare1 = [[arrHighest objectAtIndex:i] doubleValue];
        double compare2 = [[arrLowest objectAtIndex:i] doubleValue];
        if (compare1 > dbHighestMax) {
            dbHighestMax = compare1;
        }
        if (compare2 < dbLowestMin) {
            dbLowestMin = compare2;
        }
    }
    
    double Pixel = m_imageView.frame.size.height/((dbHighestMax-dbLowestMin)*100);
    
    /*转换价钱-坐标*/
    //int rectWidth = m_imageView.frame.size.width/m_arrStockInfos.count;
    int rectWidth = 10;
    
    for (int i = 0; i != m_arrStockInfos.count;i++){
        
        ASStockInfo * stockInfo = [m_arrStockInfos objectAtIndex:i];
        double dbXLocation = (m_imageView.frame.size.width/m_arrStockInfos.count)*i+10;
        double rectHeight = [self convertRectHeightToLocation:stockInfo]*Pixel*100;
        
        //最高的
        if(dbHighestMax == [stockInfo GetHighestPrice])
        {
            
           CGPoint cgpHighest = CGPointMake(dbXLocation, m_imageView.frame.origin.y);
            
           double lowestPrice = [stockInfo GetLowestPrice];
            
           //CGPoint cgpLowest = CGPointMake(dbXLocation, m_imageView.frame.origin.y+(m_imageView.frame.size.height-(lowestPrice-dbLowestMin)*Pixel*100));
           CGPoint cgpLowest = CGPointMake(dbXLocation, (lowestPrice - dbLowestMin)*Pixel*100);
            
           double centerY = [self convertRectCenterYToLocation:stockInfo];
            
           CGPoint cgpRectCenter = CGPointMake(dbXLocation, cgpHighest.y+centerY*Pixel*100);
            
           ASDrawKLine * drawKLine = [[ASDrawKLine alloc] initWithHigestPoint:cgpHighest andLowestPoint:cgpLowest andRectCenterPoint:cgpRectCenter andRectWidth:rectWidth andRectHeight:rectHeight andImageDrawKLineBackground:m_imageView andColorKLine:[UIColor redColor]];
            
           [arrStockInfoLocation addObject:drawKLine];
            
        }
        
        //最低的
        else if(dbLowestMin == [stockInfo GetLowestPrice]) {
            
            double highestPrice = [stockInfo GetHighestPrice];
            
            CGPoint cgpHighest = CGPointMake(dbXLocation, m_imageView.frame.origin.y+(dbHighestMax- highestPrice)*Pixel*100);
            
            CGPoint cgpLowest = CGPointMake(dbXLocation, m_imageView.frame.origin.y+m_imageView.frame.size.height);
            
            double centerY = [self convertRectCenterYToLocation:stockInfo];
            
            CGPoint cgpRectCenter = CGPointMake(dbXLocation, cgpHighest.y+centerY*Pixel*100);
            
            ASDrawKLine * drawKLine = [[ASDrawKLine alloc] initWithHigestPoint:cgpHighest andLowestPoint:cgpLowest andRectCenterPoint:cgpRectCenter andRectWidth:rectWidth andRectHeight:rectHeight andImageDrawKLineBackground:m_imageView andColorKLine:[UIColor redColor]];
            
            [arrStockInfoLocation addObject:drawKLine];
        }
        
        //普通的
        else{
            double highestPrice = [stockInfo GetHighestPrice];
            
            double dbHighestYLocation = m_imageView.frame.origin.y+(dbHighestMax-highestPrice)*Pixel*100;
            
            CGPoint cgpHighest = CGPointMake(dbXLocation, dbHighestYLocation);
            
            double lowestPrice = [stockInfo GetLowestPrice];
            
            //double dbLowestLocation =m_imageView.frame.origin.y+(lowestPrice-dbLowestMin)*Pixel*100;
            double dbLowestLocation = m_imageView.frame.origin.y + m_imageView.frame.size.height - (lowestPrice-dbLowestMin)*Pixel*100;
            
            CGPoint cgpLowest = CGPointMake(dbXLocation, dbLowestLocation);
            
            CGPoint cgpRectCenter = CGPointMake(dbXLocation, cgpHighest.y+[self convertRectCenterYToLocation:stockInfo]*Pixel*100);
        
            ASDrawKLine * drawKLine = [[ASDrawKLine alloc] initWithHigestPoint:cgpHighest andLowestPoint:cgpLowest andRectCenterPoint:cgpRectCenter andRectWidth:rectWidth andRectHeight:rectHeight andImageDrawKLineBackground:m_imageView andColorKLine:[UIColor greenColor]];
        
            [arrStockInfoLocation addObject:drawKLine];
        }
    }


    return arrStockInfoLocation;
}


@end
