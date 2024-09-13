import { router } from '@kit.ArkUI';
@Entry
@Preview
@Component
export default struct login {

@State agree:boolean=false
  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Image($r('app.media.login'))
      Image($r('app.media.login_button'))
        .width(279)
        .height(41)
        .position({bottom:425,left:58})
        .onClick(()=>{
          router.pushUrl({url:"pages/verify"})
        })
      Row(){
          Image(this.agree==true?$r("app.media.agree"):$r("app.media.unagree"))
            .width(11)
            .height(11)
            .onClick(()=>{
              this.agree = ! this.agree
            })
        Blank()
          .layoutWeight(1) // 使 Blank 组件占据 Row 中剩余的空间
        Image($r("app.media.login_text"))
            .width(223)
            .height(29)
            .objectFit(ImageFit.Contain)
      }.width(242)
      .height(29)
      .position({bottom:375,left:70})
    }
  }
}