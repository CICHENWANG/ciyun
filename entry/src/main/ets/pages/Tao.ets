import { router } from '@kit.ArkUI';
import { introductionText } from '../uitls/DialogComponent'
import { BusinessError } from '@kit.BasicServicesKit';
import { ComponentContent, promptAction } from '@kit.ArkUI';
import { StepBar } from '../../ets/entity/StepBar'
import { Attributes,Pos } from '../../ets/entity/Attributes'

export class AllAttribute{
  public shape:string
  public color:string
  public draw:string
  public drawColor:string
  public stone:string

  constructor(s:string='',c:string='',d:string='',dc:string='',st:string='') {
    this.shape=s
    this.color=c
    this.draw=d
    this.drawColor=dc
    this.stone=st
  }
}

class Params {
  text: string = '';

  constructor(text: string) {
    this.text = text;
  }
}

const TaoStepBars:StepBar[]=[
  new StepBar(0,['making_choose_shape_active','making_choose_color','making_draw','making_draw_color'],'text_choose_shape','text_shape_finish'),
  new StepBar(1,['making_choose_shape','making_choose_color_active','making_draw','making_draw_color'],'text_choose_color','text_tao_color_finish'),
  new StepBar(2,['making_choose_shape','making_choose_color','making_draw_active','making_draw_color'],'text_choose_draw','text_draw_finish'),
  new StepBar(3,['making_choose_shape','making_choose_color','making_draw','making_draw_color_active'],'text_choose_draw_color','text_draw_color_finish'),
]
const shapeAttributes:Attributes[]=[
  new Attributes(0,'bottle_background','bottle_suantou_white','text_bottle_suantou',new Pos(60,0),new Pos(75,24),new Pos(180,40),'35%','23%'),
  new Attributes(1,'bottle_background','bottle_meiping_white','text_bottle_mei',new Pos(40,115),new Pos(53,138),new Pos(160,153),'35%','23%'),
  new Attributes(2,'bottle_background','bottle_mingzhu_white','text_bottle_mingzhu',new Pos(60,230),new Pos(76,253),new Pos(180,273),'35%','23%'),
]
const colorAttributes:Attributes[]=[
  new Attributes(0,'bottle_color_background','bottle_color_black','黑陶',new Pos(83,3),new Pos(110,0),new Pos(0,0),'23%','20%'),
  new Attributes(1,'bottle_color_background','bottle_color_red','红陶',new Pos(63,73),new Pos(90,71.25),new Pos(0,0),'23%','20%'),
  new Attributes(2,'bottle_color_background','bottle_color_white','白陶',new Pos(53,145),new Pos(80,142.5),new Pos(0,0),'23%','20%'),
  new Attributes(3,'bottle_color_background','bottle_color_blue','蓝陶',new Pos(63,217),new Pos(90,213.75),new Pos(0,0),'23%','20%'),
  new Attributes(4,'bottle_color_background','bottle_color_gray','灰陶',new Pos(83,287),new Pos(110,285),new Pos(0,0),'23%','20%'),
]
const drawAttributes:Attributes[]=[
  new Attributes(0,'bottle_background','bottle_draw_sanjiao','text_bottle_sanjiao',new Pos(60,0),new Pos(114,22),new Pos(180,40),'35%','23%'),
  new Attributes(1,'bottle_background','bottle_draw_hui','text_bottle_hui',new Pos(30,115),new Pos(84,137),new Pos(150,153),'35%','23%'),
  new Attributes(2,'bottle_background','bottle_draw_wangge','text_bottle_wangge',new Pos(60,230),new Pos(114,253),new Pos(180,273),'35%','23%'),
]
const drawColor:Attributes[]=[
  new Attributes(1,'bottle_color_background','bottle_draw_white','象牙白',new Pos(68,53),new Pos(95,50.25),new Pos(0,0),'23%','20%'),
  new Attributes(2,'bottle_color_background','bottle_draw_red','赭红',new Pos(53,145),new Pos(80,142.5),new Pos(0,0),'23%','20%'),
  new Attributes(3,'bottle_color_background','bottle_draw_black','玄色',new Pos(68,237),new Pos(95,234.75),new Pos(0,0),'23%','20%'),
]

