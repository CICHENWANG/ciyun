import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {


    let windowClass: window.Window;
    windowStage.getMainWindow((err, data) => {
      // 1.获取应用主窗口
      windowClass = data;
      // 2.设置导航栏、状态栏不显示。
      windowClass.setWindowSystemBarEnable([], (err) => {

      });
      // 3.设置全屏
      windowClass.setWindowLayoutFullScreen(true).then(() => {

      })
      // 4.获取底部导航栏高度，此时的高度单位是px
      let navigationHeight = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).bottomRect.height
      PersistentStorage.PersistProps([{
        key: "navigationHeight", defaultValue: navigationHeight
      }])
      windowStage.loadContent('pages/Index', (err, data) => {

      });
    })

  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
