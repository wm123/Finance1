//
//  ASCandlestickCharts.m
//  Finance
//
//  Created by WangM on 12-11-11.
//  Copyright (c) 2012年 WangM. All rights reserved.
//

#import "ASCandlestickCharts.h"

@implementation ASCandlestickCharts

-(id)init
{
    if(drawImage == nil) {
		self.frame = CGRectMake(0, 0, 320, 430);
		self->drawImage = [[UIImageView alloc] initWithImage:nil];
		drawImage.frame = self.frame;
		[self addSubview:self->drawImage];		
	}
    return self;
}

- (void)initialize
{
	self.frame = CGRectMake(0, 60, 320, 340);
	self->drawImage = [[UIImageView alloc] initWithImage:nil];
	drawImage.frame = self.frame;
    [drawImage setBackgroundColor:[UIColor blackColor]];
	[self addSubview:self->drawImage];
}

-(void)MyDrawRect:(CGRect)rect
{
    UIGraphicsBeginImageContext(self.frame.size);//当前环境变量
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    [drawImage.image drawInRect:CGRectMake(0, 0, drawImage.frame.size.width, drawImage.frame.size.height)];
    
    /*画线*/
	CGContextSetLineCap(context, kCGLineCapRound);//设置线终点形状
	CGContextSetLineWidth(context, 2.0);
	CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
	CGContextBeginPath(context);
	CGContextMoveToPoint(UIGraphicsGetCurrentContext(), rect.origin.x+30,rect.origin.y);
	CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), rect.origin.x+30 ,rect.origin.y+100);
	CGContextStrokePath(context);
    CGContextRestoreGState(context);
    CGContextFlush(context);//刷新
    
    /*画矩形*/
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
    CGRect rectJuXing = CGRectMake(rect.origin.x+15,rect.origin.y+20, 30, 50);
    CGContextFillRect(context, rectJuXing);
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGContextSetLineWidth(context, 1.0);
    CGContextAddRect(context,rectJuXing);
    CGContextStrokePath(context);
    
	drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
}

//-(void)MyDrawRect:(CGRect)rect
//{

    //
    //    CGContextRef aContext = UIGraphicsGetCurrentContext();
    
    //    CGContextSetLineWidth(aContext, 1.0);
    //
    //    CGContextSetStrokeColorWithColor(aContext, [[UIColor redColor] CGColor]);
    //
    //    CGContextMoveToPoint(aContext,  rect.origin.x ,rect.origin.y);
    //
    //    CGContextAddLineToPoint(aContext, rect.origin.x, rect.origin.y+5);
    //
    //    CGRect rect1 = CGRectMake(rect.origin.x-5, rect.origin.y-5, 5, 5);
    //
    //    CGContextAddRect(aContext,rect1);
    //
    //    CGContextSetRGBFillColor(aContext, 0.0, 0.0, 1.0, 1.0);
    //
    //    CGContextClosePath(aContext);
    //
    //    CGContextStrokePath(aContext);
    
    //    CGContextSetLineWidth(aContext, 4.0);
    //    CGContextSetMiterLimit(aContext, 4.0);
    //    CGContextSetStrokeColorWithColor(aContext, [[UIColor redColor] CGColor]);
    //    CGContextMoveToPoint(aContext, rect.origin.x, rect.origin.y);
    //    CGContextAddLineToPoint(aContext, rect.origin.x, rect.origin.y+50);
    //    //CGContextClosePath(aContext);
    //    CGContextDrawPath(aContext, kCGPathFill);
    //    CGContextStrokePath(aContext);
    //    UIGraphicsEndImageContext();
    
    
    
    //CGContextRef context = UIGraphicsGetCurrentContext();//获取画图的上下文
    //    CGContextSetLineWidth(context, 1.0 );
    //    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    //
    //    //颜色
    //    CGFloat componets[] = { 0.0 , 3.0 , 0.0 , 1.0 };
    //    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    //    CGColorRef color = CGColorCreate(colorspace, componets);
    //    CGContextSetStrokeColorWithColor(context, color);
    //
    //    CGContextMoveToPoint(context, rect.origin.x,rect.origin.y);//画线
    //    CGContextAddLineToPoint(context, rect.size.width ,rect.size.height );//画线
    //    CGContextStrokePath(context);//画线
    //    CGContextFlush(UIGraphicsGetCurrentContext());//刷新
    //    CGColorSpaceRelease(colorspace);
    //    CGColorRelease(color);
    //    UIGraphicsEndImageContext();
//}

@end
