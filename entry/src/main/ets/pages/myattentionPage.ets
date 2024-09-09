import { router } from '@kit.ArkUI';

@Entry
@Component
struct aboutUs {
  totalimgs: ResourceStr[][] =
    [[$r('app.media.actor1'),$r('app.media.attention_text1')],[$r('app.media.actor2'), $r('app.media.attention_text2')],[$r('app.media.actor3'),$r('app.media.attention_text3')],[$r('app.media.actor4'),$r('app.media.attention_text4')]];
  @State isComplete: boolean = false;
  @State like: boolean[] = [true,true,true,true,true,true,true]


  @Builder
  labelIcon(img1: ResourceStr,img2:ResourceStr ,id :number) {
    Column() {
      Row() {
        // 第一张图片，左对齐
        Image(img1)
          .width(55)
          .height(55)
          .objectFit(ImageFit.Contain)
        Image(img2)
          .width(145)
          .height(55)
          .objectFit(ImageFit.Contain)
          .margin({left:17})
        Blank()
          .layoutWeight(1) // 使 Blank 组件占据 Row 中剩余的空间
        Image(this.like[id]==true? $r('app.media.attentioned'):$r('app.media.attention'))
          .height(26)
          .width(55)
          .onClick(() => {
            this.like[id]=!this.like[id]
          })
      }.width(348)
      .height(55)

      Blank()
        .layoutWeight(1) // 使 Blank 组件占据 Row 中剩余的空间
      Row() {
        Blank()
          .layoutWeight(1) // 使 Blank 组件占据 Row 中剩余的空间
        Image($r('app.media.Line')).width(312).objectFit(ImageFit.Contain).margin({ top: 10, bottom: 10 })
      }
    }.height(60).width(300).margin({ top: 40 })
  }

  build() {
    Stack() {
      Image($r("app.media.myattention_page"))
      Image($r('app.media.return2'))
        .width(41)
        .height(41)
        .position({ top: 54, left: 9 })
        .onClick(() => {
          router.back()
        })
      Column() {
        Search({placeholder:"搜索我的关注"})
          .placeholderColor("#9A764E")
          .placeholderFont({family:"FontStyle.Normal"})
          .width(322)// 设置宽度
          .height(32)// 设置高度
          .borderRadius(30)// 设置圆角为30px
          .backgroundColor('#FFF') // 设置背景颜色为白色
          .margin({top:20})
        ForEach(this.totalimgs, (item: Resource,id:number) => {
          this.labelIcon(item[0],item[1],id)
        })
      }.position({ top: 88, left: 30 })
    }
  }
}