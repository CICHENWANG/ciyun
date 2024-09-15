import { router } from '@kit.ArkUI'

@Entry
@Component
struct MakingFinishTao{
  build() {
    Column(){
      Column() {
        Image($r('app.media.back'))
          .width('5%')
          .height('auto')
          .aspectRatio(1)
          .position({
            top:'25%',
            left:'5%'
          })
          .onClick(()=>{//返回
            router.back()
          })
        Image($r('app.media.text_make_ci'))
          .width('25%')
          .position({
            top:'25%',
            left:'37%'
          })
      }
      .width('100%')
      .height('8%')
      .margin({
        top:'9%'
      })

      Stack() {
        Image($r("app.media.all_finish_background"))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Contain)
        Image($r('app.media.text_ci_donggua_white_lianhua_blue'))
          .width('55%')
          .position({
            top:'15%',
            left:'23%'
          })
        Image($r('app.media.text_tips'))
          .width('35%')
          .position({
            top:'20%',
            left:'33%'
          })
        Image($r('app.media.ci_donggua_white_lianhua_blue'))
          .width('50%')
          .position({
            top:'21%',
            left:'26%'
          })
        Image($r("app.media.text_finish_introduction_ci"))
          .width('70%')
          .position({
            top:'55%',
            left:'15%'
          })
      }
      .width('90%')
      .height('80%')
      .offset({
        y:'-3%'
      })

      Image($r("app.media.all_finish_button"))
        .width('50%')
        .position({
          top:'90%',
          left:'25%'
        })
        .onClick(()=>{
          router.pushUrl({ url: "pages/make" })
        })
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.background_make'), ImageRepeat.NoRepeat)
    .backgroundImageSize(ImageSize.Cover)
  }
}