@Entry
@Component
struct Tao {
  @State message:string='tao'
  @State currentStep:number=0
  @State stepBars:StepBar[]=TaoStepBars
  @State attr:AllAttribute=new AllAttribute(shapeAttributes[1].attributePhoto)
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
        Image($r('app.media.text_make_tao'))
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
          if(this.attr.color===''){
            Image($r(`app.media.${this.attr.shape}`))
              .width('100%')
              .aspectRatio(1)// 假设宽高比为1:1
              .position({
                top:-35
              })
          }
          else if (this.attr.draw===''){
            Image($r(`app.media.${this.attr.color}`))
              .width('100%')
              .aspectRatio(1)// 假设宽高比为1:1
              .position({
                top:-35
              })
          }
          else if (this.attr.drawColor===''){
            Image($r(`app.media.${this.attr.draw}`))
              .width('100%')
              .aspectRatio(1)// 假设宽高比为1:1
              .position({
                top:-35
              })
          }
          else {
            Image($r(`app.media.${this.attr.drawColor}`))
              .width('100%')
              .aspectRatio(1)// 假设宽高比为1:1
              .position({
                top:-35
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
      }.width('100%').height('45%')
      //选择瓷器属性
      Column() {
        Stack(){
          //动物纹、几何纹背景
          // if (this.currentStep===2){
          //   //纹样
          //   Image($r('app.media.bottom_draw_background'))
          //     .position({
          //       top:5
          //     })
          // }
          // else{
          //   Image($r('app.media.bottom_background'))
          //     .position({
          //       top:5
          //     })
          // }
          Image($r('app.media.bottom_background'))
            .position({
              top:5
            })
          Image($r('app.media.bottom_background2'))
            .position({
              top:100
            })
          //选型
          if (this.currentStep===0){
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
          else if(this.currentStep===1){
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
          //花纹  背景点击
          else if (this.currentStep===2){
            ForEach(this.drawAttributes,(item:Attributes)=>{
              //此处用的是bgrWidth，和位置  因为复制的是选型的属性
              if (item.attributePhoto.split('_')[2]===this.attr.draw.split('_')[3]){
                Image($r('app.media.bottle_background_active'))
                  .width(item.backgroundWidth)
                  .position({
                    top:item.backgroundPosition.top+8,
                    left:item.backgroundPosition.left
                  })
                  .onClick(()=>{
                    const draw=item.attributePhoto.split('_')
                    this.attr.draw=this.attr.color+'_'+draw[2]
                  })
              }
              else {
                Image($r(`app.media.${item.background}`))
                  .width(item.backgroundWidth)
                  .position({
                    top:item.backgroundPosition.top,
                    left:item.backgroundPosition.left
                  })
                  .onClick(()=>{
                    const draw=item.attributePhoto.split('_')
                    this.attr.draw=this.attr.color+'_'+draw[2]
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
          //纹样颜色
          else if(this.currentStep===3){
            ForEach(this.drawColor,(item:Attributes)=>{
              if (item.attributePhoto.split('_')[2]===this.attr.drawColor.split('_')[4]){
                Image($r('app.media.bottle_color_background_active'))
                  .width(item.backgroundWidth)
                  .position({
                    top:item.backgroundPosition.top+8,
                    left:item.backgroundPosition.left-9
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
                  this.attr.drawColor=this.attr.draw+'_'+color[2]
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
                  this.attr.color=''
                }
                else if(this.currentStep===1){
                  this.attr.draw=''
                }
                else if (this.currentStep===2){
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
              if (this.currentStep+1>3){
                this.currentStep=3
              }
              this.currentStep++
              if (this.currentStep===1) {
                const words=this.attr.shape.split('_')
                //bottle_meiping_white
                this.attr.color=words[0]+'_'+words[1]+'_white'
              }
              else if(this.currentStep===2){
                //bottle_meiping_red_hui
                this.attr.draw=this.attr.color+'_hui'
              }
              else if(this.currentStep===3){
                //bottle_meiping_red_hui_red
                this.attr.drawColor=this.attr.draw+'_red'
              }
              else {//到制作完成页面
                router.pushUrl({ url: "pages/MakingFinishTao" })
              }
            })
        }

      }.width('100%').height('34%')

    }.width('100%')
    .backgroundImage($r('app.media.background_make'), ImageRepeat.NoRepeat)
    .backgroundImageSize(ImageSize.Cover)
  }
}