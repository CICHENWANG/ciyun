import { introductionText } from '../uitls/DialogComponent'
import { BusinessError } from '@kit.BasicServicesKit';
import { ComponentContent, promptAction, router } from '@kit.ArkUI';
import { StepBar } from '../../ets/entity/StepBar'
import { Attributes,Pos } from '../../ets/entity/Attributes'

class AllAttribute{
  public shape:string
  public color:string
  public draw:string
  public drawColor:string
  public stone:string=''

  constructor(st:string='',s:string='',c:string='',d:string='',dc:string='') {
    this.shape=s
    this.color=c
    this.draw=d
    this.drawColor=dc
    const splits=st.split('_')
    if (splits.length===3) {
      this.stone=splits[0]+'_'+splits[2]
    }
  }
}
class Params {
  text: string = '';

  constructor(text: string) {
    this.text = text;
  }
}

const CiStepBars:StepBar[]=[
  new StepBar(0,['making_choose_stone_active','making_choose_shape','making_choose_color','making_draw','making_draw_color'],
    'text_choose_stone','text_stone_finish'),
  new StepBar(1,['making_choose_stone','making_choose_shape_active','making_choose_color','making_draw','making_draw_color'],
    'text_choose_shape','text_shape_finish'),
  new StepBar(2,['making_choose_stone','making_choose_shape','making_choose_color_active','making_draw','making_draw_color'],
    'text_choose_ci_color','text_ci_color_finish'),
  new StepBar(3,['making_choose_stone','making_choose_shape','making_choose_color','making_draw_active','making_draw_color'],
    'text_choose_draw','text_draw_finish'),
  new StepBar(4,['making_choose_stone','making_choose_shape','making_choose_color','making_draw','making_draw_color_active'],
    'text_choose_draw_color','text_draw_color_finish'),
]
const stoneAttributes:Attributes[]=[
  new Attributes(0,'bottle_background_ci','ci_stone_tao','陶土',new Pos(60,0),new Pos(88,28),new Pos(180,40),'35%','19%'),
  new Attributes(1,'bottle_background_ci','ci_stone_gaoling','高岭土',new Pos(40,115),new Pos(65,142),new Pos(160,165),'35%','19%'),
  new Attributes(2,'bottle_background_ci','ci_stone_ci','瓷石',new Pos(60,230),new Pos(92,258),new Pos(180,273),'35%','19%'),
]
const shapeAttributes:Attributes[]=[
  new Attributes(0,'bottle_background','ci_donggua_white','text_ci_donggua',new Pos(60,0),new Pos(80,37),new Pos(180,38),'35%','16%'),
  new Attributes(1,'bottle_background','ci_tianqiu_white','text_ci_tianqiu',new Pos(40,115),new Pos(53,143),new Pos(160,155),'35%','20%'),
  new Attributes(2,'bottle_background','ci_meiren_white','text_ci_meiren',new Pos(60,230),new Pos(71,262),new Pos(180,271),'35%','18%'),
]
const colorAttributes:Attributes[]=[
  new Attributes(0,'bottle_color_background','ci_color_black','黑瓷',new Pos(83,3),new Pos(110,0),new Pos(0,0),'23%','20%'),
  new Attributes(1,'bottle_color_background','ci_color_red','红瓷',new Pos(63,73),new Pos(90,71.25),new Pos(0,0),'23%','20%'),
  new Attributes(2,'bottle_color_background','ci_color_white','白瓷',new Pos(53,145),new Pos(80,142.5),new Pos(0,0),'23%','20%'),
  new Attributes(3,'bottle_color_background','ci_color_blue','青瓷',new Pos(63,217),new Pos(90,213.75),new Pos(0,0),'23%','20%'),
  new Attributes(4,'bottle_color_background','ci_color_yellow','黄瓷',new Pos(83,287),new Pos(110,285),new Pos(0,0),'23%','20%'),
]
const drawAttributes:Attributes[]=[
  new Attributes(0,'bottle_background','ci_draw_hulu','text_ci_hulu',new Pos(60,0),new Pos(90,40),new Pos(180,38),'35%','13%'),
  new Attributes(1,'bottle_background','ci_draw_lianhua','text_ci_lianhua',new Pos(40,115),new Pos(68,143),new Pos(160,155),'35%','20%'),
  new Attributes(2,'bottle_background','ci_draw_yuanyang','text_ci_yuanyang',new Pos(60,230),new Pos(100,260),new Pos(180,271),'35%','20%'),
]
const drawColor:Attributes[]=[
  new Attributes(0,'bottle_color_background','ci_draw_green','绿色',new Pos(83,2),new Pos(110,0),new Pos(0,0),'23%','20%'),
  new Attributes(1,'bottle_color_background','ci_draw_red','红色',new Pos(63,74),new Pos(90,71.25),new Pos(0,0),'23%','20%'),
  new Attributes(2,'bottle_color_background','ci_draw_blue','蓝色',new Pos(53,145),new Pos(80,142.5),new Pos(0,0),'23%','20%'),
  new Attributes(3,'bottle_color_background','ci_draw_yellow','黄色',new Pos(63,217),new Pos(90,213.75),new Pos(0,0),'23%','20%'),
  new Attributes(4,'bottle_color_background','ci_draw_black','黑色',new Pos(83,287),new Pos(110,285),new Pos(0,0),'23%','20%'),
]

