import router from '@ohos.router';
import { cameraPicker as picker } from '@kit.CameraKit';
import { camera } from '@kit.CameraKit';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import mine from './mine';

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
struct Index{
  @State currentTabIndex1: number = 0
  private tabController = new TabsController()
  @Builder
  TabBuilder(img: Resource, tag: number) {
    Column() {
      Image(img)
        .margin({ bottom: 20 })
        .height(this.currentTabIndex1==tag?67:47)
        .width(this.currentTabIndex1==tag?40:30)
    }
    .onClick(() => {
      this.currentTabIndex1 = tag
      this.tabController.changeIndex(this.currentTabIndex1)
      if(this.currentTabIndex1==2){

      }
    })
  }
  build() {
      Tabs({barPosition:BarPosition.End, controller: this.tabController }) {
        TabContent() {
          Enter()
        }.tabBar(this.TabBuilder($r('app.media.enterPage_component4'), 0))
        .padding({ top: 0 })
        .align(Alignment.Top)
        TabContent() {
          Text('朝代')
        }.tabBar(this.TabBuilder($r('app.media.enterPage_component2'),1))
        TabContent() {
        }.tabBar(this.TabBuilder($r('app.media.enterPage_component3'),2))
        .padding({ top: 0 })
        .align(Alignment.Top)
        .margin({ top: 0 })

        // .height('100%')

        TabContent() {
          mine()
        }.tabBar(this.TabBuilder($r('app.media.enterPage_component1'),3))
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
export  struct Enter {
  @State currentTabIndex: number = 0
  private tabController = new TabsController()

  @Builder
  TabBuilder(img: Resource, tag: number) {
    Column() {
      Image(this.currentTabIndex == tag ? $r('app.media.Vector') : $r('app.media.Rectangle1'))
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
      Image($r('app.media.Indexpage_text1')).width(60).height(163).margin({ left: 272, right: 82, bottom: 533 })
      Column() {
        Column() {
          Column({ space: 7 }) {
            Text('瓷 韵')
              .fontSize(16)
              .fontColor("#9A764E")// 设置字体颜色
              .textAlign(TextAlign.Start)// 设置文本左对齐
              .fontSize(32)// 设置字体大小为32px
              .fontWeight(FontWeight.Medium)// 设置字体粗细为600
              .lineHeight(22)// 设置行高为22px
              .fontFamily("Inter")// 设置字体为Inter
              .fontStyle(FontStyle.Normal)// 设置字体样式为正常
              .textShadow({
                color: "rgba(0, 0, 0, 0.25)",
                radius: 4
              })
              .textAlign(TextAlign.Start) // 设置文本左对齐
            Text('——瓷器承载中国文化，散发独特的历史韵味')
              .fontSize(16)
              .fontSize(16)// 设置字体大小
              .fontColor("#9A764E")// 设置字体颜色
              .textAlign(TextAlign.Start)// 设置文本左对齐
              .fontWeight(600)// 设置字体粗细为600（SemiBold）
              .lineHeight(22)// 设置行高为22px
              .fontFamily("Inter")// 设置字体为Inter
              .fontStyle(FontStyle.Normal)// 设置字体样式为正常
              .textShadow({
                color: "rgba(0, 0, 0, 0.25)",
                radius: 4
              })

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
              Text('工艺')
            }.tabBar(this.TabBuilder($r('app.media.gonyi'), 0))

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
                    .onClick(()=>{
                      router.pushUrl({url:'pages/kepu'})
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