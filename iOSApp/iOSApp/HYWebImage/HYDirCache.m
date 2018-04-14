//
//  HYDirCache.m
//  iOSApp
//
//  Created by Honglin Yi on 4/14/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

#import "HYDirCache.h"


@implementation HYDirCache
+ (UIImage *) readImageFromDirectory: (NSString *)identifier {
    NSString *imagePath = [self getImagePath:identifier];
    NSData *imgData = [[NSData alloc] initWithContentsOfURL:[NSURL fileURLWithPath:imagePath]];
    return [[UIImage alloc] initWithData:imgData];
}
+ (BOOL) checkImageInDirectory: (NSString *)identifier {
    NSString *imagePath = [self getImagePath:identifier];
    return [[NSFileManager defaultManager] fileExistsAtPath:imagePath isDirectory:false];
}
+ (void) saveImageToDirectory:(UIImage *)image identifier:(NSString *)identifier {
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:[self getImagePath:identifier] atomically:NO];
}

+ (NSString *) getImagePath: (NSString *)identifier {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *directory = [paths objectAtIndex:0];
    
    NSString *imagePath =[directory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",[self getalphanumericString:identifier]]];
    return imagePath;
}
+ (NSString *) getalphanumericString: (NSString *)string {
    NSMutableCharacterSet *charactersToKeep = [NSMutableCharacterSet alphanumericCharacterSet];
    NSCharacterSet *charactersToRemove = [charactersToKeep invertedSet];
    return [[string componentsSeparatedByCharactersInSet:charactersToRemove] componentsJoinedByString:@"" ];
}

#pragma mark - Debug functions
+ (void) displayFiles {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *sourcePath = [paths objectAtIndex:0];
    NSArray* dirs = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:sourcePath error:NULL];
    
    NSMutableArray *pngFiles = [[NSMutableArray alloc] init];
    [dirs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *filename = (NSString *)obj;
        NSString *extension = [[filename pathExtension] lowercaseString];
        if ([extension isEqualToString:@"png"]) {
            [pngFiles addObject:[sourcePath stringByAppendingPathComponent:filename]];
        }
    }];
    
    NSString *result = @"";
    for (NSString *pngFile in pngFiles) {
        NSString *name = [[pngFile componentsSeparatedByString:@"/"] lastObject];
        result = [result stringByAppendingString:@"\n"];
        result = [result stringByAppendingString:name];
    }
    NSLog(@"%@",result);
}
@end
