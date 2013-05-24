#import "hashbrowns.h"
#import <CommonCrypto/CommonDigest.h> // Need to import for CC_MD5 access


@implementation Hashbrowns : NSObject

+ (NSString *) md5:(const void*)bytes length:(int)length
{
    unsigned char digest[16];
    CC_MD5(bytes, length, digest);
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];

    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

+ (NSString*) sha1:(const void*)bytes length:(int)length
{
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(bytes, length, digest);
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];

    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

+ (NSString*) sha256:(const void*)bytes length:(int)length
{
    unsigned char digest[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(bytes, length, digest);
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];

    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

@end


@implementation NSString (MyExtensions)

- (NSString *) md5
{
    const char *cStr = [self UTF8String];
    return [Hashbrowns md5:cStr length:strlen(cStr)];
}

- (NSString *) sha1
{
    const char *cStr = [self UTF8String];
    return [Hashbrowns sha1:cStr length:strlen(cStr)];
}

- (NSString *) sha256
{
    const char *cStr = [self UTF8String];
    return [Hashbrowns sha256:cStr length:strlen(cStr)];
}

@end


@implementation NSData (MyExtensions)

- (NSString*)md5
{
    return [Hashbrowns md5:self.bytes length:self.length];
}

- (NSString*)sha1
{
    return [Hashbrowns sha1:self.bytes length:self.length];
}

- (NSString*)sha256
{
    return [Hashbrowns sha256:self.bytes length:self.length];
}

@end
