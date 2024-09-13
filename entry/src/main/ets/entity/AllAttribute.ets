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