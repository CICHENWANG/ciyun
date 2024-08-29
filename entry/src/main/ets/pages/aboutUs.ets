import { router } from '@kit.ArkUI'

@Entry
@Component
struct aboutUs {
  build() {
    Stack(){
      Image($r('app.media.aboutus'))
      Image($r('app.media.return'))
        .width(41)
        .height(41)
        .position({top:51,left:9})
        .onClick(()=>{
          router.back()
        })
    }
  }
}