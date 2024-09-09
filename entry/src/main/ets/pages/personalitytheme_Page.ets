import { router } from '@kit.ArkUI';

@Entry
@Component
struct aboutUs {
  totalimgs: ResourceStr[] =
    [$r('app.media.theme2'), $r('app.media.theme1'),$r('app.media.theme3'),$r('app.media.theme4'),$r('app.media.theme5') ];
  @State isComplete: boolean = false;
  @State like: boolean[] = [true,true,true,true,false]


  @Builder
  labelIcon(img: ResourceStr,id :number) {
    Column() {
      Row() {
        // 第一张图片，左对齐
        Image(img)
          .width(157)
          .height(65)
          .objectFit(ImageFit.Contain)
        Blank()
          .layoutWeight(1) // 使 Blank 组件占据 Row 中剩余的空间
        Image(this.like[id]==true? $r('app.media.choose'):$r('app.media.choosed'))
          .height(23)
          .width(45)
          .onClick(() => {
            for (let i: number = 0; i < this.like.length; i++) {
              // 循环体
              this.like[i]=true
            }
            this.like[id]=!this.like[id]
          })
      }.width(300)

      Blank()
        .layoutWeight(1) // 使 Blank 组件占据 Row 中剩余的空间
      Image($r('app.media.Line')).width(312).objectFit(ImageFit.Contain).margin({ top: 15, bottom: 15 })
    }.height(60).width(300).margin({ top: 40 })
  }

  build() {
    Stack() {
      Image($r("app.media.personalitytheme_page"))
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