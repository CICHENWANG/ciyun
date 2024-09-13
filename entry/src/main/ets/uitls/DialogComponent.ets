class Params {
  text: string = '';

  constructor(text: string) {
    this.text = text;
  }
}

@Builder
export function introductionText(params: Params) {
  Column() {
    if (params.text==='tao'){
      Stack() {
        Stack() {
          Image($r("app.media.introduction_background"))
            .width('100%')
            .height('100%')
            .objectFit(ImageFit.Contain)
          Image($r("app.media.introduction_background2"))
            .width('90%')
            .height('100%')
            .objectFit(ImageFit.Contain)

          Image($r('app.media.introduction_top'))
            .width('50%')
            .position({
              top:'-18%',
              left:'25%'
            })
          Image($r('app.media.text_meiping'))
            .width('23%')
            .position({
              top:'14%',
              left:'38%'
            })
          Image($r('app.media.text_meiping_introduction'))
            .width('80%')
            .position({
              top:'27%',
              left:'8%'
            })

          Image($r("app.media.introduction_meiping1"))
            .width('35%')
            .position({
              left:'13%',
              bottom:'8%'
            })
          Image($r("app.media.introduction_meiping2"))
            .width('35%')
            .position({
              left:'35%',
              bottom:'8%'
            })
          Image($r("app.media.introduction_meiping3"))
            .width('25%')
            .position({
              left:'63%',
              bottom:'9.5%'
            })
        }
        .width('70%')
        .height('50%')
      }
      .width('100%')
    }
    else {
      Stack() {
        Image($r("app.media.introduction_background"))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Contain)
        Image($r("app.media.introduction_background2"))
          .width('90%')
          .height('100%')
          .objectFit(ImageFit.Contain)

        Image($r('app.media.introduction_top'))
          .width('50%')
          .position({
            top:'-18%',
            left:'25%'
          })
        Image($r('app.media.text_donggua'))
          .width('23%')
          .position({
            top:'14%',
            left:'38%'
          })
        Image($r('app.media.text_donggua_introduction'))
          .width('75%')
          .position({
            top:'25%',
            left:'10%'
          })

        Image($r("app.media.introduction_donggua1"))
          .width('18%')
          .position({
            left:'20%',
            bottom:'10%'
          })
        Image($r("app.media.introduction_donggua2"))
          .width('45%')
          .position({
            left:'28%',
            bottom:'5%'
          })
        Image($r("app.media.introduction_donggua3"))
          .width('25%')
          .position({
            left:'60%',
            bottom:'9%'
          })
      }
      .width('70%')
      .height('50%')
    }
  }
}