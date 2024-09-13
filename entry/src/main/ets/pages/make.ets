import { router } from '@kit.ArkUI';

@Preview
@Component
export default struct make {
  aboutToAppear(): void {
    console.log('fhth');


  }
  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Image($r('app.media.make'))
      Image($r('app.media.make1'))
        .width(355)
        .height(140)
        .position({bottom:242,left:18})
      Image($r('app.media.make2'))
        .width(355)
        .height(140)
        .position({bottom:62,left:18})
    }
  }
}