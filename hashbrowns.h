#include <Foundation/Foundation.h>


@interface Hashbrowns : NSObject

+ (NSString *) md5:(const void*)data length:(int)length;
+ (NSString *) sha1:(const void*)data length:(int)length;
+ (NSString *) sha256:(const void*)data length:(int)length;

@end


@interface NSString (Hashbrowns)

- (NSString *) md5;
- (NSString *) sha1;
- (NSString *) sha256;

@end


@interface NSData (Hashbrowns)

- (NSString*) md5;
- (NSString*) sha1;
- (NSString*) sha256;

@end
