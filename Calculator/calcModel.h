//
//  calculate.h
//  Calculator
//
//  Created by HsuAnny on 6/25/15.
//  Copyright (c) 2015 HsuAnny. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol calcModelDelegate;
@interface calcModel: NSObject

-(float)calculate: (NSString*) aString;

@property (nonatomic,weak) id <calcModelDelegate> delegate;
@end


@protocol calcModelDelegate
@optional
//-(void)test2;

@end
