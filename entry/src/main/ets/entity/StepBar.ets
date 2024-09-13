///陶/瓷   步骤显示
export class StepBar{
  public step:number
  public stepIcons:string[]
  public title:string
  public finishText:string

  constructor(step:number,icons:string[],title:string,finish:string) {
    this.step=step
    this.stepIcons=icons
    this.title=title
    this.finishText=finish
  }
}