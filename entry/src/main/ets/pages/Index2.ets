import Logger from '../common/utils/Logger'
import { resourceManager } from '@kit.LocalizationKit'
import { fileIo, picker } from '@kit.CoreFileKit'
import { CommonConstants } from '../common/constants/CommonConstants';
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';


//从相册选择图片, 返回图片的uri
//可以不用管后面的ui部分, 只要调用processImage方法, 就会自动跳转到系统相册,


@Entry
@Component
export default  struct Index2 {
  @State uris: Array<string> = [];
  // 1. 定义一个状态变量 uris，用于存储选择的图片的 URI

  processImage(): void {
    // 2. 定义一个名为 processImage 的方法，用于处理图片选择流程
    let photoSelectOptions = new picker.PhotoSelectOptions();
    // 3. 创建一个图片选择配置对象
    photoSelectOptions.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE;
    // 4. 设置图片选择配置的 MIME 类型为图片类型
    photoSelectOptions.maxSelectNumber = 1;
    // 5. 设置图片选择配置允许选择的最大图片数量为 1
    let photoPicker = new picker.PhotoViewPicker();
    // 6. 创建一个图片选择器对象
    photoPicker.select(photoSelectOptions, async (
      // 7. 使用图片选择器选择图片，并使用 Promise 处理选择结果
      err: BusinessError, photoSelectResult: picker.PhotoSelectResult) => {
      if (err) {
        // 8. 判断是否发生错误，如果发生错误则记录错误信息并返回
        Logger.error('MS_LITE_ERR: PhotoViewPicker.select failed with err: ' + JSON.stringify(err));
        return;
      }

      Logger.info('MS_LITE_LOG: PhotoViewPicker.select successfully, ' +
        'photoSelectResult uri: ' + JSON.stringify(photoSelectResult));
      // 9. 记录图片选择成功的信息
      this.uris = photoSelectResult.photoUris;
      // 10. 将选择的图片的 URI 存储到 uris 状态变量中
      Logger.info('MS_LITE_LOG: uri: ' + this.uris);
      // 11. 记录选择的图片 URI 到日志中
    })
  }


  /*
  build() {
    // 12. 定义一个名为 build 的方法，用于构建应用的界面
    Column(){ // 13. 使用 Column 组件垂直排列界面元素
      Text($r('app.string.EntryAbility_label')) // 14. 显示应用的标题，标题的文本来自资源文件
        .width(CommonConstants.FULL_PERCENT)
        .font({
          size: $r('app.float.All_title_font_size'),
          weight: CommonConstants.FONT_WEIGHT_700
        })
        .margin({
          top: $r('app.float.title_margin_top'),
          left: $r('app.float.title_margin_left'),
          bottom: $r('app.float.title_margin_bottom')
        })
      Image(this.uris[0]) // 15. 显示选择的图片，图片的路径来自 uris 状态变量
        .height($r('app.float.image_height'))
        .objectFit(ImageFit.Contain)
        .borderRadius($r('sys.float.corner_radius_level10'))
        .margin({
          bottom: $r('app.float.image_margin_bottom')
        })
      Button($r('app.string.Button_Title')) // 16. 显示一个按钮，按钮的文本来自资源文件
        .width($r('app.float.button_width'))
        .height($r('app.float.button_height'))
        .margin({
          top: $r('app.float.button_margin_top')
        })
        .onClick(() =>{
          // 17. 设置按钮的点击事件，点击按钮会调用 processImage 方法
          this.processImage()
        })
    }
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
  }

  */
  build() {
  }
}