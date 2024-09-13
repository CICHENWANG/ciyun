import router from '@ohos.router';
import mine from './mine';
import Index2 from "./Index2" ;
import Logger from '../common/utils/Logger'
import { resourceManager } from '@kit.LocalizationKit'
import { fileIo, picker } from '@kit.CoreFileKit'
import { CommonConstants } from '../common/constants/CommonConstants';
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import make from './make';

class BannerClass {
  id: string = '';
  imageSrc: ResourceStr = '';
  url: string = '';

  constructor(id: string, imageSrc: ResourceStr, url: string) {
    this.id = id;
    this.imageSrc = imageSrc;
    this.url = url;
  }
}

class ArticleClass {
  id: string = '';
  imageSrc: ResourceStr = '';
  title: string = '';
  brief: string = '';
  webUrl: string = '';

  constructor(id: string, imageSrc: ResourceStr, title: string, brief: string, webUrl: string) {
    this.id = id;
    this.imageSrc = imageSrc;
    this.title = title;
    this.brief = brief;
    this.webUrl = webUrl;
  }
}


@Entry
@Component
struct Index {
  @State currentTabIndex1: number = 0
  @State uris: Array<string> = [];
  // 1. 定义一个状态变量 uris，用于存储选择的图片的 URI
  private tabController = new TabsController()
  processImage(): void {
    // 2. 定义一个名为 processImage 的方法，用于处理图片选择流程
    let photoSelectOptions = new picker.PhotoSelectOptions();
    // 3. 创建一个图片选择配置对象
    photoSelectOptions.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE;
    // 4. 设置图片选择配置的 MIME 类型为图片类型
    photoSelectOptions.maxSelectNumber = 1;
    // 5. 设置图片选择配置允许选择的最大图片数量为 1
    let photoPicker = new picker.PhotoViewPicker();
    // 6. 创建一个图片选择器对象
    photoPicker.select(photoSelectOptions, async (
    // 7. 使用图片选择器选择图片，并使用 Promise 处理选择结果
      err: BusinessError, photoSelectResult: picker.PhotoSelectResult) => {
      if (err) {
        // 8. 判断是否发生错误，如果发生错误则记录错误信息并返回
        Logger.error('MS_LITE_ERR: PhotoViewPicker.select failed with err: ' + JSON.stringify(err));
        return;
      }

      Logger.info('MS_LITE_LOG: PhotoViewPicker.select successfully, ' +
        'photoSelectResult uri: ' + JSON.stringify(photoSelectResult));
      // 9. 记录图片选择成功的信息
      this.uris = photoSelectResult.photoUris;
      // 10. 将选择的图片的 URI 存储到 uris 状态变量中
      Logger.info('MS_LITE_LOG: uri: ' + this.uris);
      console.log(this.uris+"666")
      // 11. 记录选择的图片 URI 到日志中
      if (this.uris.toString()=='file://media/Photo/9/IMG_1726054046_008/%E5%9B%BE%E7%89%87%201.png') {
        router.pushUrl({url:"pages/kepu2"} )
      }
      else if (this.uris.toString()=='file://media/Photo/2/IMG_1726043739_001/image%20(1).png') {
          router.pushUrl({url:"pages/kepu3"} )
        }
      else if (this.uris.toString()=='file://media/Photo/10/IMG_1726054046_009/%E5%9B%BE%E7%89%87%201.jpg') {
        router.pushUrl({url:"pages/kepu5"} )
      }
      else if (this.uris.toString()=='file://media/Photo/8/IMG_1726054046_007/%E5%9B%BE%E7%89%87%203.jpg') {
        router.pushUrl({url:"pages/kepu4"} )
      }
      else if (this.uris.toString()=='file://media/Photo/7/IMG_1726054046_006/%E5%9B%BE%E7%89%87%205.jpg') {
        router.pushUrl({url:"pages/kepu6"} )
      }
      else {
        router.pushUrl({url:"pages/Index"})
      }
    })
  }

