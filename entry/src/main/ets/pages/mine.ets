import { router } from '@kit.ArkUI';

@Preview
@Component
export default  struct mine {
  aboutToAppear(): void {
    console.log('fhth');
  }
  totalimgs: ResourceStr[]=[$r('app.media.text11'),$r('app.media.text12'),$r('app.media.text3'),$r('app.media.text4'),$r('app.media.text5'),$r('app.media.text6')];
  @State isComplete: boolean = false;

  @Builder
  labelIcon(img: ResourceStr) {
    Column() {
      Row() {
        // 第一张图片，左对齐
        Image(img)
          .width(img.toString()===($r('app.media.text11').toString()||$r('app.media.text12').toString())?79:63)
          .height(img.toString()===($r('app.media.text11').toString()||$r('app.media.text12').toString())?44:22)
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
    .onClick(()=>{
      if (img.toString()===$r('app.media.text6').toString()) {
        router.pushUrl({url:'pages/aboutUs'})
      }
    })
  }

  build() {
    Stack({alignContent: Alignment.Bottom}) {
        Image($r('app.media.minePage'))
        Column(){
        ForEach(this.totalimgs, (item: Resource) => {
              this.labelIcon(item)
        })
      }.position({top:225,left:43})
    }
    }
}