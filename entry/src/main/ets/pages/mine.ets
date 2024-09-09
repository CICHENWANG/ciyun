import { router } from '@kit.ArkUI';

@Preview
@Component
export default struct mine {
  totalimgs: ResourceStr[] =
    [$r('app.media.text11'), $r('app.media.text2'), $r('app.media.text3'), $r('app.media.text4'),
      $r('app.media.text5'), $r('app.media.text6')];
  @State isComplete: boolean = false;

  aboutToAppear(): void {
    console.log('fhth');
  }

  @Builder
  labelIcon(img: ResourceStr) {
    Column() {
      Row() {
        // 第一张图片，左对齐
        Image(img)
          .width(JSON.stringify(img) === JSON.stringify($r('app.media.text11')) ? 79 : 63)
          .height(JSON.stringify(img) === JSON.stringify($r('app.media.text11')) ? 44 : 22)
          .objectFit(ImageFit.Contain)

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
    .onClick(() => {
      console.log(JSON.stringify(img) + '?');
      console.log(JSON.stringify($r('app.media.text6')) + '?');


      if (JSON.stringify(img) === JSON.stringify($r('app.media.text6'))) {
        router.pushUrl({ url: 'pages/aboutUs' })
      } else if (JSON.stringify(img) === JSON.stringify($r('app.media.text11'))) {
        router.pushUrl({ url: 'pages/personalproductions' })
      } else if (JSON.stringify(img) === JSON.stringify($r('app.media.text3'))) {
        router.pushUrl({ url: 'pages/personalCollections' })
      } else if (JSON.stringify(img) === JSON.stringify($r('app.media.text4'))) {
        router.pushUrl({ url: 'pages/myattentionPage' })
      } else if (JSON.stringify(img) === JSON.stringify($r('app.media.text2'))) {
        router.pushUrl({ url: 'pages/personalitytheme_Page' })
      } else if (JSON.stringify(img) === JSON.stringify($r('app.media.text5'))) {
        router.pushUrl({ url: 'pages/aboutaccount' })
      }
    })
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Image($r('app.media.minePage'))
      Column() {
        ForEach(this.totalimgs, (item: Resource) => {
          this.labelIcon(item)
        })
      }.position({ top: 225, left: 43 })
    }
  }
}