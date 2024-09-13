import { router } from '@kit.ArkUI';

@Entry
@Component
struct aboutUs {
  totalimgs: ResourceStr[] =
    [$r('app.media.aboutcount1'), $r('app.media.aboutcount2'),$r('app.media.aboutcount3'),$r('app.media.aboutcount4'),$r('app.media.aboutcount5'), ];
  @State isComplete: boolean = false;


  @Builder
  labelIcon(img: ResourceStr,id :number) {
    Column() {
      Row() {
        // 第一张图片，左对齐
        Image(img)
          .width(280)
          .height(37)
          .objectFit(ImageFit.Contain)
          .onClick(()=>{
            if (JSON.stringify(img) === JSON.stringify($r('app.media.aboutcount5'))) {
              router.pushUrl({ url: 'pages/login' })
            }
          })
        // 使用 Blank 组件来填充空白区域
        Blank()
          .layoutWeight(1) // 使 Blank 组件占据 Row 中剩余的空间

        // 第二张图片，右对齐
        Image($r('app.media.rightArrow_icon'))
          .height(32)
          .width(32)
      }
      Image($r('app.media.Line')).width(312).objectFit(ImageFit.Contain)
    }.height(60).width(300)
  }

  build() {
    Stack() {
      Image($r("app.media.aboutaccount"))
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
      }.position({ top: 115, left: 35 })
    }
  }
}