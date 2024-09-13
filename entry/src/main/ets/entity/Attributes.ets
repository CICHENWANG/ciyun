export class Pos{
  public top:number
  public left:number

  constructor(top:number,left:number) {
    this.top=top
    this.left=left
  }
}

@Observed
export class Attributes{
  public key:number
  public background:string=''
  public attributePhoto:string
  public attributeText:string
  public backgroundPosition:Pos
  public photoPosition:Pos
  public textPosition:Pos
  public backgroundWidth:string=''
  public photoWidth:string=''

  constructor(k:number,b:string,aPhoto: string, aText: string, bPos: Pos, pPos: Pos, tPos: Pos,bgrW:string,photoW:string) {
    this.key=k
    this.background=b
    this.attributePhoto=aPhoto
    this.attributeText=aText
    this.backgroundPosition=bPos
    this.photoPosition=pPos
    this.textPosition=tPos
    this.backgroundWidth=bgrW
    this.photoWidth=photoW
  }
}