//
//  ViewController.m
//  性能优化—耗电优化
//
//  Created by 赵鹏 on 2019/9/3.
//  Copyright © 2019 赵鹏. All rights reserved.
//

/**
 APP耗电的主要原因：
 1、CPU处理：Processing；
 2、网络：Networking；
 3、定位：Location；
 4、图像：Graphics。
 
 针对上述的四点，提出以下几点耗电优化的方案：
 1、尽可能降低CPU、GPU的功耗；
 2、尽量少用定时器；
 3、优化I/O操作（文件的写入和读取）：
 （1）尽量不要频繁地写入小数据，最好批量一次性写入；
 （2）当需要读写大量重要数据时，考虑用dispatch_io，其提供了基于GCD的异步操作文件I/O的API。用dispatch_io系统会优化磁盘访问；
 （3）对于数据量比较大的情况，建议使用数据库（比如SQLite、CoreData）。
 4、网络优化：
 （1）减少、压缩网络数据：最开始是使用XML格式的数据和后台进行交互的，但是这种格式的数据体积会比较大，比较臃肿。后面就开始使用JSON格式的数据了，这种格式的数据体积就比较小一些了。有的时候还会使用protocol buffer这种格式的数据；
 （2）如果多次请求的结果是相同的，应尽量使用缓存机制；
 （3）使用断点续传机制，否则网络不稳定时可能多次传输相同的内容；
 （4）网络不可用时，不要尝试执行网络请求；
 （5）让用户可以取消长时间运行或者速度很慢的网络操作，设置合适的超时时间；
 （6）批量传输。比如，下载视频流时，不要传输很小的数据包，直接下载整个文件或者一大块一大块地下载。如果下载广告，一次性多下载一些，然后再慢慢展示。如果下载电子邮件，一次下载多封，不要一封一封地下载。
 5、定位优化：
 （1）如果只是需要快速确定用户位置，最好用CLLocationManager的requestLocation方法。在定位完成后，会自动让定位硬件断电；
 （2）如果不是导航应用，尽量不要实时更新位置，定位完毕就关掉定位服务；
 （3）尽量降低定位的精度，比如尽量不要使用精度最高的kCLLocationAccuracyBest来进行定位；
 （4）需要后台定位时，尽量设置pausesLocationUpdatesAutomatically为YES，如果用户不太可能移动的时候系统会自动暂停位置更新；
 （5）尽量不要使用startMonitoringSignificantLocationChanges，优先考虑startMonitoringForRegion。
 6、硬件检测优化：
 用户移动、摇晃、倾斜设备时，会产生动作(motion)事件，这些事件由加速度计、陀螺仪、磁力计等硬件检测。在不需要检测的场合，应该及时关闭这些硬件。
 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
