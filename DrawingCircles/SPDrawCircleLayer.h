//
//  SPDrawCircleLayer.h
//
//
//  Created by Sergio Padrino on 31/07/14.
//
//

#import <QuartzCore/QuartzCore.h>

@interface SPDrawCircleLayer : CALayer

@property(nonatomic) CGFloat flatness;
@property (nonatomic) CGFloat radius;

@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) CGColorRef strokeColor;

@end
