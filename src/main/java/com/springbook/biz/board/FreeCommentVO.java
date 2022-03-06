package com.springbook.biz.board;

public class FreeCommentVO {
   private int fmSeq;
   private String fmTime;
   private String fmComment;
   private String fmNickname;
   private int seq;
   private int mSeq;
   
   public int getmSeq() {
	return mSeq;
}
public void setmSeq(int mSeq) {
	this.mSeq = mSeq;
}
public int getFmSeq() {
      return fmSeq;
   }
   public void setFmSeq(int fmSeq) {
      this.fmSeq = fmSeq;
   }
   public String getFmTime() {
      return fmTime;
   }
   public void setFmTime(String fmTime) {
      this.fmTime = fmTime;
   }
   public String getFmComment() {
      return fmComment;
   }
   public void setFmComment(String fmComment) {
      this.fmComment = fmComment;
   }
   public String getFmNickname() {
      return fmNickname;
   }
   public void setFmNickname(String fmNickname) {
      this.fmNickname = fmNickname;
   }
   public int getSeq() {
      return seq;
   }
   public void setSeq(int seq) {
      this.seq = seq;
   }
   @Override
   public String toString() {
      return "FreeCommentVO [fmSeq=" + fmSeq + ", fmTime=" + fmTime + ", fmComment=" + fmComment + ", fmNickname="
            + fmNickname + ", seq=" + seq + "]";
   }
   
}
   