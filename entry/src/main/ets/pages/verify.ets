import { router } from '@kit.ArkUI';
@Entry
@Preview
@Component
export default struct login {
  @State totalimgs: ResourceStr[] =
    [$r('app.media.verify_blank'),$r('app.media.verify_blank'),$r('app.media.verify_blank'),$r('app.media.verify_blank'),];
  @State agree:boolean=false
  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Image($r('app.media.verify'))
      Row(){
          Image(this.totalimgs[0])
            .width(51)
            .height(73)
            .objectFit(ImageFit.Contain)
          Blank()
            .layoutWeight(1) // 使 Blank 组件占据 Row 中剩余的空间
          Image(this.totalimgs[1])
            .width(51)
            .height(73)
            .objectFit(ImageFit.Contain)
          Blank()
            .layoutWeight(1) // 使 Blank 组件占据 Row 中剩余的空间
          Image(this.totalimgs[2])
            .width(51)
            .height(73)
            .objectFit(ImageFit.Contain)
          Blank()
            .layoutWeight(1) // 使 Blank 组件占据 Row 中剩余的空间
          Image(this.totalimgs[3])
            .width(51)
            .height(73)
            .objectFit(ImageFit.Contain)
      }.width(299)
      .height(73)
      .position({bottom:520,left:45})
      Image($r('app.media.return'))
        .width(41)
        .height(41)
        .position({ top: 51, left: 9 })
        .onClick(() => {
          router.back()
        })
    }
    .onKeyEvent((event:KeyEvent)=>{

        if (event.keyText.toString()=="KEYCODE_4") {
          console.log(event.keyText.toString()+"666")
          this.totalimgs[0]=$r('app.media.verify_text4')
        }
        else if (event.keyText.toString()=="KEYCODE_6") {
          this.totalimgs[1]=$r('app.media.verify_text6')
        }else if (event.keyText.toString()=="KEYCODE_9") {
          this.totalimgs[2]=$r('app.media.verify_text9')
        }else if (event.keyText.toString()=="KEYCODE_5") {
          this.totalimgs[3]=$r('app.media.verify_text5')
          router.pushUrl({url:"pages/Index"})
        }
    })
  }
}