@Entry
@Component
struct Index {
  @State message:string='ci'
  @State currentStep:number=0
  @State stepBars:StepBar[]=CiStepBars
  @State attr:AllAttribute=new AllAttribute(stoneAttributes[1].attributePhoto)
  @State stoneAttributes:Attributes[]=stoneAttributes
  @State shapeAttributes:Attributes[]=shapeAttributes
  @State colorAttributes:Attributes[]=colorAttributes
  @State drawAttributes:Attributes[]=drawAttributes
  @State drawColor:Attributes[]=drawColor

  build() {
    Column() {
      //titleBar
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
      }.width('100%').height('8%')
      //stepBar
      Column() {
        Row(){
          ForEach(this.stepBars[this.currentStep].stepIcons,(item:string)=>{
            if(item.includes('active')){
              Image($r(`app.media.${item}`))
                .height('60%')
                .margin('15px')
            }
            else{
              Image($r(`app.media.${item}`))
                .height('50%')
                .margin('15px')
            }
          })
        }
      }.width('100%').height('5%')
      Column() {
        Image($r(`app.media.${this.stepBars[this.currentStep].title}`))
          .width('50%')
      }.width('100%').height('8%')
      //瓷器图片
      Column() {
        Stack(){
          if (this.attr.shape===''){
            Image($r(`app.media.${this.attr.stone}`))
              .width('80%')
              .position({
                top:25
              })
          }
          else if(this.attr.color===''){
            Image($r(`app.media.${this.attr.shape}`))
              .width('70%')
              .position({
                top:0
              })
          }
          else if (this.attr.draw===''){
            Image($r(`app.media.${this.attr.color}`))
              .width('70%')
              .position({
                top:0
              })
          }
          else if (this.attr.drawColor===''){
            Image($r(`app.media.${this.attr.draw}`))
              .width('70%')
              .position({
                top:0
              })
          }
          else {
            Image($r(`app.media.${this.attr.drawColor}`))
              .width('70%')
              .position({
                top:0
              })
          }
        }
        .onClick(() => {
          let uiContext = this.getUIContext();
          let promptAction = uiContext.getPromptAction();
          let contentNode = new ComponentContent(uiContext, wrapBuilder(introductionText), new Params(this.message));
          let options: promptAction.BaseDialogOptions = {
            alignment: DialogAlignment.Center
          };
          try {
            promptAction.openCustomDialog(contentNode, options);
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`OpenCustomDialog args error code is ${code}, message is ${message}`);
          }
        })
        //点击查看介绍
        Image($r('app.media.text_click_introduction'))
          .width('25%')
          .position({
            bottom:-10,
            left:'37%'
          })
      }.width('100%').height('45%')
      //选择瓷器属性
      Column() {
        Stack(){
          Image($r('app.media.bottom_background'))
            .position({
              top:'20px'
            })
          Image($r('app.media.bottom_background2'))
            .position({
              top:100
            })
          //选石
          if (this.currentStep===0){
            ForEach(this.stoneAttributes,(item:Attributes)=>{
              if (item.attributePhoto.split('_')[2]===this.attr.stone.split('_')[1]){
                Image($r('app.media.bottle_background_ci_active'))
                  .width(item.backgroundWidth)
                  .position({
                    top:item.backgroundPosition.top,
                    left:item.backgroundPosition.left
                  })
              }
              else {
                Image($r(`app.media.${item.background}`))
                  .width(item.backgroundWidth)
                  .position({
                    top:item.backgroundPosition.top-7,
                    left:item.backgroundPosition.left
                  })
              }

              Image($r(`app.media.${item.attributePhoto}`))
                .width(item.photoWidth)
                .position({
                  top:item.photoPosition.top,
                  left:item.photoPosition.left
                })
                .onClick(()=>{
                  const splits=item.attributePhoto.split('_')
                  this.attr.stone=splits[0]+'_'+splits[2]
                })
            })
          }
          //选型
          else if (this.currentStep===1){
            ForEach(this.shapeAttributes,(item:Attributes)=>{
              if (item.attributePhoto===this.attr.shape){
                Image($r('app.media.bottle_background_active'))
                  .width(item.backgroundWidth)
                  .position({
                    top:item.backgroundPosition.top,
                    left:item.backgroundPosition.left
                  })
              }
              else {
                Image($r(`app.media.${item.background}`))
                  .width(item.backgroundWidth)
                  .position({
                    top:item.backgroundPosition.top-7,
                    left:item.backgroundPosition.left
                  })
              }

              Image($r(`app.media.${item.attributePhoto}`))
                .width(item.photoWidth)
                .position({
                  top:item.photoPosition.top,
                  left:item.photoPosition.left
                })
                .onClick(()=>{
                  this.attr.shape=item.attributePhoto
                })
              Image($r(`app.media.${item.attributeText}`))
                .width('15%')
                .position({
                  top:item.textPosition.top,
                  left:item.textPosition.left
                })
            })
          }
          //选色
          else if(this.currentStep===2){
            ForEach(this.colorAttributes,(item:Attributes)=>{
              if (item.attributePhoto.split('_')[2]===this.attr.color.split('_')[2]){
                Image($r('app.media.bottle_color_background_active'))
                  .width(item.backgroundWidth)
                  .position({
                    top:item.backgroundPosition.top+8,
                    left:item.backgroundPosition.left-8
                  })
              }
              else {
                Image($r(`app.media.${item.background}`))
                  .width(item.backgroundWidth)
                  .position({
                    top:item.backgroundPosition.top,
                    left:item.backgroundPosition.left
                  })
              }
              Image($r(`app.media.${item.attributePhoto}`))
                .width(item.photoWidth)
                .position({
                  top:item.photoPosition.top,
                  left:item.photoPosition.left
                })
                .onClick(()=>{
                  const color=item.attributePhoto.split('_')
                  const words=this.attr.shape.split('_')
                  this.attr.color=words[0]+'_'+words[1]+'_'+color[2]
                })
            })
          }
          //彩绘
          else if (this.currentStep===3){
            ForEach(this.drawAttributes,(item:Attributes)=>{
              if (item.attributePhoto.split('_')[2]===this.attr.draw.split('_')[3]){
                Image($r('app.media.bottle_background_active'))
                  .width(item.backgroundWidth)
                  .position({
                    top:item.backgroundPosition.top+8,
                    left:item.backgroundPosition.left
                  })
              }
              else {
                Image($r(`app.media.${item.background}`))
                  .width(item.backgroundWidth)
                  .position({
                    top:item.backgroundPosition.top,
                    left:item.backgroundPosition.left
                  })
              }
              Image($r(`app.media.${item.attributePhoto}`))
                .width(item.photoWidth)
                .position({
                  top:item.photoPosition.top,
                  left:item.photoPosition.left
                })
                .onClick(()=>{
                  //  修改attr   改变显示的瓷器图片
                  const draw=item.attributePhoto.split('_')
                  this.attr.draw=this.attr.color+'_'+draw[2]
                })
              Image($r(`app.media.${item.attributeText}`))
                .width('15%')
                .position({
                  top:item.textPosition.top,
                  left:item.textPosition.left
                })
            })
          }
          //彩绘颜色
          else if (this.currentStep===4){
            ForEach(this.drawColor,(item:Attributes)=>{
              if (item.attributePhoto.split('_')[2]===this.attr.drawColor.split('_')[4]){
                Image($r('app.media.bottle_color_background_active'))
                  .width(item.backgroundWidth)
                  .position({
                    top:item.backgroundPosition.top+8,
                    left:item.backgroundPosition.left-8
                  })
              }
              else {
                Image($r(`app.media.${item.background}`))
                  .width(item.backgroundWidth)
                  .position({
                    top:item.backgroundPosition.top,
                    left:item.backgroundPosition.left
                  })
              }
              Image($r(`app.media.${item.attributePhoto}`))
                .width(item.photoWidth)
                .position({
                  top:item.photoPosition.top,
                  left:item.photoPosition.left
                })
                .onClick(()=>{
                  const color=item.attributePhoto.split('_')
                  const words=this.attr.shape.split('_')
                  this.attr.color=words[0]+'_'+words[1]+'_'+color[2]
                })
            })
          }
          //finish back button（返回上一步）    currentStep--
          if(this.currentStep>0){
            Image($r('app.media.finish_back'))
              .width('35')
              .position({
                top:'85%',
                left:'17%'
              })
              .onClick(()=>{
                this.currentStep--
                if (this.currentStep===0) {
                  this.attr.shape=''
                }
                else if(this.currentStep===1){
                  this.attr.color=''
                }
                else if (this.currentStep===2){
                  this.attr.draw=''
                }
                else if (this.currentStep===3){
                  this.attr.drawColor=''
                }
                else {

                }
              })
          }
          Image($r('app.media.finish_button'))
            .width('50%')
            .position({
              top:'80%',
              left:'25%'
            })
          Image($r(`app.media.${this.stepBars[this.currentStep].finishText}`))
            .width('25%')
            .position({
              top:'87%',
              left:'37%'
            })
            .onClick(()=>{
              if (this.currentStep+1>4){
                this.currentStep=4
              }
              this.currentStep++
              if (this.currentStep===1) {
                // const words=this.attr.shape.split('_')
                // this.attr.shape=words[0]+'_'+words[1]+'_tianqiu'
                //ci_tianqiu_white
                this.attr.shape='ci_tianqiu_white'
              }
              else if(this.currentStep===2){
                //ci_tianqiu_white
                this.attr.color=this.attr.shape
              }
              else if(this.currentStep===3){
                //ci_tianqiu_white_lianhua
                this.attr.draw=this.attr.color+'_lianhua'
              }
              else if (this.currentStep===4){
                //ci_tianqiu_white_lianhua_blue
                this.attr.drawColor=this.attr.draw+'_blue'
              }
              else {//到制作完成页面
                router.pushUrl({ url: "pages/MakingFinishCi" })
              }
            })
        }

      }.width('100%').height('34%')

    }.width('100%')
    .backgroundImage($r('app.media.background_make'), ImageRepeat.NoRepeat)
    .backgroundImageSize(ImageSize.Cover)
  }
}