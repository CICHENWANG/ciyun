// xxx.ets
import { router } from '@kit.ArkUI'

// 使用bindSheet的detents属性设置三个不同高度的档位
@Entry
@Component
struct SheetTransitionExample {
  @State isShow: boolean = false
  @State touchStartY: number = 0;

  @Builder
  myBuilder() {
    Scroll() {
      Column() {
        Image($r("app.media.kepudetail2"))
      }
      .width('100%')

    }
    .height('100%')
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .width('100%')
  }

  build() {
    Stack() {
      Image($r('app.media.kepu2'))
        .bindSheet($$this.isShow, this.myBuilder(), {
          detents: ['80%'],
          backgroundColor: Color.Gray,
          blurStyle: BlurStyle.Thick,
          showClose: true,
        })
      Image($r('app.media.return'))
        .width(41)
        .height(41)
        .position({ top: 51, left: 9 })
        .onClick(() => {
          router.pushUrl({url:"pages/Index"})
        })
    }
    .width('100%')
    .height('100%')
    .onTouch((event: TouchEvent) => {
      if (event.type === TouchType.Up) {
        this.touchStartY = event.touches[0].windowY;
      }
      if (event.type === TouchType.Move) {
        let deltaY = event.touches[0].windowY - this.touchStartY;
        if (deltaY < -30) { // 负值表示手指向上滑动
          this.isShow = true
        }
      }
    })
  }
}