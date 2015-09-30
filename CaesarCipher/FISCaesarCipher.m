//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher
//define methods here



-(void)hello{
    
    NSLog(@"HELLO");

    
    
    NSInteger x = [self numberOfString:@"Z"];
    NSLog(@"%ld",(long)x);
    
    NSLog(@"%@",[self stingForNumbers:117]);
    
    NSString * testEncode = [self encodeWithMessage:@"F" andOffset:2];

    
    NSLog(@"testEncode %@", testEncode);
    
    //[self myOwnTable];
}

-(NSString *)encodeWithMessage:(NSString *)message andOffset:(NSInteger)key{ // put into number >> read number >> print out letters
    

    NSDictionary * table = [self myOwnTable];
    NSInteger intValueFromMess = [ [table allKeysForObject:message][0] integerValue ];
    
    NSInteger offSet = intValueFromMess + key ;
    NSString * offSetString = [NSString stringWithFormat:@"%ld",(long)offSet];
    NSString * codedString = table[offSetString];
    
    return codedString;
}


-(NSDictionary *)myOwnTable{
    
     NSString * filePath = [[NSBundle mainBundle] pathForResource:@"myTableAssci" ofType:@"txt"];
     NSError *error;
     NSString *fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
     NSArray  *stateList = [fileContents componentsSeparatedByString:@"\n"];
     //NSLog(@"stateList%@", stateList);
    
    NSMutableDictionary * madeAsciTable = [[NSMutableDictionary alloc] init];

    for (NSString * eachCouple in stateList) {
        NSArray * eachPair = [eachCouple componentsSeparatedByString:@","];
        //NSLog(@"eachCouple is %@", eachPair);
        [ madeAsciTable setValue: eachPair[1] forKey: eachPair[0] ];
    }
    
    //NSLog(@" madeAsciTable %@", madeAsciTable);

    return madeAsciTable;
}

-(NSString *)decodeWithMessage:(NSString *)encodedMessage
                     andOffset:(NSInteger)key{
    
    NSLog(@"HELLO 2");
    return  @"HELLO 2";
}

-(NSInteger)numberOfString:(NSString *)string{
    
    
    NSDictionary * acssiTable = [self myOwnTable];
    NSString * testInt = [acssiTable allKeysForObject:string][0];
    NSInteger x = [testInt integerValue];
    NSLog(@" test Interger = %@", testInt);
    
    return x;
}

-(NSString *)stingForNumbers:(NSInteger )number {
    
    NSDictionary * acssiTable = [self myOwnTable];
    NSString * numberToString = [NSString stringWithFormat:@"%ld", (long)number];
    NSString * testInt = acssiTable[numberToString];
    
    NSLog(@" test String = %@", testInt);
    
    return testInt;
}


@end
