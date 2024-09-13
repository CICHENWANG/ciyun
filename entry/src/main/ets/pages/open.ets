import { router } from '@kit.ArkUI';
@Entry
@Preview
@Component
export default struct open {


  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Image($r('app.media.open'))
      Image($r('app.media.open2'))
        .width(180)
        .height(38)
        .position({bottom:50,left:110})
        .onClick(()=>{
          router.pushUrl({url:"pages/login"})
        })

  }
}
}