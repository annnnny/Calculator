//
//  calculate.m
//  Calculator
//
//  Created by HsuAnny on 6/25/15.
//  Copyright (c) 2015 HsuAnny. All rights reserved.
//

#import "calcModel.h"

@implementation calcModel

-(float)calculate: (NSString*) aString{
    NSInteger len = [aString length];
    unichar buffer[len+1];
    NSString *eachChar;
    NSMutableString *numString = [[NSMutableString alloc] init];
    NSMutableArray *numbers = [[NSMutableArray alloc] init];
    NSMutableArray *operators = [[NSMutableArray alloc] init];
    int lastOperatorIndex = -1;
    
    [aString getCharacters:buffer range:NSMakeRange(0, len)];
    
    for(int i = 0; i < len; i++) {
        if (buffer[i] == '+' || buffer[i] == '-' || buffer[i] == 'x' || buffer[i] == '/')
        {
            for (int j = lastOperatorIndex+1; j < i; j++)
            {
                eachChar = [NSString stringWithFormat:@"%c", buffer[j]];
                [numString appendString:eachChar];
            }
            
            lastOperatorIndex = i;
            NSLog(@"Operator at index: %i", lastOperatorIndex);
            [numbers addObject:[NSNumber numberWithFloat:(float)[numString floatValue]]];
            [numString setString:@""];
            [operators addObject:[NSNumber numberWithFloat:(float)buffer[i]]];
        } // if operator
        
        if (i == len-1)
        {
            for (int k = lastOperatorIndex+1; k < len; k++)
            {
                eachChar = [NSString stringWithFormat:@"%c", buffer[k]];
                [numString appendString:eachChar];
            }
            
            [numbers addObject:[NSNumber numberWithFloat:(float)[numString floatValue]]];
        } // add last number into numbers array
    } // for each character in label text
    
    // Done with numbers and operator array
    float result = (float)[numbers[0] floatValue];
    
    for (int m = 0; m < numbers.count; m++)
    {
        NSLog(@"Number: %@", numbers[m]);

        if (m != operators.count)
        {
            if ([operators[m] integerValue] == 43) // +
                result += (float)[numbers[m+1] floatValue];
            
            if ([operators[m] integerValue] == 45) // -
                result -= (float)[numbers[m+1] floatValue];
            
            if ([operators[m] integerValue] == 120) // x
                result *= (float)[numbers[m+1] floatValue];
            
            if ([operators[m] integerValue] == 47) // /
                result /= (float)[numbers[m+1] floatValue];
        }
    }

//    for (int n = 0; n < operators.count; n++)
  //      NSLog(@"Operator: %@", operators[n]);
    
    NSLog(@"Result: %f", result);
    
    return result;
}

@end