  @Builder
  TabBuilder(img: Resource, tag: number) {
    Column() {
      Image(img)
        .margin({ bottom: 20 })
        .height(this.currentTabIndex1 == tag ? 67 : 47)
        .width(this.currentTabIndex1 == tag ? 40 : 30)
    }
    .onClick(() => {
      this.currentTabIndex1 = tag
      this.tabController.changeIndex(this.currentTabIndex1)
      if (this.currentTabIndex1 == 2) {

          this.processImage()

      }
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabController }) {
      TabContent() {
        Enter()
      }.tabBar(this.TabBuilder($r('app.media.enterpage_component1'), 0))
      .padding({ top: 0 })
      .align(Alignment.Top)

      TabContent() {
        make()
      }.tabBar(this.TabBuilder($r('app.media.enterpage_component2'), 1))

      TabContent() {
      }.tabBar(this.TabBuilder($r('app.media.enterpage_component3'), 2))
      .padding({ top: 0 })
      .align(Alignment.Top)
      .margin({ top: 0 })

      // .height('100%')

      TabContent() {
        mine()
      }.tabBar(this.TabBuilder($r('app.media.enterpage_component4'), 3))
    }
    .onChange((index: number) => {
      this.currentTabIndex1 = index
    })
    .width('100%')
    .height('100%')
    .barHeight(87)
    .backgroundColor('#F4F2E5')
  }
}

@Preview
@Component
export struct Enter {
  @State currentTabIndex: number = 0
  private tabController = new TabsController()

