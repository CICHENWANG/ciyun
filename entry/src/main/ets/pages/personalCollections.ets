import { router } from '@kit.ArkUI';

@Entry
@Component
struct aboutUs {
  totalimgs: ResourceStr[] =
    [$r('app.media.collection1'), $r('app.media.collection2'), $r('app.media.collection3'), $r('app.media.collection4'),
      $r('app.media.collection5'), $r('app.media.collection6'), $r('app.media.collection7'),];
  @State isComplete: boolean = false;
  @State like: boolean[] = [true,true,true,true,true,true,true]


  @Builder
  labelIcon(img: ResourceStr,id :number) {
    Column() {
      Row() {
        // 第一张图片，左对齐
        Image(img)
          .width(290)
          .height(90)
          .objectFit(ImageFit.Contain)
        Image(this.like[id]==true? $r('app.media.like'):$r('app.media.unlike'))
          .height(18)
          .width(20)
          .onClick(() => {
            this.like[id]=!this.like[id]
          })
      }.width(300)

      Blank()
        .layoutWeight(1) // 使 Blank 组件占据 Row 中剩余的空间
      Image($r('app.media.Line')).width(312).objectFit(ImageFit.Contain).margin({ top: 10, bottom: 10 })
    }.height(60).width(300).margin({ top: 40 })
  }

  build() {
    Stack() {
      Image($r("app.media.personalcollections_page"))
      Image($r('app.media.return2'))
        .width(41)
        .height(41)
        .position({ top: 54, left: 9 })
        .onClick(() => {
          router.back()
        })
      Column() {
        ForEach(this.totalimgs, (item: Resource,id:number) => {
          this.labelIcon(item,id)
        })
      }.position({ top: 88, left: 30 })
    }
  }
}