  @Builder
  TabBuilder(img: Resource, tag: number) {
    Column() {
      Image(this.currentTabIndex == tag ? $r("app.media.Vector") : $r('app.media.Rectangle1'))
        .width(15)
        .height(7)
        .objectFit(ImageFit.Contain)
      Image(img)
        .width(32)
        .height(22)
        .objectFit(ImageFit.Contain)
        .margin({ top: 3 })
    }
    .onClick(() => {
      this.currentTabIndex = tag
      this.tabController.changeIndex(this.currentTabIndex)
    })
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Image($r('app.media.Indexpage'))
      Image($r('app.media.indexpage_text1')).width(60).height(163).margin({ left: 272, right: 82, bottom: 543 })
      Column() {
        Column() {
          Column({ space: 7 }) {
            Image($r('app.media.ciyun_text1'))
              .height(68)
              .width('100%')

          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)

          Search()
            .width(322)// 设置宽度
            .height(32)// 设置高度
            .borderRadius(30)// 设置圆角为30px
            .backgroundColor('#FFF') // 设置背景颜色为白色
          Tabs({ controller: this.tabController }) {
            TabContent() {
              Scroll() {
                Column({ space: 10 }) {
                  Image($r('app.media.indexPage_component6'))
                    .width(324)// 设置宽度为 324px
                    .height(114)// 设置高度为 114px
                    .borderRadius(10)// 设置圆角为 10px
                    .flexShrink(0)// 禁止组件缩小
                    .objectFit(ImageFit.Contain)
                    .onClick(() => {
                      router.pushUrl({ url: 'pages/kepu1' })
                    })

                  Image($r('app.media.indexPage_component7'))
                    .width(324)// 设置宽度为 324px
                    .height(114)// 设置高度为 114px
                    .borderRadius(10)// 设置圆角为 10px
                    .flexShrink(0)// 禁止组件缩小
                    .objectFit(ImageFit.Contain)
                  Image($r('app.media.indexPage_component8'))
                    .width(324)// 设置宽度为 324px
                    .height(114)// 设置高度为 114px
                    .borderRadius(10)// 设置圆角为 10px
                    .flexShrink(0)// 禁止组件缩小
                    .objectFit(ImageFit.Contain)
                }
                .padding({ top: 6 })
                .margin({ top: 15 })

                // .height('100%')
                // .justifyContent(FlexAlign.Start)
              }
              .height('70%')
              .layoutWeight(1)
              .scrollBar(BarState.Off)
              .width('100%')
            }.tabBar(this.TabBuilder($r('app.media.gonyi'), 0))
            .padding({ top: 0 })
            .align(Alignment.Top)
            .margin({ top: 0 })
            TabContent() {
              Text('朝代')
            }.tabBar(this.TabBuilder($r('app.media.chaodai'), 1))

            TabContent() {
              Text('窑口')
            }.tabBar(this.TabBuilder($r('app.media.yaokou'), 2))

            TabContent() {
              Scroll() {
                Column({ space: 10 }) {
                  Image($r('app.media.indexPage_component1'))
                    .width(324)// 设置宽度为 324px
                    .height(114)// 设置高度为 114px
                    .borderRadius(10)// 设置圆角为 10px
                    .flexShrink(0)// 禁止组件缩小
                    .objectFit(ImageFit.Contain)
                    .onClick(() => {
                      router.pushUrl({ url: 'pages/kepu1' })
                    })

                  Image($r('app.media.indexPage_component2'))
                    .width(324)// 设置宽度为 324px
                    .height(114)// 设置高度为 114px
                    .borderRadius(10)// 设置圆角为 10px
                    .flexShrink(0)// 禁止组件缩小
                    .objectFit(ImageFit.Contain)
                  Image($r('app.media.indexPage_component3'))
                    .width(324)// 设置宽度为 324px
                    .height(114)// 设置高度为 114px
                    .borderRadius(10)// 设置圆角为 10px
                    .flexShrink(0)// 禁止组件缩小
                    .objectFit(ImageFit.Contain)
                  Image($r('app.media.indexPage_component4'))
                    .width(324)// 设置宽度为 324px
                    .height(114)// 设置高度为 114px
                    .borderRadius(10)// 设置圆角为 10px
                    .flexShrink(0)// 禁止组件缩小
                    .objectFit(ImageFit.Contain)
                  Image($r('app.media.indexPage_component5'))
                    .width(324)// 设置宽度为 324px
                    .height(114)// 设置高度为 114px
                    .borderRadius(10)// 设置圆角为 10px
                    .flexShrink(0)// 禁止组件缩小
                    .objectFit(ImageFit.Contain)
                }
                .padding({ top: 6 })
                .margin({ top: 15 })

                // .height('100%')
                // .justifyContent(FlexAlign.Start)
              }
              .height('70%')
              .layoutWeight(1)
              .scrollBar(BarState.Off)
              .width('100%')
            }.tabBar(this.TabBuilder($r('app.media.youliao'), 3))
            .padding({ top: 0 })
            .align(Alignment.Top)
            .margin({ top: 0 })

            // .height('100%')

            TabContent() {
              Text('图案')
            }.tabBar(this.TabBuilder($r('app.media.tuan'), 4))
          }
          .onChange((index: number) => {
            this.currentTabIndex = index
          })
          .width('100%')
          .height('100%')
          .barHeight(33)
          .backgroundColor('#F4F2E5')
        }
        .height('100%')
        .width('83%')
        .alignItems(HorizontalAlign.Center)
        .margin({ top: '10%' })

        // .layoutWeight(1)
      }
      .borderRadius({
        topLeft: 20, // 设置左上角圆角为20px
        topRight: 20, // 设置右上角圆角为20px
        bottomLeft: 0, // 设置左下角圆角为0px
        bottomRight: 0  // 设置右下角圆角为0px
      })
      .border({
        width: 0, // 设置边框宽度为0px
        color: '#000', // 设置边框颜色为黑色
        style: BorderStyle.Solid  // 设置边框样式为实线
      })
      .backgroundColor('#F4F2E5') // 设置背景颜色为 #F4F2E5
      .margin({ top: 215 })
      .width('100%')
    }
  }
}